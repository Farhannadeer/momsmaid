
import 'package:flutter/material.dart';





const lightGrey= Color(0xff33122114);
const captionColor= Color(0xffB3BEC5);
const buttonRed=Color(0xffA90E12);
const textBlack=Color(0xff383C51);
const inputBorder=Color(0xffE4E4E4);
const backgroundGrey=Color(0xffFCFEFF);
const resendOtpColor=Color(0xffC3C4C8);
const iconColor=Color(0xff808BA4);
const kgColor=Color(0xffA2A5B2);
const priceOrange=Color(0xffDE3F21);
const circleIcon=Color(0xff929194);
const drawerBackground=Color(0xffE9EEF6);
const minusButtonColor=Color(0xffFAFAFC);
const cartPageText=Color(0xff71718D);
const freeColor=Color(0xff79CE09);
const shadowColour=Color(0xffF5F7FC);
const editColour=Color(0xffB0B3C5);
const customerCareColor=Color(0xffB5B9CB);
const versionColour=Color(0xffD2D4DC);
const addressColor=Color(0xff6F717E);
const dividerColor=Color(0xffE8ECF5);




//INPUT TEXT FIELD DECORATION
const kuserInputButtons = InputDecoration(
//  hintText: 'Enter your mobile number',
//  hintStyle: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w400),
  fillColor: Colors.white,
  filled: true,
  counterText: "",
  contentPadding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: inputBorder, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: inputBorder, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);





const kotpInputButtons = InputDecoration(
  counterText: "",
  fillColor: Colors.white,
  filled: true,
//  contentPadding: EdgeInsets.only(bottom: 10.0, left: 18.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: inputBorder, width: 0.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: inputBorder, width: 0.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);