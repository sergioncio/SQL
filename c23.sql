select titulo
from libro
where precio IN 
				(select MAX(precio)
				from libro);