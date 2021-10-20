use ielDBDev;
SELECT id, name,ibge,uf FROM cities
SELECT id, postal_code, district, number,complement,city_id FROM addresses
SELECT id, responsible_name, responsible_cpf, responsible_email, responsible_birthday_date, responsible_occupation, responsible_phone FROM responsible
SELECT id, company_name, fantasy_name, cnpj, address_id FROM educational_institution1
SELECT id, name, initials, phone FROM campi
SELECT id, name, frequency, duration, level, modality FROM courses

DELETE FROM dbo.cities  WHERE id IS NOT NULL
DELETE FROM dbo.campi WHERE id IS NOT NULL
DELETE FROM dbo.courses WHERE id IS NOT NULL
DELETE FROM dbo.addresses WHERE id IS NOT NULL
DELETE FROM dbo.responsible WHERE id IS NOT NULL
DELETE FROM dbo.educational_institution1 WHERE id IS NOT NULL