const express = require("express");
const cors = require("cors");
const cookieParser = require("cookie-parser");
const swaggerUi = require("swagger-ui-express");
const YAML = require("yamljs");
const api = require("./routes");
const { inTestEnv, inProdEnv, SERVER_PORT } = require("./env");
const connection = require('./db');

const app = express();
app.use(
  cors({
    origin: ["http://localhost:3000", process.env.FRONTEND_BASE_URL],
    credentials: true
  })
);
app.use(cookieParser());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// docs
if (!inProdEnv && !inTestEnv) {
  const swaggerDocument = YAML.load("./docs/swagger.yaml");
  app.use("/api-docs", swaggerUi.serve, swaggerUi.setup(swaggerDocument));
}

// Main page
app.get("/", (req, res) => {
  res.status(200).send("Server running 🚀");
});

// routes
app.use("/api", api);

connection.pool.on('error', (err) => {
  console.error('error when connecting to db:', err);
  if(err.code === 'PROTOCOL_CONNECTION_LOST') {
    connection.init();
    console.log('reconnected')
  }
})

// server setup
const server = app.listen(SERVER_PORT, () => {
  if (!inTestEnv) {
    console.log(`Server running on port ${SERVER_PORT}`);
  }
});

module.exports = server;
