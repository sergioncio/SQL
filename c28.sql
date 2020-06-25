select ciudad
from tienda 
where id = ANY
		 (select tienda_id
		from existencias
		where libro_id = ANY
				(select isbn
				from libro
				where titulo = 'El Quijote')
				)
group by ciudad
;