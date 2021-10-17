import xlrd
import pyodbc

# Fazer a inclusao do SQL ou do DUMP (sys.argv[1]) no Banco antes de começar

# Conferir se todas as linhas tem CNPJ, as que não tiverem devem ser apagadas

book = xlrd.open_workbook('sne_dump.xlsx')
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
    result = cursor.execute(query)
    print(f"                      {query}")
    return result

# Metodos de inclusao e manipulacao do BD
def select_id(table, column_to_select, id_value):
    # Seleciona tabela 1
    id = execute_query(f"SELECT * FROM {table} WHERE {column_to_select} = '{id_value}'")
    return id.fetchone()

# def join_tables(jointable, table1, table2, column1, column2, value1, value2, values):
#     tableA = cursor.execute(f"SELECT * FROM {table1} WHERE {column1} = {value1}")
#     tableB = cursor.execute(f"SELECT * FROM {table2} WHERE {column2} = {value2}")
#     cursor.execute(f"INSERT INTO {jointable} VALUES ({tableA}, {tableB}, {values} )")

def check_or_insert_into_table(table, column_to_check, id_value, columns_to_insert, values_to_insert):
    if id_value != None:
        found = execute_query(f"SELECT * FROM {table} WHERE {column_to_check} = '{id_value}'")
        found = found.fetchall()
        if len(found) == 0:
            print("entrou")
            execute_query(f"INSERT INTO {table} ({columns_to_insert}) VALUES ({values_to_insert})")

with connection:
    # Processa o XLS e insere no BD
    for row_num, row in enumerate[1:](sheet.get_rows()):
        # Mapeamento das tabelas a serem inseridas
        inst_ensino = dict(
            CNPJ = row[2].value,
            RAZAO = row[3].value,
            FANTASIA = row[4].value
        )
        campus = dict(
            UNIDADE = row[5].value,
            SIGLA = row[6].value,
            EMAIL = row[7].value,
            TELEFONE = row[8].value
        )
        cidade = dict(
            NAME = row[10].value.replace("'", ""),
            IBGE = 1,
            UF = row[9].value
        )
        endereco = dict(
            CIDADE = row[10].value.replace("'", ""),
            CEP = row[11].value,
            LOGRADOURO = row[12].value,
            BAIRRO = row[13].value
        )
        responsavel = dict(
            RESPONSAVEL = row[14].value,
            CPF_RESP = row[15].value,
            TELEFONE_RESP = row[16].value,
            EMAIL_RESP = row[17].value,
            DATA_NASCIMENTO_RESP = row[18].value,
            CARGO_RESP = row[19].value
        )
        curso = dict(
            NIVEL = row[20].value,
            CURSO = row[21].value,
            DURACAO = row[22].value,
            DT_LIBERACAO = row[23].value,
            CARGA_HORARIA = row[24].value,
            PERIODO_MAX = row[25].value,
            PERIODICIDADE = row[26].value,
            responsavel = row[27].value,
            TURNO = row[28].value,
            ESTAGIO_OBRIGATORIO = row[29].value,
            REGISTRO_CONSELHO = row[30].value
        )

        # Seleciona CNPJ
        CNPJ = execute_query(f"SELECT CNPJ FROM educational_institution1 WHERE CNPJ = {inst_ensino['CNPJ']}")
        if CNPJ.fetchone() == None:
            # # Insere cidades
            check_or_insert_into_table("cities", "NAME", f"{cidade['NAME']}", "NAME, IBGE, UF", f"'{cidade['NAME']}', {cidade['IBGE']}, '{cidade['UF']}'")
            
            # # Insere Endereços
            id = select_id("cities", "NAME", f"{cidade['NAME']}")
            check_or_insert_into_table("addresses", "POSTAL_CODE", f"{endereco['CEP']}", "POSTAL_CODE, DISTRICT, NUMBER, COMPLEMENT, city_id", f"{endereco['CEP']}, {endereco['LOGRADOURO']}, NULL, {endereco['BAIRRO']}, {id}")
            
            # check_or_insert_into_table(inst_ensino_endereco, "column", "values")
            # check_or_insert_into_table(responsavel, "column", "values")
            # check_or_insert_into_table(campus, "column", "values")
            # check_or_insert_into_table(inst_ensino, "column", "values")
            # check_or_insert_into_table(campus, "column", "values")
            # check_or_insert_into_table(campus_responsavel, "column", "values")
            # check_or_insert_into_table(campus_endereco, "column", "values")
            # check_or_insert_into_table(curso_responsavel, "column", "values")
        else:
            continue
        print(f"Linha {row_num} processada com sucesso")

# Finaliza a conexao com o BD
cursor.close()
connection.commit()
connection.close()

# Finaliza execucao
print("Fim do arquivo")