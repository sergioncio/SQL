select nombre
from autor
where id IN
		(select autor_id
		from libro 
		where precio > (select precio
							from libro
							where titulo = 'Pérsiles y Segismunda'))
;