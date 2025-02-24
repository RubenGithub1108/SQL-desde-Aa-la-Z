CREATE DATABASE bdinfo;

USE bdinfo;

CREATE TABLE clientes
 (id INTEGER PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL,
  nif VARCHAR(12) UNIQUE,
  direccion VARCHAR(50), 
  ciudad VARCHAR(20),
  telefono VARCHAR(12),
  email VARCHAR(30)
 );
 
 CREATE TABLE departamentos
  (nombre VARCHAR(20),
   ciudad VARCHAR(20),
   telefono VARCHAR(12),
   email VARCHAR(30),
   PRIMARY KEY (nombre, ciudad)
  );
  
  CREATE TABLE proyectos
   (id INTEGER PRIMARY KEY,
    nombre VARCHAR(20),
    precio REAL,
    fecha_inicio DATE,
    fecha_fin_prevista DATE,
    fecha_fin_real DATE DEFAULT NULL,
    id_cliente INTEGER,
    FOREIGN KEY (id_cliente) REFERENCES clientes (id),
    CHECK (fecha_inicio < fecha_fin_prevista),
    CHECK (fecha_inicio < fecha_fin_real)
   );
  
  CREATE TABLE empleados
   (id INTEGER PRIMARY KEY,
    nombre VARCHAR(20),
    apellido VARCHAR(20),
    sueldo REAL CHECK (sueldo > 11580),
    nombre_departamento VARCHAR(20),
    ciudad_departamento VARCHAR(20),
    id_proyecto INTEGER,
    FOREIGN KEY (nombre_departamento, ciudad_departamento) REFERENCES departamentos (nombre, ciudad),
    FOREIGN KEY (id_proyecto) REFERENCES proyectos (id)
   );
   
CREATE VIEW proyectos_por_cliente
 (id_cliente, num_proyectos) AS
 (SELECT c.id, COUNT(*) 
 FROM proyectos p, clientes c
 WHERE p.id_cliente = c.id
 GROUP BY c.id
 );
 
CREATE VIEW clientes_palma_valencia AS
 (SELECT * 
 FROM clientes c
 WHERE c.ciudad IN ('Palma', 'Valencia'))
 WITH CHECK OPTION;
 
