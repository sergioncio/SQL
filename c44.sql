select dni, nombre, ciudad
from cliente
where dni>
ALL		(select dni
			from cliente
			where ciudad ='Barcelona')
and dni <
ANY		(select dni
			from cliente
			where ciudad ='Madrid')
;