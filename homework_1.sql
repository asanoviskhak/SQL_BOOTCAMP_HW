-- -- Creating table client
-- CREATE TABLE client (
--     client_id SERIAL PRIMARY KEY,
--     name VARCHAR(50) NOT NULL,
--     email VARCHAR(50) NOT NULL,
--     phone VARCHAR(20) NOT NULL,
--     address VARCHAR(100) NOT NULL
-- );

-- Эта таблица нужна для того что-бы хранить данные клиентов.
-- Use case: Данные клиентов банка, данные клиентов кафе, данные клиентов магазина

-- Извлечь всех клиентов в базе у которых имя начинается с "John"
-- SELECT name, email, phone FROM client WHERE name LIKE 'John%';


-- -- Creating table organization
-- CREATE TABLE organization (
--     org_id SERIAL PRIMARY KEY,
--     name VARCHAR(50) NOT NULL,
--     address VARCHAR(100) NOT NULL
-- );

-- Эта таблица нужна для того что-бы хранить данные организаций.
-- Use case: Хранить данные организаций

-- Извлечь все организации в базе у которых адрес начинается с "Milky Way"
-- SELECT name, address FROM organization WHERE address LIKE 'Milky Way%';


-- -- Creating table transaction
-- CREATE TABLE transaction (
--     transaction_id SERIAL PRIMARY KEY,
--     amount NUMERIC(10,2) NOT NULL,
--     date DATE NOT NULL
-- );

-- Эта таблица нужна для того что-бы хранить данные переводов.
-- Use case: Транзакция при покупки билетов, или отправка средств через банк

-- Извлечь все транзакции в базе с указанием суммы и даты где сумма больше 1000
-- SELECT amount, date FROM transaction WHERE amount > 1000;

