1. select * from trips where start_station is null;
2. update trips 
set start_station = end_station where 
start_station is null
3.
-- Podriamos modificar la columna utilizando el alter para que a partir de ahora no se permitieran nulos en esos campos

ALTER TABLE public.trips
    ALTER COLUMN start_station SET NOT NULL,
    ALTER COLUMN end_station SET NOT NULL;

-- Mientra que la otra opcion seria al inicio de crear la tabla añadiendo not null a esos campos
CREATE TABLE IF NOT EXISTS public.trips
(
    id integer NOT NULL,
    duration integer NOT NULL DEFAULT 0,
    start_date timestamp(0) without time zone,
    start_station integer NOT NULL,
    end_date timestamp(0) without time zone,
    end_station integer NOT NULL,
    bike_number character varying(6) COLLATE pg_catalog."default",
    sub_type character varying(255) COLLATE pg_catalog."default",
    zip_code character varying(255) COLLATE pg_catalog."default",
    birth_date numeric,
    gender character varying(128) COLLATE pg_catalog."default" DEFAULT 'Not Known'::character varying,
    CONSTRAINT trips_pkey PRIMARY KEY (id),
    CONSTRAINT fk_end_station FOREIGN KEY (end_station)
        REFERENCES public.stations (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE SET NULL,
    CONSTRAINT fk_start_station FOREIGN KEY (start_station)
        REFERENCES public.stations (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE SET NULL,
    CONSTRAINT trips_gender_check CHECK (gender::text = ANY (ARRAY['Male'::character varying::text, 'Female'::character varying::text, 'Not Known'::character varying::text])),
    CONSTRAINT trips_sub_type_check CHECK (sub_type::text = ANY (ARRAY['Casual'::character varying::text, 'Registered'::character varying::text]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.trips
    OWNER to postgres;
4.
delete from trips 
where 
birth_date is null;
5.
update trips 
set bike_number='B00000' where
bike_number is null;
