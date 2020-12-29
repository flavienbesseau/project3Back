const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");

const swaggerUi = require("swagger-ui-express");
const YAML = require("yamljs");
const { inTestEnv, inProdEnv, SERVER_PORT } = require("./env");
const { connection } = require("./db");

const app = express();
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

connection.connect((err) => {
  if (err) {
    console.error(`error connecting: ${err.stack}`);
    return;
  }
  console.log(`connected as id ${connection.threadId}`);
});

// docs
if (!inProdEnv && !inTestEnv) {
  const swaggerDocument = YAML.load("./docs/swagger.yaml");
  app.use("/api-docs", swaggerUi.serve, swaggerUi.setup(swaggerDocument));
}

// pre-route middlewares
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// routes
require("./routes")(app);

app.get("/api/hospitals", (req, res) => {
  connection.query("SELECT * from ms_hospital", (err, results) => {
    if (err || results.length === 0) {
      res.status(500).send("Error retrieving data");
    } else {
      res.status(200).json(results);
    }
  });
});

app.get("/api/specialties", (req, res) => {
  connection.query("SELECT * from ms_specialty", (err, results) => {
    if (err || results.length === 0) {
      res.status(500).send("Error retrieving data");
    } else {
      res.status(200).json(results);
    }
  });
});

app.get("/api/experiences", (req, res) => {
  connection.query("SELECT * from ms_experience", (err, results) => {
    if (err || results.length === 0) {
      res.status(500).send("Error retrieving data");
    } else {
      res.status(200).json(results);
    }
  });
});

app.get("/api/questions", (req, res) => {
  connection.query("SELECT * from ms_question", (err, results) => {
    if (err || results.length === 0) {
      res.status(500).send("Error retrieving data");
    } else {
      res.status(200).json(results);
    }
  });
});

// app.get("/api/surveys/:id", (req, res) => {
//   connection.query(
//     "SELECT q.text_rating, q.text_comment FROM ms_question q LEFT JOIN ms_question_order o ON q.id = o.fk_question_id WHERE o.fk_survey_id = ?",
//     [req.params.id],
//     (err, results) => {
//       if (err || results.length === 0) {
//         console.log(err);
//         res.status(500).send("Error retrieving data");
//       } else {
//         res.status(200).json(results);
//       }
//     }
//   );
// });

app.get("/api/survey", (req, res) => {
  // let hospitalId = req.query.hospitalId;
  // let specialtyId = req.query.specialtyId;
  const { experienceId } = req.query;
  // console.log(hospitalId);
  // console.log(specialtyId);
  console.log(experienceId);
  if (typeof experienceId === "undefined") {
    res
      .status(400)
      .send("Query param 'experienceId' is required, but received 'undefined'");
  } else {
    connection.query(
      "SELECT q.text_rating, q.text_comment FROM ms_question q LEFT JOIN ms_question_order o ON q.id = o.fk_question_id LEFT JOIN ms_survey s ON s.id = o.fk_survey_id WHERE s.fk_experience_id = ?",
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

// un controler avec comme para (lhopital service+type dhospit) et qui retourne le bon survey

app.post("/api/surveys/responses", (req, res) => {
  const {
    score,
    text_answer,
    fk_question_id,
    fk_user_id,
    fk_hospital_id,
    fk_speciality_id,
  } = req.body;
  connection.query(
    "INSERT INTO ms_response(score, text_answer, fk_question_id, fk_user_id, fk_hospital_id, fk_speciality_id) VALUES(?, ?, ?, ?, ?, ?)",
    [
      score,
      text_answer,
      fk_question_id,
      fk_user_id,
      fk_hospital_id,
      fk_speciality_id,
    ],
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

// server setup
const server = app.listen(SERVER_PORT, () => {
  if (!inTestEnv) {
    console.log(`Server running on port ${SERVER_PORT}`);
  }
});

module.exports = server;
