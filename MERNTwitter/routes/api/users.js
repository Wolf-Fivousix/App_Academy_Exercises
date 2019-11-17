const express = require("express");
const router = express.Router();
const User = require("../../models/User");
const bcrypt = require("bcryptjs");

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

                // Insecure way of doing it.
                // newUser.save()
                //     .then(user => response.send(user))
                //     .catch(error => response.send(error));

                bcrypt.genSalt(10, (error, salt) => {
                    bcrypt.hash(newUser.password, salt, (error, hashedPassword) => {
                        if (error) throw error;
                        newUser.password = hashedPassword;
                        newUser.save()
                            .then(user => response.json(user))
                            .catch(error => console.log(error));
                    });
                });
            }
        });
});

module.exports = router;