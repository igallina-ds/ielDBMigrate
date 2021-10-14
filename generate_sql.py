from re import A
import xlrd
import pyodbc

book = xlrd.open_workbook('sne_dump.xlsx')
result = []

# Mapeamento das tabelas a serem inseridas
inst_ensino = {
    'CNPJ': 2,
    'RAZAO': 3,
    'FANTASIA': 4
}
campus = {
    'UNIDADE': 5,
    'SIGLA': 6,
    'EMAIL': 7,
    'TELEFONE': 8
}
cidade = {
    'NAME': 10,
    'IBGE': None,
    'UF': 9
}
endereco = {
    'CIDADE': cidade['NAME'],
    'CEP': 11,
    'LOGRADOURO': 12,
    'BAIRRO': 13
}
responsavel = {
    'RESPONSAVEL': 14,
    'CPF_RESP': 15,
    'TELEFONE_RESP': 16,
    'EMAIL_RESP': 17,
    'DATA_NASCIMENTO_RESP': 18,
    'CARGO_RESP': 19
}
curso = {
    'NIVEL': 20,
    'CURSO': 21,
    'DURACAO': 22,
    'DT_LIBERACAO': 23,
    'CARGA_HORARIA': 24,
    'PERIODO_MAX': 25,
    'PERIODICIDADE': 26,
    'responsavel': 27,
    'TURNO': 28,
    'ESTAGIO_OBRIGATORIO': 29,
    'REGISTRO_CONSELHO': 30
}

# Mapeamento das associativas
inst_ensino_endereco = {

}
campus_responsavel = {

}
campus_endereco = {

}
curso_responsavel = {

}

# Connect to database
    #;uid=sa;pwd=reallyStrongPwd123
    #;Trusted_Connection=yes
connection = pyodbc.connect(r'DRIVER={ODBC Driver 17 for SQL Server}; SERVER=0.0.0.0,5434; DATABASE=ielDBDev; TRUSTED_CONNECTION=yes;')
cursor=connection.cursor()

def check_before_insert(table, column, value):
    cursor.execute(f"SELECT * FROM {table} WHERE {column} = {value}")

def join_tables(jointable, table1, table2, column1, column2, value1, value2, values):
    tableA = cursor.execute(f"SELECT * FROM {table1} WHERE {column1} = {value1}")
    tableB = cursor.execute(f"SELECT * FROM {table2} WHERE {column2} = {value2}")
    cursor.execute(f"INSERT INTO {jointable} VALUES ({tableA}, {tableB}, {values} )")


def insert_into_table(table, values):
    cursor.execute(f"INSERT INTO {table} VALUES ({values})")

def check_or_insert_into_table(table, column, id_value, values):
    found = cursor.execute(f"SELECT * FROM {table} WHERE {column} = {id_value}")
    if len(found) != 0:
        cursor.execute(f"INSERT INTO {table} VALUES ({values})")

def process_row (row):
    check_or_insert_into_table(cidade, "column", "values")
    check_or_insert_into_table(responsavel, "column", "values")
    check_or_insert_into_table(campus, "column", "values")
    check_or_insert_into_table(inst_ensino, "column", "values")
    check_or_insert_into_table(campus, "column", "values")
    check_or_insert_into_table(inst_ensino_endereco, "column", "values")
    check_or_insert_into_table(campus_responsavel, "column", "values")
    check_or_insert_into_table(campus_endereco, "column", "values")
    check_or_insert_into_table(curso_responsavel, "column", "values")

sheet = book.sheets()[0]
for row_num, row in enumerate(sheet.get_rows()):
    # Seleciona CNPJ
    CNPJ = check_before_insert("educatonal_institution1", "CNPJ", inst_ensino['CNPJ'])
    if len(CNPJ) == 0:
        process_row(row)
    else:
        continue

    #    result.append([row[inst_ensino['CNPJ']], row[inst_ensino['RAZAO']], row[inst_ensino['FANTASIA']]])
    #    print(result)

cursor.close()
connection.close()