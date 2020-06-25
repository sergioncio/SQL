select c1.nombre, c2.nombre
from cliente as c1, cliente as c2
where (c1.ciudad=c2.ciudad) and not (c1.nombre=c2.nombre)
;