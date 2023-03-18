import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pgapp/avl_clg.dart';
class SignUp extends StatefulWidget {
  static const String id = "signup";

  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;
  late String mail;
  late String pass;

  @override

  Widget build(BuildContext context) {

    String collage;
    String phone;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: ListView(
        children : [ SafeArea(
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

                    decoration:BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color : Colors.white) ,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child:  TextField(
                         onChanged: (value){
                           mail=value;
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

                    decoration:BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color : Colors.white) ,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child:  TextField(
                        onChanged: (value){
                          pass=value;
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
                  onPressed: () async{
                    try {
                      final newUser = await _auth.createUserWithEmailAndPassword(
                          email: mail, password: pass);
                      if(newUser!=null) {
                        Navigator.pushNamed(context, AvlClg.id);
                      }
                    }
                    catch(e){
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
}
