import xlrd
import pyodbc
#import sqlalchemy

# Fazer a inclusao do SQL ou do DUMP (sys.argv[1]) no Banco antes de começar
# Limpar coluna prio e cadastrado se houver
# Precisa haver uma unidade do IEL cadastrada

book = xlrd.open_workbook('hub_iel_dump_new.xlsx')
# Se for parametro da chamada
# book = xlrd.open_workbook(sys.argv[1])
sheet = book.sheet_by_index(0)

# import ipdb; ipdb.set_trace()

# Connect to database
connection = pyodbc.connect(r'DRIVER={ODBC Driver 17 for SQL Server}; SERVER=localhost,1433; DATABASE=ielDB_new; uid=sa; pwd=reallyStrongPwd1234#;')
cursor = connection.cursor()
cursor.execute("USE ielDB_new")

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

def check_or_associate_table(table, columnA_to_check, columnB_to_check, id_valueA, id_valueB):
    if id_valueA != None and id_valueB != None:
        found = select_query(f"SELECT ID FROM {table} WHERE {columnA_to_check} = '{id_valueA}' AND {columnB_to_check} = '{id_valueB}'")
        if len(found) == 0:
            commit_query(f"INSERT INTO {table} ({columnA_to_check}, {columnB_to_check}) VALUES ('{id_valueA}', '{id_valueB}')")

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
    # Seleciona Regional/Unidade IEL
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
                NUMERO = row[11].value,
                BAIRRO = row[12].value,
            )
            responsavel_campus = dict(
                NOME_RESPONSAVEL = row[13].value,
                CPF_RESP = row[14].value,
                TELEFONE_RESP = row[15].value,
                EMAIL_RESP = row[16].value,
                DATA_NASCIMENTO_RESP = row[17].value,
                CARGO_RESP = row[18].value
            )
            curso = dict(
                NIVEL = row[19].value,
                CURSO = row[20].value,
                CURSO_RELACIONADO = row[21].value,
                DURACAO = row[22].value,
                DT_LIBERACAO = row[23].value,
                CARGA_HORARIA = row[24].value,
                PERIODO_MAX = row[25].value,
                PERIODICIDADE = row[26].value,
                RESPONSAVEL_CURSO = row[27].value,
                CPF_RESP_CURSO = row[28].value,
                EMAIL_RESP_CURSO = row[29].value,
                TURNO = row[30].value,
                ESTAGIO_OBRIGATORIO = row[31].value,
                REGISTRO_CONSELHO = row[32].value
            )

            # Insere Cidades
            check_or_insert_into_table("cities", "NAME", f"{cidade['NAME']}", "NAME, IBGE, UF", f"'{cidade['NAME']}', {cidade['IBGE']}, '{cidade['UF']}'")

            # Prepara pra inserir Endereços
            cidade_end_id = select_query(f"SELECT ID FROM cities WHERE name = '{cidade['NAME']}'")
            cidade_end_id = cidade_end_id[0][0]
            # Insere Endereços
            check_or_insert_into_table("addresses", "POSTAL_CODE", f"{endereco['CEP']}", "POSTAL_CODE, PUBLIC_PLACE, NUMBER, DISTRICT, CITY_ID", f"'{endereco['CEP']}', '{endereco['LOGRADOURO']}', '{endereco['NUMERO']}', '{endereco['BAIRRO']}', '{cidade_end_id}'")

            # Insere Responsavel
            check_or_insert_into_table("responsible", "RESPONSIBLE_CPF", f"{responsavel_campus['CPF_RESP']}", "responsible_name, responsible_cpf, responsible_phone, responsible_email, responsible_birthday_date, responsible_occupation", f"'{responsavel_campus['NOME_RESPONSAVEL']}', '{responsavel_campus['CPF_RESP']}', '{responsavel_campus['TELEFONE_RESP']}', '{responsavel_campus['EMAIL_RESP']}', CONVERT(DATETIME2, '{responsavel_campus['DATA_NASCIMENTO_RESP']}', 103), '{responsavel_campus['CARGO_RESP']}'")
            resp_id = select_query(f"SELECT ID FROM responsible WHERE responsible_cpf = '{responsavel_campus['CPF_RESP']}'")
            resp_id = resp_id[0][0]

            # Prepara pra inserir Instituicao de Ensino
            endereco_id = select_query(f"SELECT ID FROM addresses WHERE postal_code = '{endereco['CEP']}'")
            endereco_id = endereco_id[0][0]
            # Insere Instituicao de Ensino
            check_or_insert_into_table("educational_institution1", "cnpj", inst_ensino['CNPJ'], "cnpj, company_name, fantasy_name, address_id, iel_unity_id", f"'{inst_ensino['CNPJ']}', '{inst_ensino['RAZAO']}', '{inst_ensino['FANTASIA']}', '{endereco_id}', '{iel_id}'")
            
            # Prepara pra inserir Campus
            inst_ensino_id = select_query(f"SELECT ID FROM educational_institution1 WHERE cnpj = '{inst_ensino['CNPJ']}'")
            inst_ensino_id = inst_ensino_id[0][0]
            
            # Insere Campus
            check_or_insert_into_table("campi", "name", campus['UNIDADE'], "name, cnpj, initials, company_name, fantasy_name, phone, address_id, educational_institution_id", f"'{campus['UNIDADE']}', '{inst_ensino['CNPJ']}', '{campus['SIGLA']}', '{inst_ensino['RAZAO']}', '{inst_ensino['FANTASIA']}', '{campus['TELEFONE']}', '{endereco_id}', '{inst_ensino_id}'")
            
            # Prepara pra inserir Curso
            campus_id = select_query(f"SELECT ID FROM campi WHERE name = '{campus['UNIDADE']}'")
            campus_id = campus_id[0][0]
            general_course_id = select_query(f"SELECT ID FROM general_courses WHERE name = '{curso['CURSO_RELACIONADO']}'")
            general_course_id = general_course_id[0][0]
            resp_curso = select_query(f"SELECT ID FROM responsible WHERE responsible_name = '{curso['RESPONSAVEL_CURSO']}'")

            # Insere Curso
            set_query("SET IDENTITY_INSERT dbo.courses ON;")
            check_or_insert_into_table("courses", "name", f"{curso['CURSO']}", "name, general_courses_id, frequency, shift, duration, from_which_period_is_released, maximum_weekly_hourly_allowed, maximum_month_internship_period, is_record_advice_supervisor, level, code, mandatory_internship, modality, campi_id, educational_institution_id", f"'{curso['CURSO']}', '{general_course_id}', '{curso['PERIODICIDADE']}', 1, {curso['DURACAO']}, {curso['DT_LIBERACAO']}, {curso['CARGA_HORARIA']}, {curso['PERIODO_MAX']}, 1, '{curso['NIVEL']}', 1, 1, 1, '{campus_id}', '{inst_ensino_id}'")
            set_query("SET IDENTITY_INSERT dbo.courses OFF;")

            # Prepara pra inserir associacoes
            course_id = select_query(f"SELECT ID FROM courses WHERE name = '{curso['CURSO']}'")
            course_id = course_id[0][0]

            # associa campus_responsavel
            check_or_associate_table("campi_responsible", "campi_id", "responsible_id", f"{campus_id}", f"{resp_id}")
            
            # associa campus_endereco
            check_or_associate_table("educational_institution_responsible", "educational_institution_id"
            , "responsible_id", f"{inst_ensino_id}", f"{resp_id}")
            
            # associa curso_responsavel
            check_or_insert_into_table("responsible", "RESPONSIBLE_CPF", f"{curso['CPF_RESP_CURSO']}","responsible_name, responsible_cpf, responsible_email", f"'{curso['RESPONSAVEL_CURSO']}','{curso['CPF_RESP_CURSO']}', '{curso['EMAIL_RESP_CURSO']}'")
            respc_id = select_query(f"SELECT ID FROM responsible WHERE responsible_cpf = '{curso['CPF_RESP_CURSO']}'")
            resp_id_curso = respc_id[0][0]

            #if resp_curso != "NULL":
            check_or_associate_table("courses_responsible", "courses_id", "responsible_id", f"{course_id}", f"{resp_id_curso}")

        print(f"linha:{i}  >>>           ")

# Finaliza a conexao com o BD
cursor.close()
connection.close()

# Finaliza execucao
print("Fim do arquivo")