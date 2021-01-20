const express = require("express");
const cors = require("cors");
const cookieParser = require('cookie-parser');
const session = require('express-session');

const swaggerUi = require("swagger-ui-express");
const YAML = require("yamljs");
const api = require("./routes");
const { inTestEnv, inProdEnv, SERVER_PORT } = require("./env");
const { connection } = require("./db");

const app = express();
app.use(cors({
  origin: ["http://localhost:3000"],
  credentials: true
}
));
app.use(cookieParser());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(session({
  key: "userId",
  secret: "e4925157c3b7b295dc3ff9be1cc6bf916eb3c8e755f3d415eb2a3fcd6530aaf62d16bc5341fed0430bc37e133d4dd6d404d5fd949b9f332aed819da8dd8f09d6",
  resave: false,
  saveUninitialized: false,
  cookie: {
    expires: 60 * 60 * 24
  }
}))

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

// Main page
app.get('/', (req, res) => {
  res.status(200).send('Server running 🚀');
});

// routes
app.use("/api", api);

// server setup
const server = app.listen(SERVER_PORT, () => {
  if (!inTestEnv) {
    console.log(`Server running on port ${SERVER_PORT}`);
  }
});

module.exports = server;
