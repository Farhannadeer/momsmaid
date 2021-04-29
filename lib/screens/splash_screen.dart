import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, 'home');
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        color: Color(0xff94c35e),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height/2.5,
            width: MediaQuery.of(context).size.width/2.5,
            child: Image.asset('images/logo.png'),
          ),
        ),
      ),
    );
  }
}
