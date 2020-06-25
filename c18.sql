select COUNT(tienda_id)
from existencias
where libro_id IN
			(select isbn
			from libro
			where autor_id IN
					(select id
					from autor
					where pais='España'))
;