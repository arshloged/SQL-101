/*1) Mostrar los datos de todas las regiones. */

SELECT * FROM regiones;

/*2) Obtener los datos de todos los municipios. */

SELECT * FROM municipios;

/*3) Mostrar todos los municipios ordenados por código de departamento. */

SELECT *
FROM municipios
ORDER BY cod_depto ASC;

/*4) Listar los datos de todos los departamentos que pertenecen a la región con código 6. */

SELECT *
FROM departamentos
WHERE cod_region = 6;

/*5) Seleccionar a los ciudadanos que pertenecen al municipio con código 901, Los datos a mostrar
son DPI, nombre, apellido, dirección y teléfono móvil.*/

SELECT dpi, CONCAT (apellido, ', ', nombre) AS nombre_completo, direccion, tel_movil
FROM ciudadanos
WHERE cod_muni = 901;

/*6) Mostrar todos los datos de los ciudadanos que tiene el apellido Pérez. */

SELECT *
FROM ciudadanos
WHERE apellido LIKE '%Perez%';

/*7) Listar a todos los departamentos ordenados por código de región. */

SELECT *
FROM departamentos
ORDER BY cod_region ASC;

/*8) Mostrar los datos de todos los ciudadanos que pertenecen al municipio con código 101,
ordenar los datos por código de municipio y apellido. */

SELECT cod_muni, apellido
FROM ciudadanos
WHERE cod_muni = 101;

/*9) Obtener todos los municipios que finalizan con la letra z. */

SELECT *
FROM municipios
WHERE nombre_municipio LIKE "%z";

/*10) Mostrar dpi, nombre completo (concatenar nombre y apellido) y teléfono móvil de los
ciudadanos del municipio con código 101, ordenar los datos por apellido de forma
descendente. */

SELECT dpi, CONCAT (nombre, ", ", apellido) AS nombre_completo, tel_movil
FROM ciudadanos
WHERE cod_muni = 101
ORDER BY apellido DESC;

/*11) Mostrar todos los ciudadanos que poseen nivel académico 3 y pertenecen al municipio 102,
ordenar los datos por código de municipio y apellido. */

SELECT cod_muni, apellido, cod_nivel_acad
FROM ciudadanos
WHERE cod_nivel_acad = 3 AND cod_muni = 102;

/*12) Agregar nuevo ciudadano. */

INSERT INTO ciudadanos (dpi, apellido, nombre, direccion, tel_casa, tel_movil, email, fechanac, cod_nivel_acad, cod_muni)
VALUES ("2383761300101", "Zoila Nue", "Vaciuda Dana", "1 calle 1-11 zona 1", "23234545", "56567878", "ziolavd@mail.com", "1995-01-01", "5", "101");

SELECT nombre
FROM ciudadanos
WHERE dpi = 2383761300101;

/*13) Agregar una nueva región, invente los datos. */

INSERT INTO regiones (cod_region, nombre, descripcion)
VALUES (222, "Zangamandapio", "region inventada");

SELECT nombre
FROM regiones
WHERE cod_region = 222;

/*14) Agregar un nuevo departamento para la región inventada. */

INSERT INTO departamentos (cod_depto, nombre_depto, cod_region)
VALUES (27, "La Vecindad", 222);

SELECT nombre_depto
FROM departamentos
WHERE cod_region = 222;


/*15) Agregar un nuevo municipio en el departamento creado en el inciso anterior. */

INSERT INTO municipios (cod_muni, nombre_municipio, cod_depto)
VALUES (99, "El Patio", 27);

SELECT *
FROM departamentos
WHERE cod_depto = 27;

/*16) Agregar un nuevo nivel académico, invente los datos. */

INSERT INTO nivelesacademicos (cod_nivel_acad, nombre, descripcion)
VALUES (9, "Astronauta", "Llegó a la luna");

SELECT *
FROM nivelesacademicos;

/*17) Agregar nombre, teléfono de casa, teléfono móvil, código de nivel académico, código de
municipio y dpi para un ciudadano. (invente los datos). */

INSERT INTO ciudadanos (dpi, apellido, nombre, direccion, tel_casa, tel_movil, email, fechanac, cod_nivel_acad, cod_muni)
VALUES ("509133470101", "Shirly", "Gonzalez Rodriguez", "1 calle 1-12 zona 1", "", "44232402", "shirlin@mail.com", "1995-10-07", "9", "99");

SELECT *
FROM ciudadanos
WHERE dpi = 509133470101;

/*18) Cambiar la dirección y el teléfono para el ciudadano con el DPI 2283761300101, los nuevos
datos son:
Dirección: 7ma. calle 7-77 zona 7
Teléfono de casa: 22224444 */

UPDATE ciudadanos
SET tel_casa = "22224444",
	direccion = "7ma. calle 7-77 zona 7"
WHERE	dpi = 2283761300101;

/*19) Modificar el correo electrónico para el ciudadano con el DPI 4455667780105 este debe ser
zoyelnuevo@mail.com. */

UPDATE ciudadanos
SET	email = "zoyelnuevo@mail.com"
WHERE dpi = "4455667780105";

/*20) Modificar Apellido, dirección, teléfono de casa, teléfono móvil y fecha de nacimiento de algún
ciudadano existente, invente todos los datos. */

UPDATE	ciudadanos
SET apellido = "Sian", direccion = "Rafael, zona 18", tel_movil = "85963265", fechanac ="2004-11-22"
WHERE	dpi = 509133470101;

SELECT *
FROM ciudadanos
WHERE dpi = 509133470101;

/*21) Cambiar el nombre de la región agregada en el inciso 13, el nombre debe ser Región 13. */

UPDATE	regiones
SET nombre = "Region 1-3"
WHERE cod_region = 222;

SELECT *
FROM regiones;

/*22) Modificar los datos del nivel académico agregado en el inciso 16, el nombre debe ser Nivel 16 y
en la descripción colocar el texto nombre modificado en la consulta 22. */


UPDATE	nivelesacademicos
SET nombre = "Nivel 16 de Astronauta"
WHERE	cod_nivel_acad = 9;

SELECT *
FROM nivelesacademicos;

/*23) Eliminar el nivel académico inventado. */

DELETE FROM nivelesacademicos
WHERE	cod_nivel_acad =9;

/*24) 24. Eliminar todos los ciudadanos que nacieron en el municipio con el código 2217 */

DELETE FROM ciudadanos
WHERE cod_muni = 2217;

/*25) Eliminar al ciudadano con DPI 2283761300101 */

DELETE FROM ciudadanos
WHERE	dpi = 2283761300101;

/*26) Eliminar a todos los ciudadanos que nacieron en el municipio 101 y que tienen fecha de
nacimiento menor a 1980. */

DELETE FROM ciudadanos
WHERE cod_muni = 101 AND fechanac <= "1980-01-01";

/*27) Eliminar todos los departamentos de la región no. 7 */

DELETE FROM departamentos
WHERE cod_region = 7;

/*28) Eliminar a los ciudadanos con teléfono móvil 33734648 y teléfono de casa 21243830 */

DELETE FROM ciudadanos
WHERE tel_movil= "33734648", tel_casa = "21243830";