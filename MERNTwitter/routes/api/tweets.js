const express = require("express");
const router = express.Router();

router.get("/test", (request, response) => {
    response.json({ message: "This is the tweet route." });
});

module.exports = router;