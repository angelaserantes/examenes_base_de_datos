

INSERT INTO acs_objects (object_id, object_type, title, package_id, context_id, creation_user, creation_ip, modifying_user, modifying_ip)
VALUES (1, 'examen', 'pregunta2', 1, 1, 1, '192.168.2.2', 1, '192.168.2.54');


------
INSERT INTO acs_objects (object_id, object_type, title, package_id, context_id, security_inherit_p, creation_user, creation_date, creation_ip, last_modified, modifying_user, modifying_ip)
VALUES (2, 'prueba', 'pregunta22', 2, 2, true, 1, '2022-03-23 10:30:00', '192.168.2.60', '2022-03-23 10:30:00', 1, '192.168.2.80');

-----

UPDATE acs_objects SET title = 'Ejemplo de título'
WHERE object_id > 100;


-----


DELETE FROM acs_objects WHERE modifying_ip = '200.200.200.200';

