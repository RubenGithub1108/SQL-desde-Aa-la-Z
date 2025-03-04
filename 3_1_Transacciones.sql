/*
Transacciones
=============

SET TRANSACTION {READ ONLY | READ WRITE};
sentencia1;
sentencia2;
....
sentenciaN;
{COMMIT | ROLLBACK} [WORK];
*/

SELECT * FROM empleados;

SET TRANSACTION READ WRITE;
UPDATE empleados SET sueldo = sueldo - 1000 WHERE id_proyecto = 3;
UPDATE empleados SET sueldo = sueldo + 1000 WHERE id_proyecto = 1;
COMMIT WORK;

SELECT * FROM empleados;
