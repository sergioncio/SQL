select nombre
from libro inner join autor
	on autor_id=id
where precio IN 
				(select MAX(precio)
				from libro);