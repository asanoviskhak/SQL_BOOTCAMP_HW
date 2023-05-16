DROP TABLE subscriptions;
DROP TABLE subscribers;
DROP TABLE "comments";
DROP TABLE posts;
DROP TABLE users;

CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  surname VARCHAR(255),
  username VARCHAR(255),
  email VARCHAR(255),
  password VARCHAR(255),
  country VARCHAR(255),
  profile_picture VARCHAR(255)
);

CREATE TABLE posts (
  post_id SERIAL PRIMARY KEY,
  user_id INT,
  post_text TEXT,
  post_image VARCHAR(255),
  post_date DATE,
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE comments (
  comment_id SERIAL PRIMARY KEY,
  post_id INT,
  user_id INT,
  comment_text TEXT,
  comment_date DATE,
  FOREIGN KEY (post_id) REFERENCES Posts(post_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE subscribers (
  id SERIAL PRIMARY KEY,
  user_id INT,
  subscriber_user_id INT,
  subscribe_date DATE,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (subscriber_user_id) REFERENCES users(user_id)
);

CREATE TABLE subscriptions (
  id SERIAL PRIMARY KEY,
  user_id INT,
  subscription_user_id INT,
  subscribe_date DATE,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (subscription_user_id) REFERENCES users(user_id)
);


INSERT INTO users ("name", surname, username, email, "password", country, profile_picture)
VALUES 
( 'Айбек', 'Жумагалиев', 'aybekj', 'aybekj@gmail.com', 'password1', 'Kyrgyzstan', 'profile1.jpg'),
( 'Бектемир', 'Токтобаев', 'bektemir', 'bektemir@gmail.com', 'password2', 'Kyrgyzstan', 'profile2.jpg'),
( 'Жандос', 'Алиев', 'jandos', 'jandos@gmail.com', 'password3', 'Kyrgyzstan', 'profile3.jpg'),
( 'Жымайсын', 'Маматова', 'jymaysin', 'jymaysin@gmail.com', 'password4', 'Kyrgyzstan', 'profile4.jpg'),
( 'Кубаныч', 'Оронов', 'kubanich', 'kubanich@gmail.com', 'password5', 'Kyrgyzstan', 'profile5.jpg'),
( 'Мадина', 'Турсунова', 'madina', 'madina@gmail.com', 'password6', 'Kyrgyzstan', 'profile6.jpg'),
( 'Улугбек', 'Таласов', 'ulugbek', 'ulugbek@gmail.com', 'password7', 'Kyrgyzstan', 'profile7.jpg'),
('Иван', 'Иванов', 'ivan_ivanov', 'ivan_ivanov@gmail.com', 'Ivan123', 'Россия', 'ivan_ivanov_profile.jpg'),
('Петр', 'Петров', 'petr_petrov', 'petr_petrov@gmail.com', 'Petr123', 'Россия', 'petr_petrov_profile.jpg'),
('Мария', 'Сидорова', 'maria_sidorova', 'maria_sidorova@gmail.com', 'Maria123', 'Россия', 'maria_sidorova_profile.jpg'),
('Алексей', 'Кузнецов', 'aleksey_kuznetsov', 'aleksey_kuznetsov@gmail.com', 'Aleksey123', 'Россия', 'aleksey_kuznetsov_profile.jpg'),
('Елена', 'Новикова', 'elena_novikova', 'elena_novikova@gmail.com', 'Elena123', 'Россия', 'elena_novikova_profile.jpg'),
('Дмитрий', 'Жуков', 'dmitriy_zhukov', 'dmitriy_zhukov@gmail.com', 'Dmitriy123', 'Россия', 'dmitriy_zhukov_profile.jpg'),
('Ольга', 'Смирнова', 'olga_smirnova', 'olga_smirnova@gmail.com', 'Olga123', 'Россия', 'olga_smirnova_profile.jpg'),
('Алия', 'Жансая', 'aliya_jansaya', 'aliya_jansaya@gmail.com', 'Aliya123', 'Казахстан', 'aliya_jansaya_profile.jpg'),
('Даулет', 'Жумабек', 'daulet_jumabek', 'daulet_jumabek@gmail.com', 'Daulet123', 'Казахстан', 'daulet_jumabek_profile.jpg'),
('Айдар', 'Нурмухан', 'aidar_nurmukhan', 'aidar_nurmukhan@gmail.com', 'Aidar123', 'Казахстан', 'aidar_nurmukhan_profile.jpg'),
('Жанар', 'Жанылбек', 'janar_janylbek', 'janar_janylbek@gmail.com', 'Janar123', 'Казахстан', 'janar_janylbek_profile.jpg'),
('Нурлан', 'Асел', 'nurlan_asel', 'nurlan_asel@gmail.com', 'Nurlan123', 'Казахстан', 'nurlan_asel_profile.jpg'),
('Аскар', 'Асадылы', 'askar_asadyli', 'askar_asadyli@gmail.com', 'Askar123', 'Казахстан', 'askar_asadyli_profile.jpg'),
('Дина', 'Айтжан', 'dina_aitjan', 'dina_aitjan@gmail.com', 'Dina123', 'Казахстан', 'dina_aitjan_profile.jpg');


INSERT INTO posts (user_id, post_text, post_image, post_date)
VALUES
(1, 'Первый пост в соцсети!', 'post_1_image.jpg', '2022-05-01'),
(2, 'Я люблю путешествовать и исследовать новые места!', 'post_2_image.jpg', '2022-05-02'),
(3, 'Сегодня я начала заниматься спортом, чтобы быть в форме!', 'post_3_image.jpg', '2022-05-03'),
(4, 'Я обожаю читать книги в свободное время!', 'post_4_image.jpg', '2022-05-04'),
(5, 'Сегодня у меня был замечательный день с друзьями!', 'post_5_image.jpg', '2022-05-05'),
(6, 'Я научился чему-то новому каждый день!', 'post_6_image.jpg', '2022-05-06'),
(7, 'Я люблю проводить время на природе!', 'post_7_image.jpg', '2022-05-07'),
(8, 'Мен жаңы жерде жүремін!', 'post_8_image.jpg', '2022-05-08'),
(9, 'Мен саяхат жасауды және жаңы жерлерді айналдыруды ұнаймын!', 'post_9_image.jpg', '2022-05-09'),
(10, 'Бүгін өзім жылдық жеңілдік етуіне бастады!', 'post_10_image.jpg', '2022-05-10'),
(11, 'Мен өз болашағымда кітап оқуды ұнаймын!', 'post_11_image.jpg', '2022-05-11'),
(12, 'Бүгін мен достарыммен үздік күн жатыр!', 'post_12_image.jpg', '2022-05-12'),
(13, 'Мен көптеген жаңа әдебиеттерді күнде оқыймын!', 'post_13_image.jpg', '2022-05-13'),
(14, 'Мен өз жылдам табиғатта қызмет көруді ұнаймын!', 'post_14_image.jpg', '2022-05-14'),
(15, 'Today is a great day!', 'post_15_image.jpg', '2022-05-15'),
(16, 'I love to explore new places!', 'post_16_image.jpg', '2022-05-16'),
(17, 'I started working out today to stay in shape!', 'post_17_image.jpg', '2022-05-17'),
(18, 'I love reading books in my free time!', 'post_18_image.jpg', '2022-05-18'),
(19, 'Had a wonderful day with friends today!', 'post_19_image.jpg', '2022-05-19'),
(20, 'I learn something new every day!', 'post_20_image.jpg', '2022-05-20'),
(21, 'I love spending time in nature!', 'post_21_image.jpg', '2022-05-21'),
(7, 'Life is a journey, make the most of it!', 'post_22_image.jpg', '2022-05-22'),
(8, 'You never stop learning, so keep exploring!', 'post_23_image.jpg', '2022-05-23'),
(9, 'Nature is the best therapy, go outside and enjoy!', 'post_24_image.jpg', '2022-05-24'),
(7, 'Stay positive and spread kindness!', 'post_25_image.jpg', '2022-05-25'),
(8, 'Take time for yourself and recharge!', 'post_26_image.jpg', '2022-05-26'),
(9, 'Life is too short to waste time on things that do not matter!', 'post_27_image.jpg', '2022-05-27'),
(7, 'Success is not final, failure is not fatal: it is the courage to continue that counts!', 'post_28_image.jpg', '2022-05-28'),
(8, 'Enjoy the little things in life, they make a big difference!', 'post_29_image.jpg', '2022-05-29'),
(3, 'Жизнь путешествие, делай из него все наилучшее!', 'post_30_image.jpg', '2022-05-30'),
(5, 'Никогда не перестанешь учиться, поэтому продолжай исследовать!', 'post_31_image.jpg', '2022-05-31'),
(15, 'Природа - лучшая терапия, выходи на улицу и наслаждайся!', 'post_32_image.jpg', '2022-06-01'),
(3, 'Оставайся позитивным и распространяй доброту!', 'post_33_image.jpg', '2022-06-02'),
(5, 'Дай себе время и восстанови силы!', 'post_34_image.jpg', '2022-06-03'),
(15, 'Жизнь слишком коротка, чтобы тратить время на вещи, которые не имеют значения!', 'post_35_image.jpg', '2022-06-04'),
(3, 'Успех не окончателен, поражение не фатально: это мужество, чтобы продолжать, которое имеет значение!', 'post_36_image.jpg', '2022-06-05'),
(5, 'Наслаждайся мелочами в жизни, они делают большую разницу!', 'post_37_image.jpg', '2022-06-06'),
(15, 'Бүгін кездесу күні тыныш!', 'post_38_image.jpg', '2022-06-07'),
(15, 'Мен жаңы жерлерді айналуды ұнаймын!', 'post_39_image.jpg', '2022-06-08'),
(15, 'Мен достарымдың кездесуін жатыр!', 'post_40_image.jpg', '2022-06-09'),
(15, 'Өз болашағымда үздік күн жатыр!', 'post_41_image.jpg', '2022-06-10'),
(15, 'Мен өз жылдам жаңа шараларды жасауды ұнаймын!', 'post_42_image.jpg', '2022-06-11'),
(15, 'Мен өз жылдам көптеген танымал кездесулерді жасауды ұнаймын!', 'post_43_image.jpg', '2022-06-12'),
(15, 'Мен өз жылдам қызықтық қылуды ұнаймын!', 'post_44_image.jpg', '2022-06-13'),
(15, 'Мен жаңы жерлерден танысуды ұнаймын!', 'post_45_image.jpg', '2022-06-14');

INSERT INTO comments (post_id, user_id, comment_text, comment_date)
VALUES
(1, 5, 'Жаңылықтарды жасау өз жылдамдың мүмкіндігі!', '2022-06-15'),
(2, 7, 'Саламатты тыныш жерде!', '2022-06-16'),
(3, 9, 'Жылдам үшін жетістік жасау керек!', '2022-06-17'),
(4, 11, 'Жылдың жақындарында өз жеріңді айналу!', '2022-06-18'),
(5, 13, 'Жылдың барлық үлгілерін жасау қажет!', '2022-06-19'),
(6, 15, 'Жаңы жерлерден жетістік танысу!', '2022-06-20'),
(7, 17, 'Life is a journey, make the most of it!', '2022-06-21'),
(8, 19, 'Жылдың жақындарында өз жеріңді айналу!', '2022-06-22'),
(9, 2, 'Enjoy every moment of life!', '2022-06-15'),
(10, 4, 'Success depends on you!', '2022-06-16'),
(11, 6, 'Learn new things every day!', '2022-06-17'),
(12, 8, 'Enjoy the beauty of nature!', '2022-06-18'),
(13, 10, 'Never stop learning!', '2022-06-19'),
(14, 12, 'Stay positive at all times!', '2022-06-20'),
(15, 14, 'Life is a journey, enjoy every step!', '2022-06-21'),
(16, 16, 'Explore new things and never stop learning!', '2022-06-22');


INSERT INTO subscribers (user_id, subscriber_user_id, subscribe_date)
VALUES
  (1, 2, '2022-01-01'),
  (1, 3, '2022-02-02'),
  (1, 4, '2022-03-03'),
  (2, 5, '2022-04-04'),
  (2, 6, '2022-05-05'),
  (3, 7, '2022-06-06'),
  (3, 8, '2022-07-07'),
  (4, 9, '2022-08-08'),
  (4, 10, '2022-09-09'),
  (5, 1, '2022-10-10'),
  (6, 11, '2022-11-11'),
  (6, 12, '2022-12-12'),
  (7, 13, '2023-01-01'),
  (7, 14, '2023-02-02'),
  (8, 15, '2023-03-03'),
  (8, 16, '2023-04-04'),
  (9, 17, '2023-05-05'),
  (9, 18, '2023-06-06'),
  (10, 19, '2023-07-07'),
  (10, 20, '2023-08-08'),
  (11, 21, '2023-09-09');

INSERT INTO subscriptions (user_id, subscription_user_id, subscribe_date)
VALUES
  (1, 2, '2022-01-01'),
  (2, 3, '2022-02-02'),
  (3, 4, '2022-03-03'),
  (4, 5, '2022-04-04'),
  (5, 6, '2022-05-05'),
  (6, 7, '2022-06-06'),
  (7, 8, '2022-07-07'),
  (8, 9, '2022-08-08'),
  (9, 10, '2022-09-09'),
  (10, 1, '2022-10-10'),
  (11, 2, '2022-11-11'),
  (12, 3, '2022-12-12'),
  (13, 4, '2023-01-01'),
  (14, 5, '2023-02-02'),
  (15, 6, '2023-03-03'),
  (16, 7, '2023-04-04'),
  (17, 8, '2023-05-05'),
  (18, 9, '2023-06-06'),
  (19, 10, '2023-07-07'),
  (20, 1, '2023-08-08'),
  (21, 2, '2023-09-09');


-- Расчет общего количества постов для каждого пользователя
SELECT user_id, COUNT(*) AS total_posts
FROM posts
GROUP BY user_id;

-- Получение списка пользователей и их постов
SELECT u.user_id, u.username, p.post_text
FROM users u
JOIN posts p ON u.user_id = p.user_id;

ALTER TABLE users
ADD COLUMN is_active BOOLEAN DEFAULT true;

UPDATE users
SET is_active = false
WHERE user_id IN (1, 9, 5, 12, 20, 3);

-- Получение активных пользователей, у которых более 5 постов
SELECT user_id, username
FROM users
WHERE is_active = true AND user_id IN (
    SELECT user_id
    FROM posts
    GROUP BY user_id
    HAVING COUNT(*) > 5
);


-- Подсчет кол-ва комментов под постом
SELECT post_id, COUNT(*) OVER (PARTITION BY post_id) AS comment_count
FROM comments;

-- Получить все детали пользователей у которых есть посты
SELECT u.user_id, u.username, p.post_text
FROM users u
LEFT JOIN posts p ON u.user_id = p.user_id;


-- индекс на столбец "email" в таблице "users"
CREATE INDEX idx_users_email ON users (email);

-- Индекс внешнего ключа на столбец "user_id" в таблице "posts"
CREATE INDEX idx_posts_user_id ON posts (user_id);

-- Индекс для поискового запроса на столбец "post_text" в таблице "posts"
CREATE INDEX idx_posts_title ON posts (post_text);

-- Функция что-бы узнать подписаны ли два человека друг на друга
CREATE OR REPLACE FUNCTION are_users_subscribed(user1_id INT, user2_id INT)
RETURNS BOOLEAN AS $$
DECLARE 
	is_subscribed BOOLEAN;
BEGIN
  SELECT EXISTS (
    SELECT 1
    FROM subscriptions
    WHERE (user_id = user1_id AND subscription_user_id = user2_id)
      OR (user_id = user2_id AND subscription_user_id = user1_id)
  ) INTO is_subscribed;

  RETURN is_subscribed;
END;
$$ LANGUAGE plpgsql;

SELECT are_users_subscribed(1, 6);


CREATE PROCEDURE SubscribeUsers(
  IN user1_id INT,
  IN user2_id INT
)
LANGUAGE plpgsql
AS $$
DECLARE 
	subscribe_date DATE = CURRENT_DATE;
BEGIN
  -- Insert into subscribers table
  INSERT INTO subscribers (user_id, subscriber_user_id, subscribe_date)
  VALUES (user1_id, user2_id, subscribe_date);

  -- Insert into subscriptions table
  INSERT INTO subscriptions (user_id, subscription_user_id, subscribe_date)
  VALUES (user2_id, user1_id, subscribe_date);
END;
$$

CALL SubscribeUsers(1, 6);


