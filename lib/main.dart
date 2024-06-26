import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_media/auth/auth.dart';
import 'package:social_media/auth/registerOrLogin.dart';
import 'package:social_media/pages/login_page.dart';
import 'package:social_media/theme/dark_theme.dart';
import 'package:social_media/theme/light_theme.dart';
// Import the generated file
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkTheme,
      home: const AuthPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
