select COUNT(*)
from existencias
where libro_id IN
					(select isbn
					from libro
					where titulo='Pensées')
;