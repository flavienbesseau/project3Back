const express = require("express");

const router = express.Router();
const {pool} = require("../db");

router.get("/:id", (req, res) => {
  const hospitalId = req.params.id;
  pool.query(
    `SELECT count(*) AS count from ms_response WHERE fk_hospital_id = ${hospitalId} AND MONTH(post_date) = MONTH(CURRENT_DATE())`,
    (err, results) => {
      if (err || results.length === 0) {
        res.status(500).send("Error retrieving data");
      } else {
        res.status(200).json(results);
      }
    }
  );
});

module.exports = router;
