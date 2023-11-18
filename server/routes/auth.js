const express = require("express");
const User = require("../models/usermodel");
const authRouter = express.Router();

authRouter.post("/api/signup", async (req, res) => {
  try {
    const { name, email, profilePicture } = req.body;

    let user = await User.findOne({
      email,
    });
    if (!user) {
      user = new User({
        email,
        name,
        profilePicture,
      });

      user = await user.save();
      res.json({
        message: "User created successfully!!",
        data: {
          email: user?.email ?? "",
          name: user?.name ?? "",
          profilePicture: user?.profilePicture ?? "",
        },
      });
    } else {
      res.status(403).json({
        message: "User already exists!!",
      });
    }
  } catch (e) {}
});

module.exports = authRouter;
