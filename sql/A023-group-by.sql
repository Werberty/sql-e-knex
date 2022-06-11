-- GROUP BY - agrupa valores
SELECT first_name, COUNT(id) as total from users
group by first_name
order by total DESC;

SELECT u.first_name, COUNT(u.id) as total from users as u
left join profiles as p
on p.user_id = u.id
WHERE u.id in (31, 110, 33)
group by first_name
order by total DESC
limit 10;