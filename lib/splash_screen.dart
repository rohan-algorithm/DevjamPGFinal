import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pgapp/splash_services.dart';


class SplashScreen extends StatefulWidget {

  static const String id="splash";
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  SplashServices splScreen = SplashServices();
  @override
  void initState(){
    super.initState();
    splScreen.isLogin(context);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Image(
                    image: AssetImage('assets/logo.png',),
                    width: 300,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SpinKitSpinningLines(
                    color: Colors.deepPurple.shade900,
                    size: 100.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}