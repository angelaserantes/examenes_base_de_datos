db.restaurants.find(
  { cuisine: "Greek" },
  { name: 1, _id: 0 }
).pretty();


db.restaurants.find(
  {},
  { name: 1, cuisine: 1, borough: 1, _id: 0 }
).pretty();



db.restaurants.aggregate([
  {
    $match: {
      cuisine: "Greek",
      "grades.grade": "B"
    }
  },
  {
    $project: {
      _id: 0,
      name: 1,
      grade: { $arrayElemAt: [ "$grades.grade", { $indexOfArray: [ "$grades.grade", "B" ] } ] }
    }
  }
]).pretty();



db.restaurants.aggregate([
  {
    $match: {
      "grades.score": { $gte: 30 }
    }
  },
  {
    $project: {
      _id: 0,
      name: 1,
      score: { $filter: { input: "$grades", as: "grade", cond: { $gte: [ "$$grade.score", 30 ] } } },
      borough: 1
    }
  }
]).pretty();



db.restaurants.find(
  {
    $and: [
      { cuisine: { $in: ["Italian", "Mexican"] } },
      { borough: "Manhattan" }
    ]
  },
  {
    _id: 0,
    address: { $concat: ["$address.street", ", ", "$address.building"] },
    borough: 1,
    cuisine: 1,
    grades: 1
  }
).pretty();




