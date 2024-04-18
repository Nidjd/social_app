import 'package:flutter/material.dart';
import 'package:social_media/components/my_button.dart';
import 'package:social_media/components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.onTap});
  final void Function() onTap;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "Lets create an account for you ",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                MyTextField(
                  controller: emailController,
                  isScure: false,
                  hintText: 'Email address',
                ),
                const SizedBox(
                  height: 12,
                ),
                MyTextField(
                  controller: passwordController,
                  isScure: true,
                  hintText: 'Password',
                ),
                const SizedBox(
                  height: 12,
                ),
                MyTextField(
                  controller: confirmPasswordController,
                  isScure: true,
                  hintText: 'Confirm password',
                ),
                const SizedBox(
                  height: 12,
                ),
                MyButton(
                  onPressed: () {},
                  text: 'Sign Up',
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "already have an account ? ",
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        " Login ",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
