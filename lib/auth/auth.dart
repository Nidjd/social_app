import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media/auth/registerOrLogin.dart';
import 'package:social_media/pages/home_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // the user is login
        if (snapshot.hasData) {
          return const HomePage();
        } else {
          // user is not login
          return const RegisterOrLogin();
        }
      },
    );
  }
}
