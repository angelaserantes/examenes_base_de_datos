db.sales.find().limit(3).pretty();

db.sales.aggregate([
  {
    $group: {
      _id: "$storeLocation",
      promedioEdad: { $avg: "$customer.age" }
    }
  }
]);

db.sales.count({
  "customer.gender": "F",
  "customer.age": { $gt: 40 }
});



db.sales.aggregate([
  {
    $sort: {
      "customer.satisfaction": -1
    }
  },
  {
    $project: {
      store: "$storeLocation",
      email: "$customer.email",
      age: "$customer.age",
      _id: 0
    }
  },
  {
    $limit: 5
  }
]);