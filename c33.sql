select nombre, dni
from cliente 
where nombre>
ALL		(select nombre
			from cliente
			where ciudad = 'Barcelona')
;