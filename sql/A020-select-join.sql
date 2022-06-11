SELECT 
u.id as uid, u.first_name, p.bio, r.name
from users as u
left join profiles as p on u.id = p.user_id
INNER JOIN users_roles as ur on u.id = ur.user_id 
INNER JOIN roles as r on ur.role_id = r.id
WHERE u.id = 60
ORDER BY uid ASC
LIMIT 1, 2
;