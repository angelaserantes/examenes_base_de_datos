--1.

CREATE OR REPLACE FUNCTION act_duracion_t()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.duration IS NULL OR NEW.duration < 20 THEN
        NEW.duration := 20;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE or replace TRIGGER act_duracion_trigger
BEFORE UPDATE ON public.trips
FOR EACH ROW
EXECUTE FUNCTION act_duracion_t();

--2.

CREATE OR REPLACE FUNCTION check_municipio_t()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.municipality IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM public.stations WHERE municipality = NEW.municipality) THEN
            RAISE EXCEPTION 'El municipio no existe en la tabla "stations" y por tanto no se actualizara';
        END IF;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_municipio_trigger
BEFORE UPDATE ON public.stations
FOR EACH ROW
EXECUTE FUNCTION check_municipio_t();