select titulo
from libro
where isbn IN 
		(select libro_id
		from existencias
		where cantidad<3)
;