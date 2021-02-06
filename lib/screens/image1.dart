import 'package:flutter/material.dart';
class Image1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Center(child: Image.asset("images/mm 3.png")),
      ),
    );
  }
}
