import 'package:flutter/material.dart';
import 'package:googledocsclone/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Image.asset(
            'assets/images/google_icon.png',
            width: 30,
            height: 30,
          ),
          label: const Text(
            'Sign In with Google',
            style: TextStyle(color: blackColor),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: whiteColor,
            minimumSize: const Size(150, 50),
          ),
        ),
      ),
    );
  }
}
