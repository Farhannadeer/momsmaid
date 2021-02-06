import 'package:flutter/material.dart';

class Roundedbutton extends StatelessWidget {
  Roundedbutton({this.color, @required this.onPressed, this.text,this.fontSize,this.image});
  final Color color;
  final Function onPressed;
  final String text;
  final double fontSize;
  final Widget image;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      color: color,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(
        onPressed: onPressed,
//        minWidth: MediaQuery.of(context).size.width/1.2,
//        height: MediaQuery.of(context).size.height/17.2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              text,
              style: TextStyle(color: Colors.white,fontSize:fontSize ),
            ),
            Container(
              child: image,
            )
          ],
        ),
      ),
    );
  }
}