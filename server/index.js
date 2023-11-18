const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");
require("dotenv").config();
const app = express();

app.use(express.json());
app.use(authRouter);
console.log({
  db: process.env.DB,
});
mongoose
  .connect(process.env.DB)
  .then((dbRes) => {
    console.log("connection successful 🔥 ");
    // console.log({
    //   dbRes,
    // });
  })
  .catch((dbErr) => {
    console.log({
      dbErr,
    });
  });
app.get("/home", (req, res) => {
  res.json("Welcome!!! 🔥");
});
const PORT = process.env.PORT || 3000;

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
