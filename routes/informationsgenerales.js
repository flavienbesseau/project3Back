const express = require("express");

const router = express.Router();
const { connection } = require("../db");

router.get("/:hospitalId", (req, res) => {
  connection.query(
    `SELECT q.text_rating, r.score, r.fk_specialty_id, r.fk_hospital_id, r.fk_experience_id, r.post_date FROM ms_question AS q LEFT JOIN ms_response AS r ON r.fk_question_id = q.id WHERE r.fk_hospital_id = ${req.params.hospitalId}`,
    (err, results) => {
      if (err || results.length === 0) {
        console.log(err);
        res.status(500).send(err);
      } else {
        const questions = results.map((question) => question.text_rating);
        const distinct = (value, index, self) => {
          return self.indexOf(value) === index;
        };
        const uniqueQuestions = questions.filter(distinct);

        const map1 = uniqueQuestions.map((textRating) => {
          const matchingResponses = results.filter(
            (current) => current.text_rating === textRating
          );

          const count = matchingResponses.length;
          const meanScore = (
            matchingResponses.reduce(
              (accumulateur, currentvalue) => accumulateur + currentvalue.score,
              0
            ) / count
          ).toFixed(2);
          return {
            textRating,
            meanScore,
            count,
          };
        });

        res.status(200).json(map1);
      }
    }
  );
});

module.exports = router;
