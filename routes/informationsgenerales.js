const express = require("express");

const router = express.Router();
const connection = require("../db");

router.get("/:hospitalId", (req, res) => {
  const { hospitalId } = req.params;
  const experienceId = req.query.experienceId || "%";
  const specialtyId = req.query.specialtyId || "%";
  const postDateStart = req.query.postDateStart || "0000-01-01";
  const postDateEnd = req.query.postDateEnd || "9999-12-31";
  connection.query(
    `SELECT q.text_rating, r.score, r.fk_specialty_id, r.fk_hospital_id, r.fk_experience_id, r.post_date ` +
      `FROM ms_question AS q LEFT JOIN ms_response AS r ON r.fk_question_id = q.id ` +
      `WHERE r.fk_hospital_id = '${hospitalId}' ` +
      `AND r.fk_experience_id LIKE '${experienceId}' ` +
      `AND r.fk_specialty_id LIKE '${specialtyId}' ` +
      `AND r.post_date BETWEEN '${postDateStart}' AND '${postDateEnd}' `,
    (err, results) => {
      if (err) {
        console.log(err);
        res.status(500).send(err);
      } else if (results.length === 0) {
        res.status(200).json([]);
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
