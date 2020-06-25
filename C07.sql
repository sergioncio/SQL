select libro_id, SUM(cantidad)
from existencias
group by libro_id;