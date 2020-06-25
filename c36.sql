select isbn, titulo
from libro
where isbn IN
		(select libro_id
		from existencias
		where libro_id IN
					(select libro_id
					from datos_pedido
					where pedido_id IN
							(select id
							from pedido
							where cliente_id IN
									(select dni
									from cliente
									where ciudad='Barcelona'))))
;		