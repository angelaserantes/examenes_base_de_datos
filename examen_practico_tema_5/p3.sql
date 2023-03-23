Diagrama físico

```mermaid
classDiagram
class Estudiante {
    PK dni: string
    nombres: string
    apellidos: string
}

class Asignatura {
    PK id_asignatura: int
    nombre_asignatura: string
}

class Matricula {
    PK id_matricula: int
    FK dni_estudiante: string
    FK id_asignatura: int
}

Estudiante "1" -- "0..*" Matricula
Asignatura "1" -- "0..*" Matricula
```


Estructura para implementar el diagrama en sql:

-- Crear tabla Estudiante
CREATE TABLE Estudiante (
  dni VARCHAR(9) PRIMARY KEY,
  nombres VARCHAR(50) NOT NULL,
  apellidos VARCHAR(50) NOT NULL
);

-- Crear tabla Asignatura
CREATE TABLE Asignatura (
  id_asignatura INT PRIMARY KEY,
  nombre_asignatura VARCHAR(100) NOT NULL
);

-- Crear tabla Matricula
CREATE TABLE Matricula (
  id_matricula INT PRIMARY KEY,
  dni_estudiante VARCHAR(9) REFERENCES Estudiante(dni),
  id_asignatura INT REFERENCES Asignatura(id_asignatura)
);
