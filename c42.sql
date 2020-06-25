select dni
from cliente
where dni>
ANY		(select dni
			from cliente
			where ciudad ='Cartagena')
;