select cliente_id, count(id)
from pedido
GROUP BY cliente_id;