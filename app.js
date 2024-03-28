const express = require("express");
const app = express();

console.log("==== let's start ====");
console.log("==== it is an clock ====", "\n");

app.listen(3006, () => {
  console.log("express server running at http://127.0.0.1:3006", "\n");
});

//
app.use("/*", (req, res, next) => {
  console.log("@@@ someone invited @@@");
  //console.log(Object.keys(req))
  next();
});

//
app.use(express.static("./clock"));
