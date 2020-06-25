select isbn, titulo
from libro
where isbn IN
		(select libro_id
		from existencias
		where tienda_id IN
				(select id
				from tienda
				where ciudad ='Madrid'))
;