-- Q1
CREATE TABLE departments (
  department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);                                                

-- Q2
ALTER TABLE people ADD department_id INT unsigned AFTER email;

-- Q3
INSERT INTO departments (name) VALUES
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

INSERT INTO people (name, email, age, gender, department_id) VALUES
('山田太郎', 'yamada_sales1@gizumo.jp',30 , 1, 1),
('佐藤花子', 'sato_sales2@gizumo.jp', 28, 2, 1),
('鈴木一郎', 'suzuki_sales3@gizumo.jp', 35, 1, 1),
('高橋なおと', 'takahashi_dev1@gizumo.jp', 32, 1, 2),
('伊藤みさき', 'ito_dev2@gizumo.jp', 25, 2, 2),
('田辺けん', 'tanabe_dev3@gizumo.jp', 42, 1, 2),
('中村あや', 'nakamura_dev4@gizumo.jp', 40, 2, 2),
('小林将也', 'kobayashi_acc@gizumo.jp', 34, 1, 3),
('加藤ゆみ', 'kato_hr@gizumo.jp', 27, 2 , 4),
('吉田哲郎', 'yoshida_it@gizumo.jp', 52, 1, 5);

INSERT INTO reports (person_id, content) VALUES
(7, '本日は既存顧客へ連絡し、状況の確認を行いました。'),                                                                                      
(8, '新規問い合わせに対応し、サービス内容を説明しました。'),                                                                                      
(9, '提案資料を作成し、明日の商談準備を進めました。'),                                                                                           
(10, '画面表示の不具合を修正し、動作確認を行いました。'),
(11, 'データベースの構成を確認し、不要な項目を整理しました。'),
(12, 'テストデータを追加して画面の表示を確認しました。'),
(13, 'APIの処理内容を確認し、コードを読み直しました。'),
(14, '経費精算の内容を確認し、入力ミスを修正しました。'),
(15, '採用に関する書類を整理し、進捗を確認しました。'),
(16, '社内システムの動作確認を行い、問題がないか確認しました。');

-- Q4
SELECT person_id, name
FROM people
WHERE department_id IS NULL;
UPDATE people
SET department_id = 1
WHERE department_id IS NULL;

-- Q5
SELECT name, age 
FROM people
WHERE gender = 1
ORDER BY age DESC;

-- Q6
-- peopleテーブルの中から、department_idカラムの値が1である条件に当てはまるレコードを対象として、
-- name、email、ageのカラムの値を取得し、
-- created_atカラムの値を昇順に並び替えて表示するSQL文。

-- Q7
SELECT name
FROM people
WHERE (age BETWEEN 20 AND 29 AND gender = 2) OR (age BETWEEN 40 AND 49 AND gender = 1);

SELECT name
FROM people
WHERE (age >= 20 AND age <= 29 AND gender = 2) OR (age >= 40 AND age <= 49 AND gender = 1);

-- Q8
SELECT p.*
FROM people p
JOIN departments d ON p.department_id = d.department_id
WHERE d.name = '営業'
ORDER BY age;

-- Q9
SELECT AVG(age) AS average_age 
FROM people p
JOIN departments d ON p.department_id = d.department_id
WHERE (d.name = '開発') AND (p.gender = 2);

-- Q10
SELECT p.name AS '名前', d.name AS '部署名', r.content AS '内容' 
FROM people p 
JOIN departments d ON p.department_id = d.department_id 
JOIN reports r ON p.person_id = r.person_id 
ORDER BY p.name;

-- Q11
SELECT p.name
FROM people p
LEFT JOIN reports r ON p.person_id = r.person_id
WHERE r.report_id IS NULL;
