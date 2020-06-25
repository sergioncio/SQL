select nombre
from autor
where id IN
			(select autor_id
			from libro
			where precio > '30');