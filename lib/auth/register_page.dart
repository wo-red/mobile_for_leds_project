// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }
    
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() == _confirmpasswordController.text.trim()) {
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
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

            // Hello there!--------------------------------------------------------------------------------------------------
            Text(
              'Hello There!',
              style: GoogleFonts.bebasNeue(
                fontSize: 52,
                color: Color.fromRGBO(230, 224, 233, 1.0),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            Text(
              'Register below with your details!',
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
                obscureText: true,
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
              ),
            ),

            SizedBox(
              height: 10,
            ),

            // confirm password textfield--------------------------------------------------------------------------------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _confirmpasswordController,
                obscureText: true,
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
                  hintText: 'Confirm password',
                  fillColor: Color.fromRGBO(69, 69, 69, 1.0),
                  filled: true,
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            // sign up button------------------------------------------------------------------------------------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: GestureDetector(
                onTap: signUp,
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
                      "Sign Up",
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
                  'I am a member!',
                  style: TextStyle(
                    color: Color.fromRGBO(230, 224, 233, 1.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: widget.showLoginPage,
                  child: Text(
                    ' Login now',
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
