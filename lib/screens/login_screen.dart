import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:googledocsclone/colors.dart';
import 'package:googledocsclone/repository/auth_repository.dart';
import 'package:googledocsclone/screens/home_screen.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});
  void googleSignIn(WidgetRef ref, BuildContext context) async {
    final sMessenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final responseData =
        await ref.read(authRepositpryProvider).signInWithGoogle();
    if (responseData.error == null) {
      ref.read(userProvider.notifier).update((state) => responseData.data);
      navigator
          .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      sMessenger.showSnackBar(
        SnackBar(
          content: Text(responseData.error!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () => googleSignIn(ref, context),
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
