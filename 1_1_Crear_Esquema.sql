/* 
Creación del Esquema 
====================
   
CREATE SCHEMA 
{[nombre_del_esquema] | [AUTHORIZATION usuario]}
[lista_de_elementos_del_esquema];
*/

CREATE SCHEMA test;
CREATE DATABASE test; 

USE test;

/* 
Eliminar el Esquema 
===================

DROP SCHEMA
nombre_del_esquema
{RESTRICT | CASCADE};
*/

DROP SCHEMA test;
DROP DATABASE test;
