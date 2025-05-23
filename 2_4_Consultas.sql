/*
Consultas a las tablas de una BDR
=================================

SELECT nombre_columna_a_seleciconar [[AS] columna_renombrada]
	[, nombre_columna_a_seleciconar [[AS] columna_renombrada] ... ]
FROM tabla_a_consultar [[AS] tabla_renombrada]
WHERE condiciones_de_filtro_de_filas;
*/

/*
Condiciones de Filtro
---------------------
- Operadores de Comparación: =, < , >, <=, >=, <>
- Operadores Lógicos: NOT (negar una condición), AND (conjunción de condiciones), OR (disyunción de condiciones)
*/

SELECT * FROM clientes;

SELECT c.id, c.nombre AS nombre_comercial, c.direccion, c.ciudad FROM clientes AS c;

SELECT e.id, e.nombre FROM empleados AS e WHERE e.id_proyecto = 4 AND e.sueldo >= 60000;


/*
Obtener todos los valores únicos y sin repeticiones
---------------------------------------------------
SELECT DISTINCT nombre_columnas_a_seleccionar
 FROM tabla_a_consultar
 [WHERE condiciones];
*/

SELECT DISTINCT e.sueldo FROM empleados AS e;

/*
Funciones de Agregación
-----------------------
- COUNT: Nos da el número total de filas seleccionadas
- SUM: Suma los valores de una columna
- MIN/MAX: Mínimo/Máximo de una columna
- AVG: Calcula el valor medio de una columna
*/

SELECT COUNT(*) AS numero_departamentos FROM departamentos WHERE ciudad = "Palma";

SELECT COUNT(DISTINCT e.ciudad_departamento) FROM empleados AS e;

SELECT SUM(e.sueldo) AS gasto_anual, MIN(e.sueldo) AS minimo, MAX(e.sueldo) AS maximo, AVG(e.sueldo) AS promedio FROM empleados e;

/*
Subconsultas
------------

SELECT columnas_a_consultar FROM tabla 
	WHERE condiciones = (SELECT columnas_a_consultar FROM tabla2 WHERE condiciones2)
*/

SELECT p1.id, p1.nombre FROM proyectos p1 
	WHERE p1.precio = (SELECT MAX(p2.precio) FROM proyectos p2);

SELECT p1.id, p1.nombre FROM proyectos p1 
	WHERE p1.precio = (SELECT MIN(p2.precio) FROM proyectos p2);
    
    
/*
Encontrar valores comprendidos entre un mínimo y un máximo
----------------------------------------------------------

SELECT nombre_columnas_a_consultar
 FROM tabla_a_consultar
 WHERE columna BETWEEN limite_inferior AND limite_superior; <-> columna >= limite_inferior AND columna <= limite_superior
*/

SELECT e.id, e.nombre, e.sueldo FROM empleados AS e
	WHERE e.sueldo BETWEEN 20000 AND 50000;
    
/*
Encontrar valores dentro de una colección
-----------------------------------------

SELECT nombre_columnas_a_seleccionar
 FROM tabla_a_consultar
 WHERE columna [NOT] IN (valor1, valor2,..., valorN);
*/


SELECT nombre, ciudad FROM departamentos AS d WHERE d.ciudad IN ("Palma", "Barcelona") ;

SELECT nombre, ciudad FROM departamentos AS d WHERE d.ciudad NOT IN ("Palma", "Barcelona") ;


/*
Encontrar cadenas de caracteres que empiezan/terminan/contienen caracteres
--------------------------------------------------------------------------

SELECT nombre_columnas_a_seleccionar
 FROM tabla_a_consultar
 WHERE columna LIKE característica;
 
- % para expresar una secuencia de caracteres
- _ para caracteres indivuals presentes en la búsqueda
*/

SELECT e.id, e.nombre FROM empleados AS e WHERE e.nombre LIKE "J%";
SELECT e.id, e.nombre FROM empleados AS e WHERE e.nombre LIKE "%O%";
SELECT e.id, e.nombre FROM empleados AS e WHERE e.nombre LIKE "%A";

SELECT p.id, p.nombre FROM proyectos as p WHERE p.nombre LIKE "M______";
SELECT p.id, p.nombre FROM proyectos as p WHERE p.nombre LIKE "_____";
SELECT p.id, p.nombre FROM proyectos as p WHERE p.nombre LIKE "_E___";


/*
Consultar si existen o no valores nulos
---------------------------------------

SELECT nombre_columnas_a_consultar
 FROM tabla_a_consultar
 WHERE columna IS [NOT] NULL;
*/

SELECT e.id, e.nombre, e.apellido FROM empleados as e WHERE e.id_proyecto IS NULL;
SELECT e.id, e.nombre, e.apellido FROM empleados as e WHERE e.id_proyecto IS NOT NULL;


/*
Todas / Algunas filas cumplen una condición
-------------------------------------------

SELECT nombre_columnas_a_consutar
 FROM tabla_a_consultar
 WHERE columna operador_de_comparación {ALL | ANY | SOME} subconsulta;
 
 - ALL: la comparación se cumple para todos los valores de la subconsulta
 - ANY/SOME: la comparación se cumple para al menos un valor de la subconsulta
*/

SELECT p.id, p.nombre FROM proyectos AS p 
 WHERE p.precio > ALL (SELECT e.sueldo FROM empleados AS e WHERE e.id_proyecto = p.id);

SELECT p.id, p.nombre FROM proyectos AS p
 WHERE p.precio < SOME (SELECT e.sueldo FROM empleados as e WHERE e.id_proyecto = p.id);
 
/*
Tests de Existencia
-------------------

SELECT nombre_columnas_a_seleccionar
 FROM tabla_a_consultar
 WHERE [NOT] EXISTS subconsulta;
*/

SELECT e.id, e.nombre, e.apellido FROM empleados AS e
 WHERE EXISTS (SELECT * FROM proyectos AS p WHERE e.id_proyecto = p.id);
 
 SELECT e.id, e.nombre, e.apellido FROM empleados AS e
 WHERE NOT EXISTS (SELECT * FROM proyectos AS p WHERE e.id_proyecto = p.id);


/*
Ordenar una consulta
--------------------

SELECT nombre_columnas_a_consultar
 FROM tabla_a_consultar
 [WHERE condiciones]
 ORDER BY nombre_columna_según_la_cual_se_quiere_ordenar [{ASC | DESC}]
  [, col_ordenación [{ASC | DESC}] ...];
*/

SELECT e.id, e.nombre, e.apellido, e.sueldo FROM empleados AS e ORDER BY e.sueldo DESC, e.nombre ASC;


/*
Consultas con Agrupaciones de Filas en una Tabla
------------------------------------------------

SELECT nombre_columnas_a_seleccionar
 FROM tabla_a_consultar
 [WHERE condiciones]alter
 GROUP BY nombre_columnas_según_las_cuales_se_quiere_agrupar
 [HAVING condicion_para_los_grupos]
 [ORDER BY columna_ordenacion[DESC][, columna [DESC]...]];
*/

SELECT e.nombre_departamento AS nDep, e.ciudad_departamento as cDep, AVG(e.sueldo) AS sueldo_medio 
 FROM empleados AS e
 GROUP BY nDep, cDep;
 
SELECT e.id_proyecto as nPro, SUM(e.sueldo) as coste_anual
 FROM empleados as e
 GROUP BY nPro
 HAVING coste_anual > 150000;
 
 
 