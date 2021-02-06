

import 'package:flutter/material.dart';
import 'package:js/js.dart';
import 'package:momsmaid/widgets/rounded_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:momsmaid/widgets/constants.dart';
import 'package:toast/toast.dart';
import 'package:location/location.dart';
import 'dart:io' show Platform;
import 'package:momsmaid/locationJs.dart';
import 'package:js/js.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool item1=false;
  bool item2=false;
  bool item3=false;
  var item1Count=0;
  var item2Count=0;
  var item3Count=0;
  var total;
  var item1Price=45;
  var item2Price=85;
  var item3Price=150;
  String message;
  double latitude;
  double longitude;



  void launchWhatsApp({@required number,@required message})async{
    String url="https://api.whatsapp.com/send?phone=$number&text=${Uri.encodeComponent(message)}";
    await canLaunch(url)?launch(url):print("no");
//    String url="sms:0091-9567-177-877&body=${message}";
//    await canLaunch(url)?launch(url):print("no");
  }

  void launchSms({@required message})async{
//    if(Platform.isIOS){
      String url="sms:0091-9567-177-877&body=${Uri.encodeComponent(message)}";
      await canLaunch(url)?launch(url):print("no");
//    }
//    if(Platform.isAndroid){
//      String url = 'sms:+91 9567 177 877?body=${Uri.encodeComponent(message)}';
//      await canLaunch(url)?launch(url):print("no");
//    }

  }
  success(pos) {
    try {
      print(pos.coords.latitude);
      print(pos.coords.longitude);
    } catch (ex) {
      print("Exception thrown : " + ex.toString());
    }
  }


 getCurrentPosition(){allowInterop((pos){
   setState(() {
     latitude=pos.coords.latitude;
     longitude=pos.coords.longitude;
   });
   print(latitude);
 });}







  @override
  void initState() {
    // TODO: implement initState
    super.initState();



  }

  @override
  Widget build(BuildContext context) {
    total=item1Count*item1Price+item2Count*item2Price+item3Count*item3Price;
    if(item1Count>0&&item2Count>0&&item3Count>0){
      setState(() {
        message="***** ORDER DETAILS ***** \n Ginger Garlic Paste 250 Gm:${item1Count}      \n Ginger Garlic Paste 500 Gm:${item2Count}      \n Ginger Garlic Paste 1.00 Kg:${item3Count} \n Total=${total} \n ***** CONFIRM VIA TEXT OR CALL *****";
      });
    }
    else if(item1Count<1&&item2Count>0&&item3Count>0){
      setState(() {
        message="***** ORDER DETAILS ***** \n Ginger Garlic Paste 500 Gm:${item2Count} \n Ginger Garlic Paste1.00 Kg:${item3Count} \n Total=${total} \n ***** CONFIRM VIA TEXT OR CALL *****";
      });
    }
    else if(item1Count>0&&item2Count<1&&item3Count>0){
      setState(() {
        message="***** ORDER DETAILS ***** \n Ginger Garlic Paste 250Gm:${item1Count}  \n Ginger Garlic Paste 1.00 Kg :${item3Count} \n Total=${total} \n ***** CONFIRM VIA TEXT OR CALL *****";
      });

    }
    else if(item1Count>0&&item2Count>0&&item3Count<1){
      setState(() {
        message="***** ORDER DETAILS ***** \n Ginger Garlic Paste 250 Gm:${item1Count} \n Ginger Garlic Paste 500 Gm:${item2Count} \n Total=${total} \n ***** CONFIRM VIA TEXT OR CALL ***** ";
      });
    }
    else if(item1Count>0&&item2Count<1&&item3Count<1){
      setState(() {
        message="***** ORDER DETAILS ***** \n Ginger Garlic Paste 250 Gm: ${item1Count} \n Total=${total} \n ***** CONFIRM VIA TEXT OR CALL *****";
      });
    }
    else if(item1Count<1&&item2Count>0&&item3Count<1){
      setState(() {
        message="***** ORDER DETAILS ***** \n Ginger Garlic Paste 500 Gm:${item2Count} \n Total=${total} \n ***** CONFIRM VIA TEXT OR CALL *****";
      });
    }
    else if(item1Count<1&&item2Count<1&&item3Count>0){
      setState(() {
        message="***** ORDER DETAILS ***** \n Ginger Garlic Paste 1.00 Kg :${item3Count} \n Total=${total} \n ***** CONFIRM VIA TEXT OR CALL *****";
      });
    }
    else if(item1Count<1&&item2Count<1&&item3Count<1){
      setState(() {
        message="null";
      });
    }


    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Color(0xffFCFEFF),
//          0xff94c35e
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Container(
                 margin: EdgeInsets.only(
                     top: MediaQuery.of(context).size.height / 31,
                     left: MediaQuery.of(context).size.width / 17.8),
                child: Text("Our Products",style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w300,fontSize: MediaQuery.of(context).size.height /
                    40),),
               ),

                Container(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height/5,
                        width: double.infinity,
                        child: Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context)
                                  .size
                                  .width /
                                  23,
                              right:
                              MediaQuery.of(context)
                                  .size
                                  .width /
                                  23,
                              top: MediaQuery.of(context)
                                  .size
                                  .height /
                                  57.9),
                          height: MediaQuery.of(context)
                              .size
                              .height /
                              5.7,
                          width: MediaQuery.of(context)
                              .size
                              .width /
                              1.1,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xffF5F7FC),
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 5.0,
                                )
                              ],
                              borderRadius:
                              BorderRadius.only(
                                  bottomRight:
                                  Radius.circular(
                                      15),
                                  bottomLeft:
                                  Radius.circular(
                                      15),
                                  topRight:
                                  Radius.circular(
                                      15),
                                  topLeft:
                                  Radius.circular(
                                      15)),
                            ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap:(){
                                  Navigator.pushNamed(context, 'image1');
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(
                                        context)
                                        .size
                                        .width /
                                        25,
                                  ),
                                  height:
                                  MediaQuery.of(context)
                                      .size
                                      .height /
                                      7.36,
                                  width:
                                  MediaQuery.of(context)
                                      .size
                                      .width /
                                      3.4,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xffF5F7FC),
                                        offset: Offset(
                                            0.0, 0.0),
                                        blurRadius: 5.0,
                                      )
                                    ],
                                    borderRadius:
                                    BorderRadius.only(
                                        bottomRight:
                                        Radius
                                            .circular(
                                            35),
                                        bottomLeft: Radius
                                            .circular(
                                            35),
                                        topRight: Radius
                                            .circular(
                                            35),
                                        topLeft: Radius
                                            .circular(
                                            35)),
                                  ),
                                  child: new Image.asset('images/mm 3.png'),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: MediaQuery.of(
                                        context)
                                        .size
                                        .width /
                                        22.1),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(
                                          context)
                                          .size
                                          .width /
                                          2.2,
                                      margin: EdgeInsets.only(
                                          top: MediaQuery.of(
                                              context)
                                              .size
                                              .height /
                                              36.8),
                                      child: new Text("Ginger Garlic Paste 250 Gms",
                                        style: TextStyle(
                                            fontFamily:
                                            "Montserrat",
                                            fontWeight:
                                            FontWeight
                                                .w500,
                                            color:
                                            Colors.black,
                                            fontSize: MediaQuery.of(
                                                context)
                                                .size
                                                .height /
                                                54),
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Text(
                                              '\u{20B9}45',
                                              style: TextStyle(
                                                  fontFamily:
                                                  "Montserrat",
                                                  fontWeight:
                                                  FontWeight
                                                      .bold,
                                                  color:
                                                  Colors.black,
                                                  fontSize:
                                                  MediaQuery.of(context).size.height /
                                                      54),
                                            ),
                                            margin: EdgeInsets.only(
                                                top: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                    162),
                                          ),
                                          Container (
                                            child: Text(
                                                '/ 250 Gms',
                                                style: TextStyle(
                                                    fontFamily:
                                                    "Montserrat",
                                                    fontWeight: FontWeight
                                                        .bold,
                                                    color:
                                                    Color(0xffA2A5B2),
                                                    fontSize:
                                                    MediaQuery.of(context).size.height / 54)),
                                            margin: EdgeInsets.only(
                                                top: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                    162),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: MediaQuery.of(
                                          context)
                                          .size
                                          .height /
                                          33.75,
                                      width: MediaQuery.of(
                                          context)
                                          .size
                                          .width /
                                          3.5,
                                      margin:
                                      EdgeInsets.only(
                                        top: MediaQuery.of(
                                            context)
                                            .size
                                            .height /
                                            101.25,
                                      ),
                                      child: Container(
                                          width:MediaQuery.of(context).size.width/4.36,
                                          child: item1?
                                          Container(
                                            margin: EdgeInsets.only(

                                            ),
                                            child: Row(
                                              children: [
                                                GestureDetector(

                                                  onTap:(){
                                                    setState(() {
                                                      if(item1Count>=1){
                                                        item1Count--;
                                                      }
                                                      if(item1Count==0){
                                                        item1=false;

                                                      }
                                                    });

                                                  },
                                                  child: Container(
                                                    child: CircleAvatar(
                                                      backgroundColor: Color(0xffFAFAFC),
                                                      child: Center(child: Text('-'),),
                                                      radius: MediaQuery.of(context).size.width/75,
                                                    ),
                                                    height: MediaQuery.of(context).size.height/33.75,
                                                    width: MediaQuery.of(context).size.width/15.6,
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.height/100),
                                                  child: Text("${item1Count}",style: TextStyle(fontSize: MediaQuery.of(context).size.height/45)),
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    setState(() {
                                                      item1Count++;
                                                    });
                                                  },
                                                  child: Container(

                                                    child: CircleAvatar(
                                                      backgroundColor: Color(0xffDE3F21),

                                                      child: Center(child: Text('+'),),
                                                    radius: MediaQuery.of(context).size.width/75,

                                                    ),
                                                    height: MediaQuery.of(context).size.height/33.75,
                                                    width: MediaQuery.of(context).size.width/15.6,
                                                    margin: EdgeInsets.only(left: MediaQuery.of(context).size.height/150),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                              :Roundedbutton(
                                            onPressed: () {
                                              setState(() {
                                                item1=true;
                                                item1Count=1;

                                              });
                                              print("Allah is with you ");
                                            },
                                            color: Color(0xff2e885b),
                                            fontSize: MediaQuery.of(context).size.height/70,
                                            text:
                                            "Add to Cart",
                                          )






                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),

                        ),

                      ),
                      /////////////////////SECOND ITEM///////////////////
                      Container(
                        height: MediaQuery.of(context).size.height/5,
                        width: double.infinity,
                        child: Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context)
                                  .size
                                  .width /
                                  23,
                              right:
                              MediaQuery.of(context)
                                  .size
                                  .width /
                                  23,
                              top: MediaQuery.of(context)
                                  .size
                                  .height /
                                  57.9),
                          height: MediaQuery.of(context)
                              .size
                              .height /
                              5.7,
                          width: MediaQuery.of(context)
                              .size
                              .width /
                              1.1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xffF5F7FC),
                                offset: Offset(0.0, 0.0),
                                blurRadius: 5.0,
                              )
                            ],
                            borderRadius:
                            BorderRadius.only(
                                bottomRight:
                                Radius.circular(
                                    15),
                                bottomLeft:
                                Radius.circular(
                                    15),
                                topRight:
                                Radius.circular(
                                    15),
                                topLeft:
                                Radius.circular(
                                    15)),
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.pushNamed(context, 'image2');

                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(
                                        context)
                                        .size
                                        .width /
                                        25,
                                  ),
                                  height:
                                  MediaQuery.of(context)
                                      .size
                                      .height /
                                      7.36,
                                  width:
                                  MediaQuery.of(context)
                                      .size
                                      .width /
                                      3.4,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xffF5F7FC),
                                        offset: Offset(
                                            0.0, 0.0),
                                        blurRadius: 5.0,
                                      )
                                    ],
                                    borderRadius:
                                    BorderRadius.only(
                                        bottomRight:
                                        Radius
                                            .circular(
                                            35),
                                        bottomLeft: Radius
                                            .circular(
                                            35),
                                        topRight: Radius
                                            .circular(
                                            35),
                                        topLeft: Radius
                                            .circular(
                                            35)),
                                  ),
                                  child: new Image.asset('images/mm 1.png'),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: MediaQuery.of(
                                        context)
                                        .size
                                        .width /
                                        22.1),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(
                                          context)
                                          .size
                                          .width /
                                          2.2,
                                      margin: EdgeInsets.only(
                                          top: MediaQuery.of(
                                              context)
                                              .size
                                              .height /
                                              36.8),
                                      child: new Text("Ginger Garlic Paste 500 Gms",
                                        style: TextStyle(
                                            fontFamily:
                                            "Montserrat",
                                            fontWeight:
                                            FontWeight
                                                .w500,
                                            color:
                                            Colors.black,
                                            fontSize: MediaQuery.of(
                                                context)
                                                .size
                                                .height /
                                                54),
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Text(
                                              '\u{20B9}85',
                                              style: TextStyle(
                                                  fontFamily:
                                                  "Montserrat",
                                                  fontWeight:
                                                  FontWeight
                                                      .bold,
                                                  color:
                                                  Colors.black,
                                                  fontSize:
                                                  MediaQuery.of(context).size.height /
                                                      54),
                                            ),
                                            margin: EdgeInsets.only(
                                                top: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                    162),
                                          ),
                                          Container (
                                            child: Text(
                                                '/ 500 Gms',
                                                style: TextStyle(
                                                    fontFamily:
                                                    "Montserrat",
                                                    fontWeight: FontWeight
                                                        .bold,
                                                    color:
                                                    Color(0xffA2A5B2),
                                                    fontSize:
                                                    MediaQuery.of(context).size.height / 54)),
                                            margin: EdgeInsets.only(
                                                top: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                    162),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: MediaQuery.of(
                                          context)
                                          .size
                                          .height /
                                          33.75,
                                      width: MediaQuery.of(
                                          context)
                                          .size
                                          .width /
                                          3.5,
                                      margin:
                                      EdgeInsets.only(
                                        top: MediaQuery.of(
                                            context)
                                            .size
                                            .height /
                                            101.25,
                                      ),
                                      child: Container(
                                          width:MediaQuery.of(context).size.width/4.36,
                                          child: item2?
                                          Container(
                                            margin: EdgeInsets.only(

                                            ),
                                            child: Row(
                                              children: [
                                                GestureDetector(

                                                  onTap:(){
                                                    setState(() {
                                                      if(item2Count>=1){
                                                        item2Count--;
                                                      }
                                                      if(item2Count==0){
                                                        item2=false;
                                                      }
                                                    });

                                                  },
                                                  child: Container(
                                                    child: CircleAvatar(
                                                      backgroundColor: Color(0xffFAFAFC),
                                                      child: Center(child: Text('-'),),
                                                      radius: MediaQuery.of(context).size.width/75,
                                                    ),
                                                    height: MediaQuery.of(context).size.height/33.75,
                                                    width: MediaQuery.of(context).size.width/15.6,
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.height/100),
                                                  child: Text("${item2Count}",style: TextStyle(fontSize: MediaQuery.of(context).size.height/45)),
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    setState(() {
                                                      item2Count++;
                                                    });
                                                  },
                                                  child: Container(

                                                    child: CircleAvatar(
                                                      backgroundColor: Color(0xffDE3F21),

                                                      child: Center(child: Text('+'),),
                                                      radius: MediaQuery.of(context).size.width/75,
                                                    ),
                                                    height: MediaQuery.of(context).size.height/33.6,
                                                    width: MediaQuery.of(context).size.width/15.6,
                                                    margin: EdgeInsets.only(left: MediaQuery.of(context).size.height/150),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                              :Roundedbutton(
                                            onPressed: () {
                                              setState(() {
                                                item2=true;
                                                item2Count=1;

                                              });
                                              print("Allah is with you ");
                                            },
                                            color: Color(0xff2e885b),
                                            fontSize: MediaQuery.of(context).size.height/70,
                                            text:
                                            "Add to Cart",
                                          )






                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),

                        ),

                      ),
                      ///////Third Item/////
                      Container(
                        height: MediaQuery.of(context).size.height/5,
                        width: double.infinity,
                        child: Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context)
                                  .size
                                  .width /
                                  23,
                              right:
                              MediaQuery.of(context)
                                  .size
                                  .width /
                                  23,
                              top: MediaQuery.of(context)
                                  .size
                                  .height /
                                  57.9),
                          height: MediaQuery.of(context)
                              .size
                              .height /
                              5.7,
                          width: MediaQuery.of(context)
                              .size
                              .width /
                              1.1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xffF5F7FC),
                                offset: Offset(0.0, 0.0),
                                blurRadius: 5.0,
                              )
                            ],
                            borderRadius:
                            BorderRadius.only(
                                bottomRight:
                                Radius.circular(
                                    15),
                                bottomLeft:
                                Radius.circular(
                                    15),
                                topRight:
                                Radius.circular(
                                    15),
                                topLeft:
                                Radius.circular(
                                    15)),
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap:(){
                                  Navigator.pushNamed(context, 'image3');
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(
                                        context)
                                        .size
                                        .width /
                                        25,
                                  ),
                                  height:
                                  MediaQuery.of(context)
                                      .size
                                      .height /
                                      7.36,
                                  width:
                                  MediaQuery.of(context)
                                      .size
                                      .width /
                                      3.4,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xffF5F7FC),
                                        offset: Offset(
                                            0.0, 0.0),
                                        blurRadius: 5.0,
                                      )
                                    ],
                                    borderRadius:
                                    BorderRadius.only(
                                        bottomRight:
                                        Radius
                                            .circular(
                                            35),
                                        bottomLeft: Radius
                                            .circular(
                                            35),
                                        topRight: Radius
                                            .circular(
                                            35),
                                        topLeft: Radius
                                            .circular(
                                            35)),
                                  ),
                                  child: new Image.asset('images/mm 2.png'),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: MediaQuery.of(
                                        context)
                                        .size
                                        .width /
                                        22.1),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(
                                          context)
                                          .size
                                          .width /
                                          2.2,
                                      margin: EdgeInsets.only(
                                          top: MediaQuery.of(
                                              context)
                                              .size
                                              .height /
                                              36.8),
                                      child: new Text("Ginger Garlic Paste 1.00 Kg",

                                        style: TextStyle(
                                            fontFamily:
                                            "Montserrat",
                                            fontWeight:
                                            FontWeight
                                                .w500,
                                            color:
                                            Colors.black,
                                            fontSize: MediaQuery.of(
                                                context)
                                                .size
                                                .height /
                                                54),
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Text(
                                              '\u{20B9}150',
                                              style: TextStyle(
                                                  fontFamily:
                                                  "Montserrat",
                                                  fontWeight:
                                                  FontWeight
                                                      .bold,
                                                  color:
                                                  Colors.black,
                                                  fontSize:
                                                  MediaQuery.of(context).size.height /
                                                      54),
                                            ),
                                            margin: EdgeInsets.only(
                                                top: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                    162),
                                          ),
                                          Container (
                                            child: Text(
                                                '/ 1 Kg',
                                                style: TextStyle(
                                                    fontFamily:
                                                    "Montserrat",
                                                    fontWeight: FontWeight
                                                        .bold,
                                                    color:
                                                    Color(0xffA2A5B2),
                                                    fontSize:
                                                    MediaQuery.of(context).size.height / 54)),
                                            margin: EdgeInsets.only(
                                                top: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                    162),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: MediaQuery.of(
                                          context)
                                          .size
                                          .height /
                                          33.75,
                                      width: MediaQuery.of(
                                          context)
                                          .size
                                          .width /
                                          3.5,
                                      margin:
                                      EdgeInsets.only(
                                        top: MediaQuery.of(
                                            context)
                                            .size
                                            .height /
                                            101.25,
                                      ),
                                      child: Container(
                                          width:MediaQuery.of(context).size.width/4.36,
                                          child: item3?
                                          Container(
                                            margin: EdgeInsets.only(

                                            ),
                                            child: Row(
                                              children: [
                                                 GestureDetector(

                                                   onTap:(){
                                                     setState(() {
                                                       if(item3Count>=1){
                                                         item3Count--;
                                                       }
                                                       if(item3Count==0){
                                                         item3=false;
                                                       }
                                                     });

                                                   },
                                                   child: Container(
                                                    child: CircleAvatar(
                                                      backgroundColor: Color(0xffFAFAFC),
                                                      child: Center(child: Text('-'),),
                                                      radius: MediaQuery.of(context).size.width/75,
                                                    ),
                                                    height: MediaQuery.of(context).size.height/33.75,
                                                    width: MediaQuery.of(context).size.width/15.6,
                                                ),
                                                 ),
                                                Container(
                                                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.height/100),
                                                  child: Text("${item3Count}",style: TextStyle(fontSize: MediaQuery.of(context).size.height/45)),
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    setState(() {
                                                      item3Count++;
                                                    });
                                                  },
                                                  child: Container(

                                                    child: CircleAvatar(
                                                      backgroundColor: Color(0xffDE3F21),

                                                      child: Center(child: Text('+'),),
                                                      radius: MediaQuery.of(context).size.width/75,
                                                    ),
                                                    height: MediaQuery.of(context).size.height/33.6,
                                                    width: MediaQuery.of(context).size.width/15.6,
                                                    margin: EdgeInsets.only(left: MediaQuery.of(context).size.height/150),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ):Roundedbutton(
                                            onPressed: () {
                                              setState(() {
                                                item3=true;
                                                item3Count=1;

                                              });
                                              print("Allah is with you ");
                                            },
                                            color: Color(0xff2e885b),
                                            fontSize: MediaQuery.of(context).size.height/70,
                                            text:
                                            "Add to Cart",
                                          )






                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),

                        ),

                      )

                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height/4.1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffF5F7FC),
                        offset: Offset(0.0, 0.0),
                        blurRadius: 5.0,
                      )
                    ],
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(35),
                        topLeft: Radius.circular(35)),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/15.6,top: MediaQuery.of(context).size.height/32.4),
                    child: Column(


                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/3),
                              child: Text("Sub Total",style: TextStyle(color: Color(0xff71718D),fontFamily: "Montserrat",fontSize: MediaQuery.of(context).size.height/42.6,fontWeight: FontWeight.w500),),
                            ),
                            Container(
                              margin:EdgeInsets.only(right: MediaQuery.of(context).size.width/16.3),
                              child: Text('\u{20B9}${total}',style: TextStyle(color: Color(0xff71718D),fontFamily: "Montserrat",fontSize: MediaQuery.of(context).size.height/42.6,fontWeight: FontWeight.w500)),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/16.3),
                          child: Divider(
                            color: Color(0xffA2A5B2),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/1.9),
                              child: Text("Delivery",style: TextStyle(color: Color(0xff71718D),fontFamily: "Montserrat",fontSize: MediaQuery.of(context).size.height/42.6,fontWeight: FontWeight.w500),),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/16.3),
                              child: Text('Free',style: TextStyle(color: Color(0xff79CE09),fontFamily: "Montserrat",fontSize: MediaQuery.of(context).size.height/42.6,fontWeight: FontWeight.w500)),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/16.3),
                          child: Divider(
                            color: Color(0xffA2A5B2),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/1.9),
                              child: Text("Total",style: TextStyle(color: Color(0xff071718D),fontFamily: "Montserrat",fontSize: MediaQuery.of(context).size.height/42.6,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/16.3),
                              child: Text('\u{20B9}${total}',style: TextStyle(color: Colors.black,fontFamily: "Montserrat",fontSize: MediaQuery.of(context).size.height/42.6,fontWeight: FontWeight.bold)),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height/20.25,
                              width: MediaQuery.of(context).size.width/2.30,
                              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/50.6,right:5),
                              child: Roundedbutton(
                                onPressed: (){
                                  if(total>0){
                                    launchWhatsApp(number: "+919567177877",message:"${message}");
                                    getCurrentPosition();
                                  }
                                  else{
                                   Toast.show(
                                   "Choose a product", context,
                                   duration: Toast.LENGTH_LONG,
                                   gravity: Toast.CENTER);
                                  }
                                  },
                                text: "CheckOut",
                                image: Container(
                                  margin: EdgeInsets.only(top:5,bottom: 5),
                                    child: Image.asset('images/whatsapp.png')),
                                color: Color(0xff2e885b),
                              )
                            ),
                            Container(
                                height: MediaQuery.of(context).size.height/20.25,
                                width: MediaQuery.of(context).size.width/2.30,
                                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/50.6),
                                child: Roundedbutton(
                                  onPressed: (){
                                    if(total>0){
                                      launchSms(message: "${message}");

                                    }
                                    else{
                                      Toast.show(
                                          "Choose a product", context,
                                          duration: Toast.LENGTH_LONG,
                                          gravity: Toast.CENTER);
                                    }




                                  },
                                  text: "CheckOut",
                                  image: Image.asset('images/sms.png'),
                                  color: Color(0xff2e885b),
                                )
                            )
                          ],
                        ),

                      ],
                    ),
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
