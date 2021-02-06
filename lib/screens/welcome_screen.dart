import 'package:flutter/material.dart';
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
          onTap: (){
            Navigator.pushReplacementNamed(context, 'home');
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset('images/flyer.jpeg',fit: BoxFit.fill,),
          ),
        ));
  }
}
