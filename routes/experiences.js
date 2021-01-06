const express = require("express");
const router = express.Router();
const { connection } = require("../db");

router.get("/", (req, res) => {
  connection.query("SELECT * from ms_experience", (err, results) => {
    if (err || results.length === 0) {
      res.status(500).send("Error retrieving data");
    } else {
      res.status(200).json(results);
    }
  });
});

module.exports = router;
