/*
Modificación de Tablas
======================

ALTER TABLE nombre_de_la_tabla
	{acción_modificar_columna | acción_modificar_restricción_de_la_tabla};

- acción_modificar_columna := 
	{ADD [COLUMN] nombre_columna def_columna |
     ALTER [COLUMN] nombre_columna {SET DEFAULT valor_por_defecto | DROP DEFAULT} |
     DROP [COLUMN] nombre_columna {RESTRICT | CASCADE}
    }
    
- acción_modificar_restricción_de_la_tabla : = 
	{ADD restricción | 
     DROP CONSTRAINT nombre_restricción {RESTRICT | CASCADE}
    }
    
    
DROP TABLE nombre_de_la_tabla {RESTRICT | CASCADE};
*/

ALTER TABLE clientes ADD COLUMN codigo_pais VARCHAR(2);

ALTER TABLE clientes ALTER COLUMN codigo_pais SET DEFAULT 'ES';

ALTER TABLE clientes DROP COLUMN codigo_pais RESTRICT;

DROP TABLE clientes CASCADE;