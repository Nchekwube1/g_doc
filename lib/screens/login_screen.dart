import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:googledocsclone/colors.dart';
import 'package:googledocsclone/repository/auth_repository.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});
  void googleSignIn(WidgetRef ref) {
    ref.read(authRepositpryProvider).signInWithGoogle();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () => googleSignIn(ref),
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
