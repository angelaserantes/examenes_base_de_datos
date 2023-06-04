--1
CREATE OR ALTER FUNCTION suma_multiplicar (@n1 int, @n2 int, @n3 int) RETURNS int
AS
BEGIN
    DECLARE @resultado int;
    SET @resultado = (@n1 + @n2) * @n3;
    RETURN @resultado;
END;

--ejecutando funcion
SELECT dbo.suma_multiplicar(2, 3, 4) AS resultado;

--2 

CREATE OR ALTER FUNCTION actualizar_bicis(@nuevo_codigo nvarchar(10))
RETURNS VOID
AS
BEGIN
    UPDATE trips
    SET bike_number = ISNULL(bike_number, @nuevo_codigo);
END;


--ejecutando funcion
SELECT dbo.actualizar_bicis('000000');


--3
CREATE OR ALTER FUNCTION duracion_viaje(@duracion_total numeric, @tipo varchar(1))
RETURNS numeric
AS
BEGIN
    DECLARE @duracion numeric;

    SET @duracion = CASE
        WHEN @tipo = 'M' THEN @duracion_total
        WHEN @tipo = 'H' THEN @duracion_total / 60
        ELSE NULL
    END;

    RETURN @duracion;
END;

--ejecutando funcion
SELECT dbo.duracion_viaje(120, 'H') AS duracion_en_horas;
