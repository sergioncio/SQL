select COUNT(*)
from cliente
where dni IN
		(select cliente_id
		from pedido
		where id IN
				(select pedido_id
				from datos_pedido
				where libro_id IN
						(select isbn
						from libro
						where titulo='El Quijote')))
;