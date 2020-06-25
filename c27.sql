select id, ciudad
from tienda
where ciudad in
			(select max(ciudad)
			from tienda)
;