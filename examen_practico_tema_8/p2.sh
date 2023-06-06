use gestion_viajes

db.createCollection("viajeros")
db.viajeros.insertMany([
  {
    nombre: "María Fernández",
    nacionalidad: "Española",
    fechaNacimiento: ISODate("1995-07-10")
  },
  {
    nombre: "Pepe López",
    nacionalidad: "Española",
    fechaNacimiento: ISODate("1992-09-22")
  },
  {
    nombre: "Nuria López",
    nacionalidad: "Francesa",
    fechaNacimiento: ISODate("1972-01-05")
  }
]);

db.createCollection("vuelos")
db.vuelos.insertMany([
  {
    idViajero: ObjectId("647ef1a38417031254953752"),
    origen: "Madrid",
    destino: "Vigo",
    fechaSalida: ISODate("2023-06-10T09:30:00Z"),
    fechaLlegada: ISODate("2023-06-10T11:00:00Z")
  },
  {
    idViajero: ObjectId("647ef1a38417031254953752"),
    origen: "Barcelona",
    destino: "Alicante",
    fechaSalida: ISODate("2023-06-12T13:45:00Z"),
    fechaLlegada: ISODate("2023-06-12T15:15:00Z")
  },
  {
    idViajero: ObjectId("647ef1a38417031254953753"),
    origen: "Madrid",
    destino: "Valencia",
    fechaSalida: ISODate("2023-06-14T08:00:00Z"),
    fechaLlegada: ISODate("2023-06-14T09:30:00Z")
  },
{
    idViajero: ObjectId("647ef1a38417031254953754"),
    origen: "Madrid",
    destino: "Lugo",
    fechaSalida: ISODate("2023-06-14T08:00:00Z"),
    fechaLlegada: ISODate("2023-06-14T09:30:00Z")
  },
]);

db.createCollection("ciudades")
db.ciudades.insertMany([
  {
    nombre: "Madrid",
    habitantes: 3223334,
    descripcion: "Capital de España, con grandes parques y museos"
  },
  {
    nombre: "Vigo",
    habitantes: 350000,
    descripcion: "Ciudad costera con el mayor puerto de Europa"} ,
  {
    nombre: "Barcelona",
    habitantes: 1620343,
    descripcion: "Ciudad reconocida por su arquitectura modernista."
  },
  {
    nombre: "Valencia",
    habitantes: 7999413,
    descripcion: "Ciudad costera, pionera de la dieta mediterranea y con playas con encanto."
  },
  {
    nombre: "Lugo",
    habitantes: 1620343,
    descripcion: "Ciudad que conserva murallas romanas."
  },
  {
    nombre: "Alicante",
    habitantes: 4020343,
    descripcion: "Ciudad mediterranea con grandes playas."
  },
]);