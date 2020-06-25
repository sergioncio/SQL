select titulo, libro_id, tienda_id, cantidad
from libro INNER JOIN existencias ON libro_id = isbn
;