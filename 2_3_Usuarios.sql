/*
Crear un usuario para la base de datos
======================================

CREATE USER 'nombre_de_usuario'@'ip_base_de_datos' IDENTIFIED BY 'password';

*/

CREATE USER 'juangabriel'@'localhost' IDENTIFIED BY 'p4ssw0rd';

/*
Autorizaciones
==============

GRANT privilegios ON objeto TO usuario
[WITH GRANT OPTION];

Privilegios
-----------
- ALL PRIVILEGES: todos los permisos sobre el objeto
- USAGE: usar el objeto especificado
- SELECT: consultas
- INSERT[(columnas)]: inserciones
- UPDATE[(columnas)]: modificaciones
- DELETE: borrados
- REFERENCES[(columnas)]: referencias del objeto en restricciones

Objeto
------
- DOMAIN: dominio
- TABLE: tabla
- VIEW: vista

Usuario
-------
- PUBLIC: todo el mundo
- lista de usuarios a los que se quiere autorizar

- WITH GRANT OPTION: permite al usuario otorgar nuevas autoriaciones de acceso, con
las mismas condiciones (o menores) de los objetos a los que ha sido asignado.
*/

GRANT SELECT ON bdinfo.clientes TO 'juangabriel';

SHOW GRANTS;

SHOW GRANTS FOR 'juangabriel'@'localhost';


/*
Modo Alternativo de otorgar permisos
------------------------------------

UPDATE mysql.user SET XXX_priv = 'Y' WHERE user = 'nombre_del_usuario' AND host = 'base_de_datos';

*/

DESC mysql.user;

SELECT * FROM mysql.user;

UPDATE mysql.user SET Select_priv = 'Y' WHERE user = 'juangabriel' AND host = 'localhost';

FLUSH PRIVILEGES;


/*
Desautorizar usuarios
=====================

REVOKE [GRANT OPTION FOR] privilegios ON objeto FROM usuarios [RESTRICT | CASCADE];
*/

REVOKE SELECT ON bdinfo.clientes FROM 'juangabriel'@'localhost';

UPDATE mysql.user SET Select_priv = "N" 
WHERE user = "juangabriel" AND host = "localhost";
FLUSH PRIVILEGES;


/*
Eliminar usuario de la base de datos
====================================

DROP USER 'nombre_de_usuario'@'base_de_datos';
*/

DROP USER 'juangabriel'@'localhost';