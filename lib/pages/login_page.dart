// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(29, 27, 32, 1.0),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.android,
              size: 80,
            ),

            SizedBox(
              height: 10,
            ),

            // Hello again!--------------------------------------------------------------------------------------------------
            Text(
              'Hello Again!',
              style: GoogleFonts.bebasNeue(
                fontSize: 52,
                color: Color.fromRGBO(230, 224, 233, 1.0),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            Text(
              'Welcome back, you\'ve been missed!',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(230, 224, 233, 1.0),
              ),
            ),

            SizedBox(
              height: 50,
            ),

            // email textfield-----------------------------------------------------------------------------------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(69, 69, 69, 1.0)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(208, 188, 255, 1.0)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Email',
                  fillColor: Color.fromRGBO(69, 69, 69, 1.0),
                  filled: true,
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            // password textfield--------------------------------------------------------------------------------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(69, 69, 69, 1.0)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(208, 188, 255, 1.0)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Password',
                  fillColor: Color.fromRGBO(69, 69, 69, 1.0),
                  filled: true,
                ),
                obscureText: true,
              ),
            ),

            SizedBox(
              height: 10,
            ),

            // sign in button------------------------------------------------------------------------------------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: GestureDetector(
                onTap: signIn,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(29, 27, 32, 1.0),
                    border:
                        Border.all(color: Color.fromRGBO(147, 143, 153, 1.0)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: Color.fromRGBO(208, 188, 255, 1.0),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 25,
            ),

            // not a member? register now------------------------------------------------------------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member?',
                  style: TextStyle(
                    color: Color.fromRGBO(230, 224, 233, 1.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: widget.showRegisterPage,
                  child: Text(
                    ' Register now',
                    style: TextStyle(
                      color: Color.fromRGBO(208, 188, 255, 1.0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 10,
            ),
            //---------------------------------------------------------------------------------------------------------------
          ]),
        ),
      )),
    );
  }
}
