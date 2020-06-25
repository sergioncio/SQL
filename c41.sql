select dni
from cliente
where dni>
ALL		(select dni
			from cliente
			where ciudad ='Madrid')
;