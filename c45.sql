select isbn, titulo
from libro
where not (isbn IN
		(select libro_id
		from existencias
		GROUP BY existencias))
;