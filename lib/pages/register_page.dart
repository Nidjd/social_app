import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  bool isLoading = false;
  void signUp() async {
    try {
      setState(() {
        isLoading = true;
      });
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      FirebaseFirestore.instance
          .collection('Users')
          .doc(credential.user!.email)
          .set({
            'username':emailController.text.split('@')[0],
            'bio':'Empty Bio'
          });
      isLoading = false;
      setState(() {});
    } on FirebaseAuthException catch (e) {
      // if (e.code == 'weak-password') {
      //   print('The password provided is too weak.');
      // } else if (e.code == 'email-already-in-use') {
      //   print('The account already exists for that email.');
      // }

      showMessage(e);
      isLoading = false;
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  void showMessage(FirebaseAuthException e) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.red[700],
        title: Text(
          e.code,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  showAlert(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        contentPadding: const EdgeInsets.all(10),
        backgroundColor: Colors.red[900],
      ),
    );
  }

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
                isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : MyButton(
                        onPressed: () {
                          if (passwordController.text ==
                              confirmPasswordController.text) {
                            signUp();
                          } else {
                            showAlert(
                              "please write the password correctly",
                            );
                          }
                        },
                        text: 'Sign UP',
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
