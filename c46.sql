select isbn, titulo, nombre
from libro, editorial
where nombre IN
		(select nombre
		from editorial
		where editorial_id=id)
AND
	 not (isbn IN
		(select libro_id
		from existencias
		GROUP BY existencias))
;
