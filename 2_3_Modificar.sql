/*
Modificar los valores de una fila
=================================

UPDATE nombre_de_la_table
 SET columna = {expresión | DEFAULT | NULL}
 [, columna = {expresión | DEFAULT | NULL} ...]
 WHERE condiciones;
 
*/

UPDATE empleados
 SET sueldo = sueldo + 1000
 WHERE id_proyecto = 3;
 
UPDATE clientes
 SET nif = "43123456M"
 WHERE id = 20;