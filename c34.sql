select isbn, titulo
from libro
where isbn IN
		(select libro_id
		from existencias
		GROUP BY existencias)
;