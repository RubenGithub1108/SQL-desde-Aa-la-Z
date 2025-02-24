/*
Crear un dominio
================
CREATE DOMAIN nombre_del_dominio
	[AS] tipo_datos [def_defecto]
    [restricciones_del_dominio];
    
restricciones_del_dominio := 
	CONSTRAINT nombre_de_la_restriccion CHECK (condiciones)
*/

/*
Ejemplo de Creación de un Dominio
---------------------------------
CREATE DOMAIN dom_ciudades AS CHAR(20)
	CONSTRAINT ciudades_validas
    CHECK (VALUE IN ('Barcelona', 'Tarragona', 'Lerida', 'Gerona'));
*/

/*
Borrado de un Dominio
=====================
DROP DOMAIN nombre_del_dominio {RESTRICT | CASCADE};
*/

/*
Ejemplo de Borrado de un Dominio
--------------------------------
DROP DOMAIN dom_ciudades RESTRICT;
*/

/*
Modificación de un Dominio
==========================
ALTER DOMAIN nombre_del_dominio
	{acción_modificar_dominio | acción_modificar_restriccion_dominio};

acción_modificar_dominio := {SET def_defecto | DROP DEFAULT};
acción_modificar_restriccion_dominio := {ADD nombre_restricción | DROP CONSTRAINT nombre_restricción};
*/

/*
Ejemplo de Modificación de Dominio
----------------------------------

ALTER DOMAIN dom_ciudades DROP CONSTRAINT ciudades_validas;

ALTER DOMAIN dom_ciudades ADD CONSTRAINT  ciudades_validas
	CHECK (VALUE IN ('Barcelona', 'Tarragona', 'Lérida', 'Gerona', 'Palma de Mallorca);
*/
