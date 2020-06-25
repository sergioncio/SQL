select cliente_id, count(id), nombre
from pedido INNER JOIN cliente
	ON cliente_id = dni
GROUP BY cliente_id;