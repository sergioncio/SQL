select ciudad
from tienda 
where not (id = ANY
		 (select tienda_id
		from existencias
		where libro_id = ALL
				(select isbn
				from libro
				where titulo = 'El Quijote'))
				)
group by ciudad
;