import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pgapp/sign_in.dart';
import 'package:pgapp/sign_up.dart';
import 'package:pgapp/splash_screen.dart';
import 'package:pgapp/viewpg.dart';
import 'package:pgapp/splash_services.dart';
import 'splash_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pgapp/main.dart';

class SplashServices{
  void isLogin(BuildContext context){
    Timer(const Duration(seconds: 3) , ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> First())));
  }
}