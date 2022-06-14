-- 1) Insira 5 usuários
INSERT into users (
	first_name,
	last_name,
	email,
	password_hash,
	salary)
values (
	'Bizerra',
	'Mendonsa',
	'bez.men@mail.com',
	'AS097Sjdoan123',
	'23412.67'
	),
(
	'Zeca',
	'Piranha',
	'zec.pira@email.com',
	'asdnJAsnd(97',
	'7500'
	),
(
	'Biazinha',
	'Princi',
	'bia.pri@email.com',
	'asdnAUSDBHjadnd',
	'857.32'
	),
(
	'Ana',
	'Mirian',
	'ana.mir@email.com',
	'Mansik123asd',
	'43901.37'
	),
(
	'Mulaino',
	'Intyna',
	'mua.int@email.com',
	'MAsnd@#Nadsa',
	'7854.99');

-- 2) Insira 5 perfís para os usuários inseridos
INSERT into profiles
(bio, description, user_id)
SELECT
CONCAT('Bio de ', first_name),
CONCAT('Description de ', first_name),
id
from users
WHERE id BETWEEN 111 and 115;

-- 3) Insira permissões (roles) para os usuários inseridos
-- INSERT into users_roles (user_id, role_id)
INSERT ignore INTO users_roles (user_id, role_id)
SELECT 
id,
(SELECT id from roles order by rand() LIMIT 1) as qualquer
from users
WHERE id BETWEEN 111 AND 115;

-- 4) Selecione os últimos 5 usuários por ordem decrescente
SELECT *
from users
ORDER by id DESC
LIMIT 5;

-- 5) Atualize o último usuário inserido
UPDATE users
set email = 'email.novo@hotm.com'
WHERE id = 115;

-- 6) Remova uma permissão de algum usuário
DELETE from users_roles 
WHERE user_id = 111 AND role_id = 4;

-- 7) Remova um usuário que tem a permissão "PUT"
DELETE u 
from users u
inner join users_roles ur on u.id = ur.user_id
inner join roles r on ur.role_id = r.id 
WHERE r.name = 'PUT' AND u.id = 75;

-- 8) Selecione usuários com perfís e permissões (obrigatório)
SELECT u.id as uid, p.id as pid,
p.bio, u.first_name, r.name
FROM users as u
INNER JOIN profiles as p
ON u.id = p.user_id
INNER JOIN  users_roles as ur
ON u.id = ur.user_id
INNER JOIN roles r
ON ur.role_id = r.id;

-- 9) Selecione usuários com perfís e permissões (opcional)
SELECT u.id as uid, p.id as pid,
p.bio, u.first_name, r.name
FROM users as u
LEFT JOIN profiles as p
ON u.id = p.user_id
LEFT JOIN  users_roles as ur
ON u.id = ur.user_id
LEFT JOIN roles r
ON ur.role_id = r.id;

-- 10) Selecione usuários com perfís e permissões ordenando por salário
SELECT u.id as uid,
p.bio, u.first_name, r.name, u.salary
FROM users as u
LEFT JOIN profiles as p
ON u.id = p.user_id
LEFT JOIN  users_roles as ur
ON u.id = ur.user_id
LEFT JOIN roles r
ON ur.role_id = r.id
ORDER BY salary DESC;