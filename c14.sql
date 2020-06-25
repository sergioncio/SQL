select pedido_id
from datos_pedido
where libro_id IN
			(select isbn
			from libro
			where titulo='El Quijote')
;