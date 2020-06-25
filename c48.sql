select c.nombre, t.id
from cliente as c, tienda as t
where (c.ciudad=t.ciudad)
;