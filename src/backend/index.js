const express = require("express");

const app = express();

app.use(express.static("../front/build"));

app.get("/api", (req, res) => {
  res.send("Hello World!");
});

app.listen(80, () => {
  console.log("running");
});
