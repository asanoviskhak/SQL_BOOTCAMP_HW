
-- CREATE DATABASE lms;

CREATE TABLE organizations (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) NOT NULL,
	address VARCHAR(100) NULL,
	"type" VARCHAR(20) NULL,
	phone VARCHAR(13) NULL
);

CREATE TABLE students (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	birth_date DATE NULL,
	is_active BOOLEAN NULL,
	enroll_date TIMESTAMP WITH TIME ZONE NOT NULL
);

CREATE TABLE teachers (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	is_active BOOLEAN NULL,
	school_id INTEGER NOT NULL,
	salary DECIMAL(10,2) NULL,
	enroll_date TIMESTAMP WITH TIME ZONE NOT NULL
);

CREATE TABLE subjects (
	"id" SERIAL PRIMARY KEY,
	title VARCHAR(50) NOT NULL,
	description TEXT NULL,
	duration INTEGER NULL,
	number_of_topics INTEGER NULL
);

CREATE TABLE topics (
	"id" SERIAL PRIMARY KEY,
	title VARCHAR(50) NOT NULL,
	description TEXT NULL
);


-- Добавление данных в таблицу organization
INSERT INTO organizations ("name", address, "type", phone) 
VALUES 
('Acme', 'ул. Главная 123, Город Альфа', 'Школа', '555-555-212'),
('XYZ', 'ул. Дубовая 456, Город Бета', 'Школа-Гимназия', '555-555-323'),
('Green', 'ул. Сосновая 789, Город Гамма', 'Лицей', '555-555-434'),
('Big', 'Город Дельта', 'Частная школа', '555-555-545'),
('Foo', 'ул. Зеленая 456, Город Эпсилон', 'Школа', '555-555-656'),
('Bright Future', 'Город Зета', 'Лицей', '555-555-767');

-- Добавление данных в таблицу students
INSERT INTO students ("name", email, birth_date, is_active, enroll_date) 
VALUES 
('Айбек Беков', 'aibekbekov@example.com', '1990-01-01', true, '2022-01-01'),
('Майрам Райымова', 'mairamr@example.com', '1992-02-02', false, '2022-02-01'),
('Бек Айбеков', 'bekaa@example.com', '1995-03-03', true, '2022-03-01'),
('Саша Александров', 'sasha@example.com', '1999-03-23', true,'2022-03-15');

-- Добавление данных в таблицу teacher
INSERT INTO teachers ("name", email, is_active, school_id, salary, enroll_date) 
VALUES 
('Доктор Смит', 'drsmith@example.com', true, 1, 60000, '2022-01-01'),
('Госпожа Джонсон', 'msjohnson@example.com', false, 2, 65000, '2022-02-01'),
('Профессор Дэвис', 'profdavis@example.com', true, 3, 70000, '2022-03-01'),
('Доктор Уилсон', 'drwilson@example.com', true, 4, 65000, '2022-04-01'),
('Госпожа Робинсон', 'msrobinson@example.com', false, 5, 70000, '2022-05-01'),
('Профессор Миллер', 'profmiller@example.com', true, 6, 75000, '2022-06-01');

-- Добавление данных в таблицу subject
INSERT INTO subjects (title, description, duration, number_of_topics) 
VALUES 
('Введение в информатику', 'Введение в область информатики', 15, 10),
('Математика', 'Математика для студентов-инженеров', 20, 12),
('Химия', 'Введение в область химии', 18, 8);

-- Добавление данных в таблицу topic
INSERT INTO topics (title, description)
VALUES
('Алгоритмы', 'Введение в алгоритмы и структуры данных'),
('Термодинамика', 'Изучение тепла и температуры'),
('Органическая химия', 'Изучение углеродных соединений');

-- Изменение имени таблицы subject на course
ALTER TABLE subjects RENAME TO courses;

-- Изменение значения в таблице course
UPDATE courses SET duration = 16 WHERE id = 1;

-- Добавление новой колонки в таблицу course
ALTER TABLE courses ADD COLUMN instructor VARCHAR(50);

-- Обновление значения в новой колонке instructor в таблице course
UPDATE courses SET instructor = 'Профессор Джонсон' WHERE id = 1;

-- Добавление новой таблицы department
CREATE TABLE departments (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) NOT NULL,
	"location" VARCHAR(100) NOT NULL,
	phone VARCHAR(13) NOT NULL,
	head_of_department VARCHAR(50) NOT NULL
);

-- Добавление данных в таблицу department
INSERT INTO departments ("name", "location", phone, head_of_department) 
VALUES 
('Информатика', 'Главный корпус', '+99634567890', 'Профессор Джонсон'),
('Химия', '1 этаж', '+99634567891', 'Госпожа Джонсон'),
('Математика', '2 этаж', '+99634567892', 'Профессор Дэвис');

-- Изменение имени колонки type в таблице organization на org_type
ALTER TABLE organizations RENAME COLUMN "type" TO org_type;

-- Изменение значения в колонке org_type в таблице organization
UPDATE organizations SET org_type = 'Частная школа' WHERE id = 1;

-- Добавление новой колонки в таблицу students
ALTER TABLE students ADD COLUMN major VARCHAR(50);

-- Изменение значения в новой колонке major в таблице students
UPDATE students SET major = 'Информатика' WHERE id = 1;

-- Удаление данных в таблице teacher
DELETE FROM teachers WHERE id = 2;

-- Вывод всех данных из таблицы organization
SELECT * FROM organizations;

-- Вывод всех данных из таблицы students
SELECT * FROM students;

-- Вывод всех данных из таблицы teachers
SELECT * FROM teachers;

-- Вывод всех данных из таблицы subjects
SELECT * FROM courses;

-- Вывод всех данных из таблицы topics
SELECT * FROM topics;


