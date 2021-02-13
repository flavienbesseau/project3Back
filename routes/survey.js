const express = require("express");

const router = express.Router();
const { pool } = require("../db");

router.get("/", (req, res) => {
  const { experienceId } = req.query;
  console.log(experienceId);
  if (typeof experienceId === "undefined") {
    res
      .status(400)
      .send("Query param 'experienceId' is required, but received 'undefined'");
  } else {
    pool.query(
      "SELECT q.text_rating, q.text_comment, q.id FROM ms_question q LEFT JOIN ms_question_order o ON q.id = o.fk_question_id LEFT JOIN ms_survey s ON s.id = o.fk_survey_id WHERE s.fk_experience_id = ?",
      [experienceId],
      (err, results) => {
        if (err || results.length === 0) {
          console.log(err);
          res.status(500).send("Error retrieving data");
        } else {
          res.status(200).json(results);
        }
      }
    );
  }
});
module.exports = router;
