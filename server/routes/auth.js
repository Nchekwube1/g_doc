const express = require("express");
const User = require("../models/usermodel");
const authRouter = express.Router();

authRouter.post("/api/signup", async (req, res) => {
  try {
    console.log({
      req,
    });
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
      res.status(200).json({
        message: "User created successfully!!",
        data: {
          email: user?.email ?? "",
          name: user?.name ?? "",
          profilePicture: user?.profilePicture ?? "",
          id: user?._id ?? "",
        },
      });
    } else {
      res.status(403).json({
        message: "User already exists!!",
        data: {
          email: user?.email ?? "",
          name: user?.name ?? "",
          profilePicture: user?.profilePicture ?? "",
          id: user?._id ?? "",
        },
      });
    }
  } catch (e) {
    res.status(500).json({
      message: e.message,
    });
  }
});

module.exports = authRouter;
