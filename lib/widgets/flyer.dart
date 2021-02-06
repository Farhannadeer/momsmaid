import 'package:flutter/material.dart';

class Flyer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 36,
          left: MediaQuery.of(context).size.width / 17.8),
      height: MediaQuery.of(context).size.height / 3.7,
      width: MediaQuery.of(context).size.width/1.12,
      decoration: BoxDecoration(
        color: Color(0xff94c35e),
        boxShadow: [
          BoxShadow(
            color: Color(0xffF5F7FC),
            offset: Offset(0.0, 0.0),
            blurRadius: 5.0,
          )
        ],
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            topLeft: Radius.circular(32)),
      ),
      child: Center(child: Image.asset('images/moms.jpeg',fit: BoxFit.fill,)),

    );

  }
}