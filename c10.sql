select titulo, sum(cantidad)
from libro inner join existencias
		on isbn = libro_id
group by libro_id;