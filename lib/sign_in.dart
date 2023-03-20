import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pgapp/home.dart';
import 'package:pgapp/sign_up.dart';
import 'package:pgapp/viewpg.dart';
import 'package:pgapp/main.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

class SignIn extends StatefulWidget {
  static const String id = "signIn";
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final emailc = TextEditingController();
  final passc = TextEditingController();

  void dispose(){
    super.dispose();
    emailc.dispose();
    passc.dispose();
  }
  Future<UserCredential?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailc.text.toString(),
        password: passc.text.toString(),
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print('Error occurred: ${e.message}');
      }
      return null;
    } catch (e) {
      print('Error occurred: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              const SizedBox(height: 180,),
              const Center(child:Text("Hello Again!", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30
              ))),
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

                  decoration:BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color : Colors.white) ,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child:  TextField(
                       controller: emailc,
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

                  decoration:BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color : Colors.white) ,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child:  TextField(
                      obscureText: true,
                      controller: passc,
                      decoration: InputDecoration(
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
              Padding(
                padding: EdgeInsets.only(left: 22,right: 22),
                child: MaterialButton(
                  height: 70,
                  minWidth: 290,
                  onPressed: () async {
                    UserCredential? userCredential = await signIn(emailc.text.toString(), passc.text.toString());
                    if (userCredential != null) {
                      // sign in successful

                    } else {
                      // sign in failed
                    }
                    Navigator.pushNamed(context, First.id);
                  },
                  color: Colors.deepPurple[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),

                  ),
                  child: const Text("Sign in", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),),
                ),
              ),
              const SizedBox(height: 25,),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text("Not a member !", style: TextStyle(
                      //  fontWeight: FontWeight.bold,
                        fontSize: 16
                    )),
                    SizedBox(width: 8,),
                    TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, SignUp.id);
                      },
                      child: Text("Register now", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        color: Colors.deepPurple
                      )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
