/*
Crear una tabla
===============

CREATE TABLE nombre_de_la_tabla
 (definición_de_la_columna
 [, definición_de_la_columna...]
 [, restricciones_de_la_tabla]
 );
 
 
definición_de_la_columna := 
	nombre_de_la_columna {tipo_de_dato | dominio} 
    [def_de_valor_por_defecto]
    [restricción_de_la_columna]
*/

/*
Tipos de Datos
==============

Números Exactos
---------------
- TINYINT    (1 byte) [0, 255]
- SMALLINT   (2 bytes) [-32.768, 32.767] (16-bits)
- INT        (4 bytes) [-2.147.483.648, 2.147.483.647] (32-bits)
- BIGINT     (8 bytes) [-2E63, 2E63-1] (64-bits)
- DECIMAL(precision, escala) (de 5 a 17 bytes) [-10E38, 10E38-1]
- NUMERIC(precision, escala) es equivalente al DECIMAL

Números Aproximados
-------------------
- FLOAT(n<=24)        (4 bytes) [-3.40E38, -1.18E-38] {0} [1.18E-38, 3.40E38] (32-bits)
- DOUBLE(24<n<=53)    (8 bytes) [-1.79E308, -2.23E-308] {0} [-2.23E-308, 1.79E308] (64-bits)
- REAL                FLOAT(24)

Caracteres
----------
- CHARACTER(longitud)
- CHARACTER(max, min)
- BIT(longitud)
- BIT(max, min)
- BOOL

Fecha
-----
- YEAR (0001,... 9999)
- MONTH (01,..., 12)
- DAY (01,..., 31)
- HOUR (00,..., 23)
- MINUTE (00,..., 59)
- SECOND (00,..., 59.precision)

- DATE (YEAR-MONTH-DAY) '1988-05-19'
- TIME (HOUR:MINUTE:SECOND) '17:15:00.0000000'
- TIMESTAMP (YEAR-MONTH-DAY HOUR:MINUTE:SECOND) '2024-03-12 9:32:07.08'

*/


/*
Restricciones de columnas
=========================
- NOT NULL: La columna no puede tener valores nulos
- UNIQUE: La columna no puede tener valores repetidos (clave alternativa)
- PRIMARY KEY: La columna no puede tener valores repetidos ni nulos (clave primaria)
- REFERENCES tabla [(columna)]: Tabla y columna a referenciar; la columna es la
                                clave foránea de la columna de la tabla especificada.
- CHECK (condiciones): La columna debe cumplir unas condiciones específicas.
*/

/*
Restricciones de la tabla
=========================
- UNIQUE (columna [, columna,...]): El conjunto de columnas especificadas, no pueden tener
									valores repetidos (son claves alternativas)
- PRIMARY KEY (columna [, columna,...]): Conjunto de columnas que no pueden tener valores
										 repetidos ni nulos (claves primarias)
- FOREIGN KEY (columna [, columna,...]) 
  REFERENCES tabla2 [(columna2 [, columna2,...])]: Las columnas especificadas son claves 
												foráneas que referencian las claves primarias
												de la segunda tabla dada. Si las columnas de la
                                                tabla1 y tabla2 se llaman igual, no es necesario
                                                poner el nombre de las columnas2.
- CHECK (condiciones): La tabla tiene que cumplir con las condiciones especificadas.						
*/


/*
Definición del Valor por Defecto
================================

DEFAULT (literal | función | NULL);
- {USER | CURRENT_USER}: Identificador del Usuario Actual
- SESSION_USER: Identificador del Usuario de la Sesión
- SYSTEM_USER: Identificador del usuario del sistema operativo
- CURRENT_TIME, CURRENT_DATE, CURRENT_TIMESTAMP: Hora, Fecha o combinación de ambas actual.
*/


/*
Políticas de Borrado de las Claves Foráneas
-------------------------------------------
FOREIGN KEY clave_secundaria
	REFERENCES table [(clave_primaria)]
    [ON DELETE {NO ACTION | CASCADE | SET DEFAULT | SET NULL}]
    [ON UPDATE {NO ACTION | CASCADE | SET DEFAULT | SET NULL}];
*/

CREATE TABLE clientes
	(codigo INTEGER,
     nombre VARCHAR(30) NOT NULL,
     nif CHAR(12),
     direccion CHAR(50),
     ciudad CHAR(20),
     telefono CHAR(12),
     email CHAR(30),
     PRIMARY KEY (codigo),
     UNIQUE(nif)
    )

