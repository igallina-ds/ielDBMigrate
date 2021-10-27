import xlrd
import pyodbc

# Fazer a inclusao do SQL ou do DUMP (sys.argv[1]) no Banco antes de começar
# Limpar coluna prio e cadastrado se houver
# Precisa haver uma unidade do IEL cadastrada

book = xlrd.open_workbook('sne_dump_long.xlsx')
# Se for parametro da chamada
# book = xlrd.open_workbook(sys.argv[1])
sheet = book.sheet_by_index(0)

# import ipdb; ipdb.set_trace()

# Connect to database
connection = pyodbc.connect(r'DRIVER={ODBC Driver 17 for SQL Server}; SERVER=localhost,1433; DATABASE=IEL_Estagio_PRD; uid=sa; pwd=reallyStrongPwd1234#;')
cursor = connection.cursor()
cursor.execute("USE IEL_Estagio_PRD")

def select_query(query):
    # print(f"         {query}")
    result = list(cursor.execute(query))
    return result

def commit_query(query):
    print(f"         {query}")
    cursor.execute(query)
    connection.commit()

def set_query(query):
    # print(f"         {query}")
    cursor.execute(query)

def check_or_insert_into_table(table, column_to_check, id_value, columns_to_insert, values_to_insert):
    if id_value != None:
        found = select_query(f"SELECT ID FROM {table} WHERE {column_to_check} = '{id_value}'")
        if len(found) == 0:
            commit_query(f"INSERT INTO {table} ({columns_to_insert}) VALUES ({values_to_insert})")

def sanitize_entry(row):
    for i, column in enumerate(row):
        column.value = column.value.strip()
        if "'" in column.value:
            set_query("SET QUOTED_IDENTIFIER OFF;")
            column.value = select_query(f"SELECT REPLACE(\"{column.value}\", \"'\", \"\")")
            set_query("SET QUOTED_IDENTIFIER ON;")
            column.value = column.value[0][0]
    return row

with connection:
    # Seleciona IEL Sao Paulo
    iel_id = select_query("SELECT ID FROM iel_units WHERE cnpj = '33938861000336'")
    iel_id = iel_id[0][0]

    # Processa o XLS e insere no BD
    for i, row in enumerate(sheet.get_rows()):
        if i != 0:
            row = sanitize_entry(row)

            inst_ensino = dict(
                CNPJ = row[0].value,
                RAZAO = row[1].value,
                FANTASIA = row[2].value
            )
            campus = dict(
                UNIDADE = row[3].value,
                SIGLA = row[4].value,
                EMAIL = row[5].value,
                TELEFONE = row[6].value
            )
            cidade = dict(
                NAME = row[8].value,
                IBGE = 1,
                UF = row[7].value
            )
            endereco = dict(
                CIDADE = row[8].value,
                CEP = row[9].value,
                LOGRADOURO = row[10].value,
                BAIRRO = row[11].value
            )
            responsavel = dict(
                NOME_RESPONSAVEL = row[12].value,
                CPF_RESP = row[13].value,
                TELEFONE_RESP = row[14].value,
                EMAIL_RESP = row[15].value,
                DATA_NASCIMENTO_RESP = row[16].value,
                CARGO_RESP = row[17].value
            )
            curso = dict(
                NIVEL = row[18].value,
                CURSO = row[19].value,
                DURACAO = row[20].value,
                DT_LIBERACAO = row[21].value,
                CARGA_HORARIA = row[22].value,
                PERIODO_MAX = row[23].value,
                PERIODICIDADE = row[24].value,
                RESPONSAVEL_CURSO = row[25].value,
                TURNO = row[26].value,
                ESTAGIO_OBRIGATORIO = row[27].value,
                REGISTRO_CONSELHO = row[28].value
            )

            # Insere Cidades
            check_or_insert_into_table("cities", "NAME", f"{cidade['NAME']}", "NAME, IBGE, UF", f"'{cidade['NAME']}', {cidade['IBGE']}, '{cidade['UF']}'")

            # Prepara pra inserir Endereços
            cidade_end_id = select_query(f"SELECT ID FROM cities WHERE name = '{cidade['NAME']}'")
            cidade_end_id = cidade_end_id[0][0]
            # Insere Endereços
            check_or_insert_into_table("addresses", "POSTAL_CODE", f"{endereco['CEP']}", "POSTAL_CODE, DISTRICT, NUMBER, COMPLEMENT, CITY_ID", f"'{endereco['CEP']}', '{endereco['LOGRADOURO']}', NULL, '{endereco['BAIRRO']}', '{cidade_end_id}'")

            # Insere Responsavel
            check_or_insert_into_table("responsible", "RESPONSIBLE_CPF", f"{responsavel['CPF_RESP']}", "responsible_name, responsible_cpf, responsible_phone, responsible_email, responsible_birthday_date, responsible_occupation", f"'{responsavel['NOME_RESPONSAVEL']}', '{responsavel['CPF_RESP']}', '{responsavel['TELEFONE_RESP']}', '{responsavel['EMAIL_RESP']}', CONVERT(DATETIME2, '{responsavel['DATA_NASCIMENTO_RESP']}', 103), '{responsavel['CARGO_RESP']}'")
            resp_id = select_query(f"SELECT ID FROM responsible WHERE responsible_cpf = '{responsavel['CPF_RESP']}'")
            resp_id = resp_id[0][0]

            # Prepara pra inserir Instituicao de Ensino
            endereco_id = select_query(f"SELECT ID FROM addresses WHERE postal_code = '{endereco['CEP']}'")
            endereco_id = endereco_id[0][0]
            # Insere Instituicao de Ensino
            check_or_insert_into_table("educational_institution1", "cnpj", inst_ensino['CNPJ'], "cnpj, company_name, fantasy_name, address_id, iel_unit_id", f"'{inst_ensino['CNPJ']}', '{inst_ensino['RAZAO']}', '{inst_ensino['FANTASIA']}', '{endereco_id}', '{iel_id}'")
            # associa inst_ensino_endereco
            
            # Prepara pr inserir Campus
            inst_ensino_id = select_query(f"SELECT ID FROM educational_institution1 WHERE cnpj = '{inst_ensino['CNPJ']}'")
            inst_ensino_id = inst_ensino_id[0][0]
            # Insere Campus
            check_or_insert_into_table("campi", "name", campus['UNIDADE'], "name, initials, phone, address_id, educational_institution_id", f"'{campus['UNIDADE']}', '{campus['SIGLA']}', '{campus['TELEFONE']}', '{endereco_id}', '{inst_ensino_id}'")
            
            # Prepara pra inserir Curso
            campus_id = select_query(f"SELECT ID FROM campi WHERE name = '{campus['UNIDADE']}'")
            campus_id = campus_id[0][0]
            # Insere Curso
            set_query("SET IDENTITY_INSERT dbo.courses ON;")
            check_or_insert_into_table("courses", "name", f"{curso['CURSO']}", "name, frequency, shift, duration, from_which_period_is_released, maximum_weekly_hourly_allowed, maximum_month_internship_period, is_record_advice_supervisor, level, code, mandatory_internship, modality, campi_id, educational_institution_id", f"'{curso['CURSO']}', '{curso['PERIODICIDADE']}', 1, {curso['DURACAO']}, {curso['DT_LIBERACAO']}, {curso['CARGA_HORARIA']}, {curso['PERIODO_MAX']}, 1, '{curso['NIVEL']}', 1, 1, 1, '{campus_id}', '{inst_ensino_id}'")
            set_query("SET IDENTITY_INSERT dbo.courses OFF;")

            # Prepara pra inserir associacoes
            course_id = select_query(f"SELECT ID FROM courses WHERE name = '{curso['CURSO']}'")
            course_id = course_id[0][0]
            # associa campus_responsavel
            commit_query(f"INSERT INTO campi_responsible (campi_id, responsible_id) VALUES ('{campus_id}', '{resp_id}')")
            # associa campus_endereco
            commit_query(f"INSERT INTO educational_institution_responsible (educational_institution_id, responsible_id) VALUES ('{inst_ensino_id}', '{resp_id}')")
            # associa curso_responsavel
            commit_query(f"INSERT INTO courses_responsible (courses_id, responsible_id) VALUES ('{course_id}', '{resp_id}')")

        print(f"{i}  >>>           ")

# Finaliza a conexao com o BD
cursor.close()
connection.close()

# Finaliza execucao
print("Fim do arquivo")