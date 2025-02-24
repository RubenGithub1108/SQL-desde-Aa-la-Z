/*
Insertar datos en una tabla
===========================

INSERT INTO nombre_tabla [(columnas)]
{VALUES ({v1|DEFAULT|NULL}, ..., {vn|DEFAULT|NULL}) | <consulta>};
*/

INSERT INTO clientes 
VALUES (10, 'Frogames Formación', 'B-1234567', 'Calle Móstoles 22', 
'Palma de Mallorca', DEFAULT, 'juangabriel@frogames.es' );

INSERT INTO clientes 
(nif, nombre, id, telefono, email, direccion, ciudad)
VALUES ('43123456', 'Juan Gabriel Gomila', 20, DEFAULT, DEFAULT,
 'Calle Cartagena 24', 'Palma de Mallorca');