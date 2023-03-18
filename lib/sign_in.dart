import 'package:flutter/material.dart';
import 'package:pgapp/viewpg.dart';
import 'package:pgapp/main.dart';
class SignIn extends StatefulWidget {
  static const String id = "signIn";
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                    child: const TextField(

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
                    child: const TextField(
                      obscureText: true,
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
              MaterialButton(
                height: 70,
                minWidth: 330,
                onPressed: (){
                  Navigator.pushNamed(context, ViewPG.id);
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
              const SizedBox(height: 30,),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Not a member !", style: TextStyle(
                      //  fontWeight: FontWeight.bold,
                        fontSize: 16
                    )),
                    SizedBox(width: 8,),
                    Text("Register now", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    )),
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
