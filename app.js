const express = require("express");
const cors = require("cors");
const swaggerUi = require("swagger-ui-express");
const YAML = require("yamljs");
const { inTestEnv, inProdEnv, SERVER_PORT } = require("./env");
const { connection } = require("./db");

const app = express();

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

app.get("/api/surveys/:id", (req, res) => {
  connection.query(
    "SELECT q.text_rating, q.text_comment FROM ms_question q LEFT JOIN ms_question_order o ON q.id = o.fk_question_id WHERE o.fk_survey_id = ?",
    [req.params.id],
    (err, results) => {
      if (err || results.length === 0) {
        console.log(err);
        res.status(500).send("Error retrieving data");
      } else {
        res.status(200).json(results);
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
