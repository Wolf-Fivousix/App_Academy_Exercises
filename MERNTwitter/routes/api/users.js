const express = require("express");
const router = express.Router();
const User = require("../../models/User");

router.get("/test", (request, response) => {
    response.json({ message: "This is the user route." });
});

router.post("/register", (request, response) => {
    User.findOne({ email: request.body.email })
        .then(user => {
            if (user) {
                return response.status(400).json({ email: "Email has already been used" });
            }
            else {
                const newUser = new User({
                    handle: request.body.handle,
                    email: request.body.email,
                    password: request.body.password
                });

                newUser.save()
                    .then(user => response.send(user))
                    .catch(error => response.send(error));
            }
        });
});

module.exports = router;