CREATE DATABASE bd_frutas_json;

CREATE TABLE frutas (
    id SERIAL PRIMARY KEY,
    info JSONB
);

INSERT INTO frutas (info)
VALUES
    ('{"nombre": "naranja", "diametro": 5, "origen": "Vigo"}'),
    ('{"nombre": "pera", "diametro": 10, "origen": "Ourense"}'),
    ('{"nombre": "manzana", "diametro": 8, "origen": "Santiago"}'),
    ('{"nombre": "melon", "diametro": 25, "origen": "Ourense"}'),
    ('{"nombre": "sandía", "diametro": 20, "origen": "Pontevedra"}');

SELECT info->>'nombre', info->>'diametro', info->>'origen'
FROM frutas
WHERE info->>'origen' = 'Ourense';


SELECT info->>'nombre', info->>'diametro', info->>'origen'
FROM frutas
WHERE info->>'nombre' LIKE 'n%';