--1.

CREATE OR REPLACE FUNCTION actualiza_viaje(viaje_id integer, factor numeric) RETURNS integer AS $$
DECLARE
    duracion_actual numeric;
    num_viajes_misma_estacion integer;
    estacion_origen integer;
BEGIN
 
    SELECT duration INTO duracion_actual
    FROM trips
    WHERE id = viaje_id;

  
    UPDATE trips
    SET duration = duracion_actual * factor
    WHERE id = viaje_id;

    SELECT start_station INTO estacion_origen
    FROM trips
    WHERE id = viaje_id;

    SELECT COUNT(*) INTO num_viajes_misma_estacion
    FROM trips
    WHERE start_station = estacion_origen;

    RETURN num_viajes_misma_estacion;
END;
$$ LANGUAGE plpgsql;

-- Ejecutar funcion

SELECT actualiza_viaje(3695, 1.5) AS num_viajes;

--2.

CREATE OR REPLACE FUNCTION contar_viajes_mes(mes integer, referencia integer) RETURNS integer AS $$
DECLARE
    num_viajes integer;
    umbral_pocos numeric;
    umbral_normal numeric;
    umbral_muchos numeric;
BEGIN
    
    SELECT COUNT(*) INTO num_viajes
    FROM trips
    WHERE EXTRACT(MONTH FROM start_date) = mes;

    
    umbral_pocos := referencia * 0.25;
    umbral_normal := referencia * 0.5;
    umbral_muchos := referencia * 0.75;

    
    IF num_viajes <= umbral_pocos THEN
        RAISE NOTICE 'Número de viajes en el mes: % - Clasificación: pocos', num_viajes;
    ELSIF num_viajes <= umbral_normal THEN
        RAISE NOTICE 'Número de viajes en el mes: % - Clasificación: normal', num_viajes;
    ELSE
        RAISE NOTICE 'Número de viajes en el mes: % - Clasificación: muchos', num_viajes;
    END IF;

    
    RETURN num_viajes;
END;
$$ LANGUAGE plpgsql;

--Ejecutar funcion

SELECT contar_viajes_mes(1, 10) AS num_viajes;
--Cambiar el registro de plsql a notice debido a que no me saltaban los avisos
SET client_min_messages TO 'notice';

--3.

CREATE OR REPLACE FUNCTION borra_y_guarda(idviaje integer) RETURNS void AS $$
DECLARE
    usuario text;
    mensaje text;
BEGIN
    
    SELECT current_user INTO usuario;

    
    DELETE FROM trips WHERE id = idviaje;

    
    mensaje := 'El usuario ' || usuario || ' borró el viaje ' || idviaje;

   
    INSERT INTO viajes_borrados (mensaje, fecha_borrado) VALUES (mensaje, current_timestamp);

    
    RAISE NOTICE '%', mensaje;
END;
$$ LANGUAGE plpgsql;

--Ejecutar funcion

SELECT borra_y_guarda(3695);




