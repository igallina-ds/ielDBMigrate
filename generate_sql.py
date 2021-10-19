import xlrd
import pyodbc
import datetime

# Fazer a inclusao do SQL ou do DUMP (sys.argv[1]) no Banco antes de começar
# Conferir se todas as linhas tem CNPJ, as que não tiverem devem ser apagadas
# Limpar coluna prio e cadastrado se houver
# Precisa haver uma unidade do IEL cadastrada

book = xlrd.open_workbook('sne_dump_long.xlsx')
# Se for parametro da chamada
# book = xlrd.open_workbook(sys.argv[1])
sheet = book.sheet_by_index(0)

# Connect to database
connection = pyodbc.connect(r'DRIVER={ODBC Driver 17 for SQL Server}; SERVER=localhost,1433; DATABASE=ielDBDev; uid=sa; pwd=reallyStrongPwd1234#;')
cursor=connection.cursor()

# Mapeamento das associativas
# inst_ensino_endereco
# campus_responsavel
# campus_endereco
# curso_responsavel

def execute_query(query):
    # Execute query
    cursor.execute("USE ielDBDev")
    print(f"                      {query}")
    result = cursor.execute(query)
    return result

# Metodos de inclusao e manipulacao do BD

# def join_tables(jointable, table1, table2, column1, column2, value1, value2, values):
#     tableA = cursor.execute(f"SELECT * FROM {table1} WHERE {column1} = {value1}")
#     tableB = cursor.execute(f"SELECT * FROM {table2} WHERE {column2} = {value2}")
#     cursor.execute(f"INSERT INTO {jointable} VALUES ({tableA}, {tableB}, {values} )")

def check_or_insert_into_table(table, column_to_check, id_value, columns_to_insert, values_to_insert):
    if id_value != None:
        found = execute_query(f"SELECT * FROM {table} WHERE {column_to_check} = '{id_value}'")
        found = found.fetchall()
        if len(found) == 0:
            execute_query(f"INSERT INTO {table} ({columns_to_insert}) VALUES ({values_to_insert})")

def sanitize_entry(row):
    for i, column in enumerate(row):
        if "'" in column.value:
            execute_query("SET QUOTED_IDENTIFIER OFF;")
            column.value = execute_query(f"SELECT REPLACE(\"{column.value}\", \"'\", \"\")")
            execute_query("SET QUOTED_IDENTIFIER ON;")
        if i == 0 and type(column.value) == str:
            column.value = int(column.value)
    return row

with connection:
    # Config do SQL Server
    execute_query("SET ARITHIGNORE OFF")
    # Insere IEL Nacional
    execute_query("INSERT INTO iel_units (type, cnpj, company_name) VALUES ('DN', '02777249000133', 'IEL Nacional')")
    
    last_cnpj = []

    # Processa o XLS e insere no BD
    for i, row in enumerate(sheet.get_rows()):
        if i != 0:
            # Limpa valores errados e aspas
            row = sanitize_entry(row)

            # Mapeamento das tabelas a serem inseridas
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
                responsavel = row[25].value,
                TURNO = row[26].value,
                ESTAGIO_OBRIGATORIO = row[27].value,
                REGISTRO_CONSELHO = row[28].value
            )

            # Seleciona CNPJ
            CNPJ = execute_query(f"SELECT CNPJ FROM educational_institution1 WHERE CNPJ = '{inst_ensino['CNPJ']}'")
            if last_cnpj != CNPJ or CNPJ.fetchone() == None:
                last_cnpj = CNPJ
                # Insere Cidades
                check_or_insert_into_table("cities", "NAME", f"{cidade['NAME']}", "NAME, IBGE, UF", f"'{cidade['NAME']}', {cidade['IBGE']}, '{cidade['UF']}'")

                # Insere Endereços
                cidade_end_id = execute_query(f"SELECT ID FROM cities WHERE name = '{cidade['NAME']}'")
                check_or_insert_into_table("addresses", "POSTAL_CODE", f"{endereco['CEP']}", "POSTAL_CODE, DISTRICT, NUMBER, COMPLEMENT, CITY_ID", f"'{endereco['CEP']}', '{endereco['LOGRADOURO']}', NULL, '{endereco['BAIRRO']}', '{cidade_end_id.fetchall()[0][0]}'")

                # Insere Responsavel
                check_or_insert_into_table("responsible", "RESPONSIBLE_CPF", f"{responsavel['CPF_RESP']}", "responsible_name, responsible_cpf, responsible_phone, responsible_email, responsible_birthday_date, responsible_occupation", f"'{responsavel['NOME_RESPONSAVEL']}', '{responsavel['CPF_RESP']}', '{responsavel['TELEFONE_RESP']}', '{responsavel['EMAIL_RESP']}', CONVERT(DATETIME2, '{responsavel['DATA_NASCIMENTO_RESP']}', 103), '{responsavel['CARGO_RESP']}'")

                # Get Endereco Inst. Ensino
                endereco_id = execute_query(f"SELECT ID FROM addresses WHERE postal_code = '{endereco['CEP']}'")
                # Insere Instituicao de Ensino
                check_or_insert_into_table("educational_institution1", "cnpj", inst_ensino['CNPJ'], "cnpj, company_name, fantasy_name, address_id", f"'{inst_ensino['CNPJ']}', '{inst_ensino['RAZAO']}', '{inst_ensino['FANTASIA']}', '{endereco_id.fetchall()[0][0]}'")
                
                # check_or_insert_into_table(campus, "column", "values")
                # check_or_insert_into_table(campus_responsavel, "column", "values")
                # check_or_insert_into_table(campus_endereco, "column", "values")
                
                # check_or_insert_into_table(curso, "column", "values")
                # check_or_insert_into_table(curso_responsavel, "column", "values")
            else:
                continue
        connection.commit()
        print(f"{i}  >>>>>>>>>>>>>")

# Finaliza a conexao com o BD
cursor.close()
connection.close()

# Finaliza execucao
print("Fim do arquivo")