import 'package:flutter/material.dart';
import 'package:social_media/pages/login_page.dart';
import 'package:social_media/pages/register_page.dart';

class RegisterOrLogin extends StatefulWidget {
  const RegisterOrLogin({super.key});

  @override
  State<RegisterOrLogin> createState() => _RegisterOrLoginState();
}

class _RegisterOrLoginState extends State<RegisterOrLogin> {
  bool showLoginScreen = true;

  void toggleBetweenThem() {
    setState(() {
      
    });
    showLoginScreen = !showLoginScreen;
  }

  @override
  Widget build(BuildContext context) {
    return showLoginScreen
        ? LoginPage(onTap: toggleBetweenThem)
        : RegisterPage(onTap: toggleBetweenThem);
  }
}
