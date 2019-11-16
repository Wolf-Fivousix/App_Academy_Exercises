const express = require("express");
const app = express();

app.get("/", (request, response) => {
    response.send("Hello Wolf Academy!");
});

const port = process.env.PORT || 5000;

app.listen(port, () => { console.log(`Listening on port ${port}`)});