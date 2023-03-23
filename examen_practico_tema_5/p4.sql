Diagrama físico
```mermaid
classDiagram
class Persona {
    PK id_persona: int
    dni: string
    nombre: string
}

class Foto {
    PK  id_foto: int
    titulo_foto: string
    fecha: date
}

class Monumento {
    PK  id_monumento: int
    nombre: string
    antiguedad: int
    ciudad: string
}

class Recuerdo {
    PK  id_recuerdo: int
   FK id_foto: int
    FK id_persona: int
     FK id_monumento: int
}

Recuerdo "1" -- "1" Foto : id_foto
Recuerdo "1" -- "1" Persona : id_persona
Recuerdo "1" -- "1" Monumento : id_monumento
```


Estructura para implementar el diagrama en sql:
CREATE TABLE Persona (
    id_persona INT PRIMARY KEY,
    dni VARCHAR(20) NOT NULL,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Foto (
    id_foto INT PRIMARY KEY,
    titulo_foto VARCHAR(100) NOT NULL,
    fecha DATE NOT NULL
);

CREATE TABLE Monumento (
    id_monumento INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    antiguedad INT NOT NULL,
    ciudad VARCHAR(50) NOT NULL
);

CREATE TABLE Recuerdo (
    id_recuerdo INT PRIMARY KEY,
    id_foto INT NOT NULL,
    id_persona INT NOT NULL,
    id_monumento INT NOT NULL,
    FOREIGN KEY (id_foto) REFERENCES Foto(id_foto),
    FOREIGN KEY (id_persona) REFERENCES Persona(id_persona),
    FOREIGN KEY (id_monumento) REFERENCES Monumento(id_monumento)
);

