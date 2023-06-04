--1. 
SELECT floor(random() * (30 - 5 + 1)) + 5 AS numero_aleatorio;

--2.
SELECT power(4, 5) AS resultadopotencia;

--3.
CREATE SEQUENCE seq_01
    START WITH 1
    INCREMENT BY 2
    MINVALUE 1
    NO MAXVALUE
    CACHE 1;

SELECT nextval('seq_01') AS numero;

--4.
-- Para lograr el valor actual de la secuencia utilizamos currval
SELECT currval('seq_01') AS valor_actual;

-- Para lograr el siguiente valor de la secuencia utilizamos nextval
SELECT nextval('seq_01') AS siguiente_valor;

--5.
SELECT date_trunc('hour', '2001-07-24'::timestamp + interval '3 days') + interval '12 hours' AS fecha_hora;

--6.
SELECT EXTRACT(HOUR FROM diff) AS horas, EXTRACT(MINUTE FROM diff) AS minutos
FROM (
  SELECT ('08:45'::time - '07:30'::time) AS diff
) AS tiempo;

--7.
SELECT EXTRACT(SECOND FROM '2001-02-16 20:38:40'::timestamp) AS segundos;

--8.
SELECT 'Hola, me llamo' || 'Pepe' AS concatenacion;

--9.
SELECT REPLACE(REPLACE('Hola soy Pepe', 'o', ''), 'e', '') AS quitarletras;


