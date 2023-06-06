db.movies.updateOne(
  { title: "Civilization" },
  { $set: { year: "1985" } }
);


db.movies.updateMany(
  {},
  { $inc: { num_mflix_comments: 10 } }
);

db.movies.updateMany(
  { runtime: { $gt: 100 } },
  { $set: { year: "100" } }
);

db.movies.deleteMany({ genres: "Action" });

db.movies.deleteMany({
  year: { $gte: "1950", $lte: "1970" },
  "imdb.votes": { $lt: 80 }
});