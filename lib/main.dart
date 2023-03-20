import 'package:flutter/material.dart';
import 'package:pgapp/avl_clg.dart';
import 'package:pgapp/pgl.dart';
import 'package:pgapp/search.dart';
import 'package:pgapp/sellerdash.dart';
import 'package:pgapp/sign_in.dart';
import 'package:pgapp/sign_up.dart';
import 'package:pgapp/splash_screen.dart';
import 'package:pgapp/utils/addclg.dart';
import 'package:pgapp/utils/test.dart';
import 'package:pgapp/viewpg.dart';
import 'package:pgapp/home.dart';
import 'package:pgapp/clg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_core/firebase_core.dart';

import 'addpg.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( Home(),);
}
class Home extends StatelessWidget {

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: First(),
      initialRoute: SplashScreen.id,
      routes: {
        SignIn.id: (context) => SignIn(),
        First.id: (context) => First(),
        SignUp.id: (context) => SignUp(),
        ViewPG.id: (context) => ViewPG(),
        AvlClg.id: (context) => AvlClg(),
       // Clg.id: (context) => Clg(clglistRef: clglistRef,),
        HomeScn.id: (context) => HomeScn(),
        AddClg.id: (context) => AddClg(),
        PGList.id: (context) => PGList(),
        SellerDash.id: (context) => SellerDash(),
        PgApplicationPage.id: (context) => PgApplicationPage(),
        SearchPage.id: (context) => SearchPage(),
      //  UserScreen.id: (context) => UserScreen(),
        SplashScreen.id: (context) => SplashScreen(),
      },
    );
  }
}

class First extends StatelessWidget {
  static const String id = "first";
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
             children: [
              const Text("Welcome", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30
              )),
               const SizedBox(height: 20,),
               Text("PGApp, A Perfect Solution for Student Residence",
                   textAlign: TextAlign.center,
                   style: TextStyle(
                   color: Colors.grey[700],
                   fontSize: 20
               )),
               const SizedBox(height: 20,),
               Container(
                 height: MediaQuery.of(context).size.height/3,
                 //color: Colors.blue,
                 decoration: const BoxDecoration(
                   image: DecorationImage(
                     image: AssetImage('assets/PG.jpeg'),
                   )
                 ),
               ),

               const SizedBox(height: 20,),
               MaterialButton(
                 height: 70,
                 minWidth: 330,
                 onPressed: (){
                   Navigator.pushNamed(context, SignIn.id);
                 },
                 color: Colors.white70,
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(16),

                 ),
                 child: const Text("For Owners", style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 18,
                   color: Colors.black,
                 ),),
               ),
               const SizedBox(height: 20,),
               MaterialButton(
                 height: 70,
                 minWidth: 330,
                 onPressed: (){
                   Navigator.pushNamed(context, HomeScn.id);
                 },

                 color: Colors.deepPurple[700],
                 shape: RoundedRectangleBorder(

                     borderRadius: BorderRadius.circular(16)
                 ),
                 child: Text("For Buyer", style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 18,
                   color: Colors.white,
                 ),),
               ),

             ],
          ),

        )
        ),

      ),

    );
  }
}
