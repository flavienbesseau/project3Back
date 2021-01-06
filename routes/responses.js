const express = require("express");
const router = express.Router();
const { connection } = require("../db");

router.post("/", (req, res) => {
  const responses = req.body; // Array of responses
  const insertString = responses.reduce(
    (accumulator, response) =>
      `${accumulator}(${response.score}, "${response.text_answer}", ${response.id}, ${response.hospitalId}, ${response.specialtyId}, CURDATE(), "${response.pseudo}", "${response.email}"), `,
    ""
  );
  connection.query(
    `INSERT INTO ms_response(score, text_answer, fk_question_id, fk_hospital_id, fk_specialty_id, post_date, pseudo, email) VALUES ${insertString.substring(
      0,
      insertString.length - 2
    )};`,
    (err, results) => {
      if (err) {
        console.log(err);
        res.status(500).send("Error saving a survey");
      } else {
        res.status(200).send(results);
      }
    }
  );
});

module.exports = router;
