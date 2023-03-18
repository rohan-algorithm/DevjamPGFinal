import 'package:flutter/material.dart';
import 'package:pgapp/splash_services.dart';

class Splash extends StatefulWidget {
  static const String id ="spl";
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  SplashServices splScreen = SplashServices();
  @override
  void initState(){
    super.initState();
    splScreen.isLogin(context);
  }
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(

            child: Text("Hello"),)
        ],
      ),
    );
  }
}
