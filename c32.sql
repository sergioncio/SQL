select nombre, dni
from cliente 
where nombre>
ANY		(select nombre
			from cliente
			where ciudad = 'Barcelona')
;