select titulo
from libro
where not (isbn IN
		(select libro_id
		from existencias 
		where cantidad >=3))
;