-- many-to-many
-- Взаимосвязь между таблицами Студент и Курс (students и courses). 
-- Один студент может записаться на несколько курсов, один курс может 
-- иметь много студентов, то есть это взаимосвязь многие ко многим. 
-- Такая взаимосвязь может принадлежать базе данных учебного заведения. 
-- Один студент записался на курсы по математике, английского и т.д

CREATE TABLE students (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	birth_date DATE NULL,
	is_active BOOLEAN NULL,
	enroll_date TIMESTAMP WITH TIME ZONE NOT NULL
);

CREATE TABLE courses (
	"id" SERIAL PRIMARY KEY,
	title VARCHAR(50) NOT NULL,
	description TEXT NULL,
	duration INTEGER NULL,
	number_of_topics INTEGER NULL
);

CREATE TABLE course_subscriptions (
  subscription_id SERIAL PRIMARY KEY,
  student_id INTEGER NOT NULL,
  course_id INTEGER NOT NULL,
  subscription_date DATE NOT NULL,
  FOREIGN KEY (student_id) REFERENCES students ("id") ON DELETE CASCADE,
  FOREIGN KEY (course_id) REFERENCES courses ("id")
);


-- one-to-many
-- Взаимосвязь между таблицами Организация и Подразделение (organizations и departments). 
-- Одна организация имеет несколько подразделений, одно подразделение принадлежит 
-- только одной организации, то есть это взаимосвязь один ко многим. Такая взаимосвязь 
-- может принадлежать базе данных компании. Одна компания имеет подразделение продаж, 
-- подразделение разработки и подразделение бухгалтерии.
CREATE TABLE organizations (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) NOT NULL,
	address VARCHAR(100) NULL,
	"type" VARCHAR(20) NULL,
	phone VARCHAR(13) NULL
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

CREATE TABLE departments (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) NOT NULL,
	"location" VARCHAR(100) NOT NULL,
	phone VARCHAR(13) NOT NULL,
	organization_id INTEGER NOT NULL,
	head_of_department INTEGER NOT NULL,
	FOREIGN KEY (organization_id) REFERENCES organizations ("id") ON DELETE CASCADE,
  	FOREIGN KEY (head_of_department) REFERENCES teachers ("id")
);

-- one-to-one
-- "Представьте таблицы "Студент" и "Оценки" (students и grades). 
-- Каждый студент имеет только одну оценку для каждого предмета, 
-- одна оценка относится к одному студенту, то есть это взаимосвязь 
-- один к одному. Такая взаимосвязь возможна в системе учета оценок школы. 
-- Например, студент Иван Иванов имеет оценку 90 в математике, 80 в химии и 85 в истории."
CREATE TABLE grades (
  id SERIAL PRIMARY KEY,
  grade INTEGER NOT NULL,
  student_id INTEGER NOT NULL,
  FOREIGN KEY (student_id) REFERENCES students(id)
);



-- Таблица с непоследовательным первичным ключом может быть использована, 
-- когда есть уникальный идентификатор, который может быть использован в 
-- качестве первичного ключа. Например, таблица Пассажиры в базе данных 
-- авиакомпании, где первичный ключ это номер паспорта пассажира. Так как 
-- номера паспортов уникальны для каждого пассажира, он может использоваться 
-- в качестве первичного ключа, и нет необходимости в последовательности.
CREATE TABLE passengers (
  passport_number VARCHAR(255) PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  age INT NOT NULL,
  nationality VARCHAR(255) NOT NULL
);


-- Пример таблицы с последовательным первичным ключом может быть таблица Заказы в базе 
-- данных ресторана или кафе. В этой таблице может быть много заказов, каждый из которых 
-- должен иметь уникальный идентификатор. В данном случае мы можем использовать 
-- последовательный первичный ключ, так как мы не можем заранее знать номер паспорта 
-- клиента или номер заказа, и последовательный первичный ключ гарантирует, что каждый 
-- заказ будет иметь уникальный идентификатор.
CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  phone VARCHAR(255) NOT NULL
);

CREATE TABLE orders (
  order_id SERIAL PRIMARY KEY,
  order_date DATE NOT NULL,
  customer_id INTEGER NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers ("id")
);


-- Как пример, мы можем представить взаимоотношение между двумя таблицами: Библиотека и Книги. 
-- Библиотека имеет информацию о местонахождении, контактных данных и т.д. Таблица Книги 
-- содержит информацию о книгах, такую как название, автор, жанр и т.д.

-- Связь между таблицами Библиотека и Книги построена на первичном ключе таблицы Библиотека (library_id)
-- и внешнем ключе таблицы Книги (library_id). Это означает, что каждая книга может быть расположена 
-- только в одной библиотеке, а каждая библиотека может иметь множество книг.
CREATE TABLE "library" (
  "id" INT PRIMARY KEY,
  "name" VARCHAR(255),
  address VARCHAR(255),
  phone VARCHAR(255)
);

CREATE TABLE book (
  book_id INT PRIMARY KEY,
  title VARCHAR(255),
  author VARCHAR(255),
  genre VARCHAR(255),
  library_id INTEGER NOT NULL,
  FOREIGN KEY (library_id) REFERENCES "library" ("id")
);
