select COUNT(*)
from pedido
where id IN
		(select id
		from pedido
		where entregado='SI')
		AND
		id IN(
			select pedido_id
			from datos_pedido
			where libro_id IN
					(select isbn
					from libro
					where titulo='El Quijote'))
;