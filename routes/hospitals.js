const express = require("express");

const router = express.Router();
const { pool } = require("../db");

router.get("/", (req, res) => {
  pool.query("SELECT * from ms_hospital", (err, results) => {
    if (err || results.length === 0) {
      res.status(500).send("Error retrieving data");
    } else {
      res.status(200).json(results);
    }
  });
});

module.exports = router;
