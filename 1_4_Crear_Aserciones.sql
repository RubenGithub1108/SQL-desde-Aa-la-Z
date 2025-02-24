/*
Cómo Crear Aserciones
=====================

CREATE ASSERTION nombre_de_la_aserción CHECK (condiciones);


CREATE ASSERTION restricción_frogames
	CHECK (NOT EXISTS (SELECT * 
						FROM proyectos p, empleados e
						WHERE p.codigo_proyecto = e.num_proyecto
                        AND e.sueldo >= 8.0E+4 
                        AND p.nom_proyecto = "Frogames"
						)
		  );
          
DROP ASSERTION nombre_de_la_asercion;

DROP ASSERTION  restricción_frogames;        
*/
