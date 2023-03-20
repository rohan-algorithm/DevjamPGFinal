import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pgapp/avl_clg.dart';
import 'package:pgapp/home.dart';

import 'main.dart';


class SignUp extends StatefulWidget {
  static const String id = "signup";

  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  late String mail;
  late String pass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: ListView(
          children: [ SafeArea(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 180,),
                  const Text("Hello Again!", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                  )),
                  const SizedBox(height: 20,),
                  Text("Welcome back, You've been missed!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 20
                      )),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Container(

                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: TextFormField(
                          validator: (input) {
                            if (input!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },

                          onChanged: (value) {
                            mail = value;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                            icon: Icon(Icons.email),
                          ),
                        ),
                      ),

                    ),
                  ),
                  const SizedBox(height: 20,),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Container(

                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: TextFormField(
                          validator: (input) {
                            if (input!.length < 6) {
                              return 'Your password needs to be at least 6 characters';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            pass = value;
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              icon: Icon(Icons.password),
                              suffixIcon: Icon(Icons.remove_red_eye)
                          ),
                        ),
                      ),

                    ),
                  ),
                  const SizedBox(height: 30,),

                  MaterialButton(
                    height: 60,
                    minWidth: 370,
                    onPressed: () async {
                      try {
                        final newUser = await _auth
                            .createUserWithEmailAndPassword(
                            email: mail, password: pass);
                        if (newUser != null) {
                          Navigator.pushNamed(context, First.id);
                        }
                      }
                      catch (e) {
                        print(e);
                      }
                    },
                    color: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),

                    ),
                    child: const Text("Register", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),),
                  ),
                  const SizedBox(height: 30,),

                ],
              ),
            ),
          ),
          ]
      ),

    );
  }

  void signUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: mail,
          password: pass,
        );
        User? user = userCredential.user;
        await FirebaseFirestore.instance.collection('users').doc(user?.uid).set(
            {
              'email': mail,
            });
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }
}