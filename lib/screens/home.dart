

import 'package:flutter/material.dart';
import 'package:momsmaid/main.dart';

import 'package:momsmaid/widgets/rounded_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:momsmaid/widgets/constants.dart';
import 'package:toast/toast.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform;









class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  var total;
  var item1Price=45;
  var item2Price=85;
  var item3Price=150;
  String message;
  double latitude;
  double longitude;
  bool sendSms=false;

  Location location= new Location();
  bool serviceEnabled;
  PermissionStatus permissionGranted;
  LocationData locationData;

  serviceCheck()async{
    serviceEnabled=await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }}

    permissionCheck()async{
    permissionGranted=await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    }

    getLocation()async{

      locationData=await location.getLocation();
     setState(() {
       latitude=locationData.latitude;
       longitude=locationData.longitude;
     });

    }








  void launchWhatsApp({@required number,@required message})async{
    String url="https://api.whatsapp.com/send?phone=$number&text=${Uri.encodeComponent(message)}";
    await canLaunch(url)?launch(url):print("no");
//    String url="sms:0091-9567-177-877&body=${message}";
//    await canLaunch(url)?launch(url):print("no");
  }

  void launchSms({@required message})async{

      String url = 'sms:+91 9567 177 877?body=${Uri.encodeComponent(message)}';
      await canLaunch(url)?launch(url):print("no");



  }

  void launchSmsIos({@required message})async{
    String url="sms:0091-9567-177-877&body=${Uri.encodeComponent(message)}";
    await canLaunch(url)?launch(url):print("no");
  }










  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    serviceCheck();
    permissionCheck();
    getLocation();



  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (context,data,child){
        return child;
      },
      child: Builder(
        builder: (BuildContext context){
          total=Provider.of<Data>(context).item1Count*item1Price+Provider.of<Data>(context).item2Count*item2Price+Provider.of<Data>(context).item3Count*item3Price;

          return Scaffold(
            body: SafeArea(
              child: Container(
                color: Color(0xffFCFEFF),
//          0xff94c35e
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 31,
                  left: MediaQuery.of(context).size.width / 17.8),
              child:Text("Our Products",style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w300,fontSize: MediaQuery.of(context).size.height /
                  40),),
            ),
                    Expanded(
                      child:   SingleChildScrollView(
                        child:Container(
                          child: Column(
                            children: [

                              GestureDetector(
                                onTap: (){
                                  Navigator.pushReplacementNamed(context, 'image1');
                                },
                                child: Container(
                                  height:MediaQuery.of(context).size.height/3,
                                  width: double.infinity,
                                  margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width / 23,
                                      right: MediaQuery.of(context).size.width / 23,
                                      top: MediaQuery.of(context).size.height / 57.9),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xffF5F7FC),
                                        offset: Offset(0.0, 0.0),
                                        blurRadius: 5.0,
                                      )
                                    ],
                                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15), topRight: Radius.circular(15), topLeft: Radius.circular(15)),
                                  ),
                                  child: Row(
                                    children: [
//
                                      Container(
                                        width:MediaQuery.of(context).size.width/3,
                                        margin: EdgeInsets.only(top:20),
                                        child: Image.asset('images/injiPaste250.jpeg'),
                                      ),
                                      Container(

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
                                              height: MediaQuery.of(context).size.height / 25,
                                              width: MediaQuery.of(context).size.width / 3.5,
                                              margin: EdgeInsets.only(
                                                top: MediaQuery.of(context).size.height / 50,),
                                              child: Container(
                                                  width:MediaQuery.of(context).size.width/4.36,
                                                  child: Provider.of<Data>(context).item1?
                                                  Container(
                                                    margin: EdgeInsets.only(),
                                                    child: Row(
                                                      children: [
                                                        GestureDetector(

                                                          onTap:(){
                                                            setState(() {
                                                              if(Provider.of<Data>(context,listen: false).item1Count>=1){
                                                                Provider.of<Data>(context,listen: false).item1Count--;
                                                              }
                                                              if(Provider.of<Data>(context,listen: false).item1Count==0){
                                                                Provider.of<Data>(context,listen: false).item1=false;
                                                              }
                                                            });

                                                          },
                                                          child: Container(
                                                            child: CircleAvatar(
                                                              backgroundColor: Color(0xffFAFAFC),
                                                              child: Center(child: Text('-'),),
                                                              radius: MediaQuery.of(context).size.width/30,
                                                            ),
//                                                    height: MediaQuery.of(context).size.height/33.75,
//                                                    width: MediaQuery.of(context).size.width/15.6,
                                                          ),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(left: MediaQuery.of(context).size.height/100),
                                                          child: Text("${Provider.of<Data>(context,listen: false).item1Count}",style: TextStyle(fontSize: MediaQuery.of(context).size.height/45)),
                                                        ),
                                                        GestureDetector(
                                                          onTap: (){
                                                            setState(() {
                                                              Provider.of<Data>(context,listen: false).item1Count++;
                                                            });
                                                          },
                                                          child: Container(

                                                            child: CircleAvatar(
                                                              backgroundColor: Color(0xffDE3F21),

                                                              child: Center(child: Text('+'),),
                                                              radius: MediaQuery.of(context).size.width/30,
                                                            ),
//                                                    height: MediaQuery.of(context).size.height/33.6,
//                                                    width: MediaQuery.of(context).size.width/15.6,
                                                            margin: EdgeInsets.only(left: MediaQuery.of(context).size.height/150),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                      :Roundedbutton(
                                                    onPressed: () {
                                                      setState(() {
                                                        Provider.of<Data>(context,listen: false).item1=true;
                                                        Provider.of<Data>(context,listen: false).item1Count=1;

                                                      });
                                                      print("Allah is with you ");
                                                    },
                                                    color: Color(0xff2e885b),
                                                    fontSize: MediaQuery.of(context).size.height/60,
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
                              GestureDetector(
                                onTap: (){
                                  Navigator.pushReplacementNamed(context, 'image2');
                                },
                                child: Container(
                                  height:MediaQuery.of(context).size.height/3,
                                  width: double.infinity,
                                  margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width / 23,
                                      right: MediaQuery.of(context).size.width / 23,
                                      top: MediaQuery.of(context).size.height / 57.9),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xffF5F7FC),
                                        offset: Offset(0.0, 0.0),
                                        blurRadius: 5.0,
                                      )
                                    ],
                                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15), topRight: Radius.circular(15), topLeft: Radius.circular(15)),
                                  ),
                                  child: Row(
                                    children: [
//
                                      Container(
                                        width:MediaQuery.of(context).size.width/3,
                                        margin: EdgeInsets.only(top:20),
                                        child: Image.asset('images/injiPaste500.jpeg'),

                                      ),
                                      Container(

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
                                                  25,
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
                                                    50,
                                              ),
                                              child: Container(
                                                  width:MediaQuery.of(context).size.width/4.36,
                                                  child: Provider.of<Data>(context).item2?
                                                  Container(
                                                    margin: EdgeInsets.only(),
                                                    child: Row(
                                                      children: [
                                                        GestureDetector(

                                                          onTap:(){
                                                            setState(() {
                                                              if(Provider.of<Data>(context,listen: false).item2Count>=1){
                                                                Provider.of<Data>(context,listen: false).item2Count--;
                                                              }
                                                              if(Provider.of<Data>(context,listen: false).item2Count==0){
                                                                Provider.of<Data>(context,listen: false).item2=false;
                                                              }
                                                            });

                                                          },
                                                          child: Container(
                                                            child: CircleAvatar(
                                                              backgroundColor: Color(0xffFAFAFC),
                                                              child: Center(child: Text('-'),),
                                                              radius: MediaQuery.of(context).size.width/30,
                                                            ),
//                                                    height: MediaQuery.of(context).size.height/33.75,
//                                                    width: MediaQuery.of(context).size.width/15.6,
                                                          ),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(left: MediaQuery.of(context).size.height/100),
                                                          child: Text("${Provider.of<Data>(context).item2Count}",style: TextStyle(fontSize: MediaQuery.of(context).size.height/45)),
                                                        ),
                                                        GestureDetector(
                                                          onTap: (){
                                                            setState(() {
                                                              Provider.of<Data>(context,listen: false).item2Count++;
                                                            });
                                                          },
                                                          child: Container(

                                                            child: CircleAvatar(
                                                              backgroundColor: Color(0xffDE3F21),

                                                              child: Center(child: Text('+'),),
                                                              radius: MediaQuery.of(context).size.width/30,
                                                            ),
//                                                    height: MediaQuery.of(context).size.height/33.6,
//                                                    width: MediaQuery.of(context).size.width/15.6,
                                                            margin: EdgeInsets.only(left: MediaQuery.of(context).size.height/150),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                      :Roundedbutton(
                                                    onPressed: () {
                                                      setState(() {
                                                        Provider.of<Data>(context,listen: false).item2=true;
                                                        Provider.of<Data>(context,listen: false).item2Count=1;

                                                      });
                                                      print("Allah is with you ");
                                                    },
                                                    color: Color(0xff2e885b),
                                                    fontSize: MediaQuery.of(context).size.height/60,
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
                              GestureDetector(
                                onTap: (){
                                  Navigator.pushReplacementNamed(context, 'image3');
                                },
                                child: Container(
                                  height:MediaQuery.of(context).size.height/3,
                                  width: double.infinity,
                                  margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width / 23,
                                      right: MediaQuery.of(context).size.width / 23,
                                      top: MediaQuery.of(context).size.height / 57.9),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xffF5F7FC),
                                        offset: Offset(0.0, 0.0),
                                        blurRadius: 5.0,
                                      )
                                    ],
                                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15), topRight: Radius.circular(15), topLeft: Radius.circular(15)),
                                  ),
                                  child: Row(
                                    children: [
//
                                      Container(
                                        width:MediaQuery.of(context).size.width/3,
                                        margin: EdgeInsets.only(top:20),
                                        child: Image.asset('images/injiPaste1Kg.jpeg'),


                                      ),
                                      Container(

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
                                              child: new Text("Ginger Garlic Paste 1 Kg",
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
                                                  25,
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
                                                    50,
                                              ),
                                              child: Container(
                                                  width:MediaQuery.of(context).size.width/4.36,
                                                  child: Provider.of<Data>(context).item3?
                                                  Container(
                                                    margin: EdgeInsets.only(),
                                                    child: Row(
                                                      children: [
                                                        GestureDetector(

                                                          onTap:(){
                                                            setState(() {
                                                              if(Provider.of<Data>(context,listen: false).item3Count>=1){
                                                                Provider.of<Data>(context,listen: false).item3Count--;
                                                              }
                                                              if(Provider.of<Data>(context,listen: false).item3Count==0){
                                                                Provider.of<Data>(context,listen: false).item3=false;
                                                              }
                                                            });

                                                          },
                                                          child: Container(
                                                            child: CircleAvatar(
                                                              backgroundColor: Color(0xffFAFAFC),
                                                              child: Center(child: Text('-'),),
                                                              radius: MediaQuery.of(context).size.width/30,
                                                            ),
//                                                    height: MediaQuery.of(context).size.height/33.75,
//                                                    width: MediaQuery.of(context).size.width/15.6,
                                                          ),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(left: MediaQuery.of(context).size.height/100),
                                                          child: Text("${Provider.of<Data>(context).item3Count}",style: TextStyle(fontSize: MediaQuery.of(context).size.height/45)),
                                                        ),
                                                        GestureDetector(
                                                          onTap: (){
                                                            setState(() {
                                                              Provider.of<Data>(context,listen: false).item3Count++;
                                                            });
                                                          },
                                                          child: Container(

                                                            child: CircleAvatar(
                                                              backgroundColor: Color(0xffDE3F21),

                                                              child: Center(child: Text('+'),),
                                                              radius: MediaQuery.of(context).size.width/30,
                                                            ),
//                                                    height: MediaQuery.of(context).size.height/33.6,
//                                                    width: MediaQuery.of(context).size.width/15.6,
                                                            margin: EdgeInsets.only(left: MediaQuery.of(context).size.height/150),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                      :Roundedbutton(
                                                    onPressed: () {
                                                      setState(() {
                                                        Provider.of<Data>(context,listen: false).item3=true;
                                                        Provider.of<Data>(context,listen: false).item3Count=1;

                                                      });
                                                      print("Allah is with you ");
                                                    },
                                                    color: Color(0xff2e885b),
                                                    fontSize: MediaQuery.of(context).size.height/60,
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

                            ],
                          ),
                        ),
                      ),
                    ),



                    Container(
                      height: MediaQuery.of(context).size.height/3.5,
                      margin: EdgeInsets.only(top:20),

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
                                  margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/3),
                                  child: Text("Total",style: TextStyle(color: Color(0xff071718D),fontFamily: "Montserrat",fontSize: MediaQuery.of(context).size.height/42.6,fontWeight: FontWeight.w500),),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/16.3),
                                  child: Text('\u{20B9}${total}',style: TextStyle(color: Colors.black,fontFamily: "Montserrat",fontSize: MediaQuery.of(context).size.height/42.6,fontWeight: FontWeight.w500)),
                                )
                              ],
                            ),
                            sendSms?Row(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height/20.25,
                                  width: MediaQuery.of(context).size.width/2.30,
                                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/50.6,right:5),

                                  child: Roundedbutton(
                                    onPressed: (){
                                      launchSms(message: message);
                                      setState(() {
                                        sendSms=false;
                                      });
                                    },
                                    text: "My Device",
                                    image: Container(
                                        margin: EdgeInsets.only(top:5,bottom: 5),
                                        child: Image.asset('images/android.png')),
                                    color: Color(0xff2e885b),
                                  ),

                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height/20.25,
                                  width: MediaQuery.of(context).size.width/2.30,
                                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/50.6),

                                  child: Roundedbutton(
                                    onPressed: (){
                                      launchSmsIos(message: message);
                                      setState(() {
                                        sendSms=false;
                                      });
                                    },
                                    text: "My Device",
                                    image: Container(
                                        margin: EdgeInsets.only(top:5,bottom: 5),
                                        child: Image.asset('images/ios.png')),
                                    color:buttonRed,
                                  ),

                                ),

                              ],
                            ):Row(
                              children: [
                                Container(
                                    height: MediaQuery.of(context).size.height/20.25,
                                    width: MediaQuery.of(context).size.width/2.30,
                                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/50.6,right:5),
                                    child: Roundedbutton(
                                      onPressed: (){
                                        if(Provider.of<Data>(context,listen: false).item1Count>0&&Provider.of<Data>(context,listen: false).item2Count>0&&Provider.of<Data>(context,listen: false).item3Count>0){

                                          message="***** ORDER DETAILS ***** \n Ginger Garlic Paste 250 Gm:${Provider.of<Data>(context,listen: false).item1Count}      \n Ginger Garlic Paste 500 Gm:${Provider.of<Data>(context,listen: false).item2Count}      \n Ginger Garlic Paste 1.00 Kg:${Provider.of<Data>(context,listen: false).item3Count} \n Total=${total} \n Location:https://www.google.com/maps?q=$latitude,$longitude  \n***** CONFIRM VIA TEXT OR CALL *****";

                                        }
                                        else if(Provider.of<Data>(context,listen: false).item1Count<1&&Provider.of<Data>(context,listen: false).item2Count>0&&Provider.of<Data>(context,listen: false).item3Count>0){
                                          setState(() {
                                            message="***** ORDER DETAILS ***** \n Ginger Garlic Paste 500 Gm:${Provider.of<Data>(context,listen: false).item2Count} \n Ginger Garlic Paste1.00 Kg:${Provider.of<Data>(context,listen: false).item3Count} \n Total=${total} \n Location:https://www.google.com/maps?q=$latitude,$longitude  \n ***** CONFIRM VIA TEXT OR CALL *****";
                                          });
                                        }
                                        else if(Provider.of<Data>(context,listen: false).item1Count>0&&Provider.of<Data>(context,listen: false).item2Count<1&&Provider.of<Data>(context,listen: false).item3Count>0){
                                          setState(() {
                                            message="***** ORDER DETAILS ***** \n Ginger Garlic Paste 250Gm:${Provider.of<Data>(context,listen: false).item1Count}  \n Ginger Garlic Paste 1.00 Kg :${Provider.of<Data>(context,listen: false).item3Count} \n Total=${total} \n Location:https://www.google.com/maps?q=$latitude,$longitude  \n ***** CONFIRM VIA TEXT OR CALL *****";
                                          });

                                        }
                                        else if(Provider.of<Data>(context,listen: false).item1Count>0&&Provider.of<Data>(context,listen: false).item2Count>0&&Provider.of<Data>(context,listen: false).item3Count<1){
                                          setState(() {
                                            message="***** ORDER DETAILS ***** \n Ginger Garlic Paste 250 Gm:${Provider.of<Data>(context,listen: false).item1Count} \n Ginger Garlic Paste 500 Gm:${Provider.of<Data>(context,listen: false).item2Count} \n Total=${total} \n Location:https://www.google.com/maps?q=$latitude,$longitude  \n ***** CONFIRM VIA TEXT OR CALL ***** ";
                                          });
                                        }
                                        else if(Provider.of<Data>(context,listen: false).item1Count>0&&Provider.of<Data>(context,listen: false).item2Count<1&&Provider.of<Data>(context,listen: false).item3Count<1){
                                          setState(() {
                                            message="***** ORDER DETAILS ***** \n Ginger Garlic Paste 250 Gm: ${Provider.of<Data>(context,listen: false).item1Count} \n Total=${total} \n Location:https://www.google.com/maps?q=$latitude,$longitude  \n ***** CONFIRM VIA TEXT OR CALL *****";
                                          });
                                        }
                                        else if(Provider.of<Data>(context,listen: false).item1Count<1&&Provider.of<Data>(context,listen: false).item2Count>0&&Provider.of<Data>(context,listen: false).item3Count<1){
                                          setState(() {
                                            message="***** ORDER DETAILS ***** \n Ginger Garlic Paste 500 Gm:${Provider.of<Data>(context,listen: false).item2Count} \n Total=${total} \n Location:https://www.google.com/maps?q=$latitude,$longitude  \n ***** CONFIRM VIA TEXT OR CALL *****";
                                          });
                                        }
                                        else if(Provider.of<Data>(context,listen: false).item1Count<1&&Provider.of<Data>(context,listen: false).item2Count<1&&Provider.of<Data>(context,listen: false).item3Count>0){
                                          setState(() {
                                            message="***** ORDER DETAILS ***** \n Ginger Garlic Paste 1.00 Kg :${Provider.of<Data>(context,listen: false).item3Count} \n Total=${total} \n Location:https://www.google.com/maps?q=$latitude,$longitude  \n ***** CONFIRM VIA TEXT OR CALL *****";
                                          });
                                        }
                                        else if(Provider.of<Data>(context,listen: false).item1Count<1&&Provider.of<Data>(context,listen: false).item2Count<1&&Provider.of<Data>(context,listen: false).item3Count<1){
                                          setState(() {
                                            message="null";
                                          });
                                        }
                                        if(total>0&&message!=null){
                                          launchWhatsApp(number: "+919567177877",message:"${message}");

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
                                        if(Provider.of<Data>(context,listen: false).item1Count>0&&Provider.of<Data>(context,listen: false).item2Count>0&&Provider.of<Data>(context,listen: false).item3Count>0){

                                          message="***** ORDER DETAILS ***** \n Ginger Garlic Paste 250 Gm:${Provider.of<Data>(context,listen: false).item1Count}      \n Ginger Garlic Paste 500 Gm:${Provider.of<Data>(context,listen: false).item2Count}      \n Ginger Garlic Paste 1.00 Kg:${Provider.of<Data>(context,listen: false).item3Count} \n Total=${total} \n Location:https://www.google.com/maps?q=$latitude,$longitude  \n***** CONFIRM VIA TEXT OR CALL *****";

                                        }
                                        else if(Provider.of<Data>(context,listen: false).item1Count<1&&Provider.of<Data>(context,listen: false).item2Count>0&&Provider.of<Data>(context,listen: false).item3Count>0){
                                          setState(() {
                                            message="***** ORDER DETAILS ***** \n Ginger Garlic Paste 500 Gm:${Provider.of<Data>(context,listen: false).item2Count} \n Ginger Garlic Paste1.00 Kg:${Provider.of<Data>(context,listen: false).item3Count} \n Total=${total} \n Location:https://www.google.com/maps?q=$latitude,$longitude  \n ***** CONFIRM VIA TEXT OR CALL *****";
                                          });
                                        }
                                        else if(Provider.of<Data>(context,listen: false).item1Count>0&&Provider.of<Data>(context,listen: false).item2Count<1&&Provider.of<Data>(context,listen: false).item3Count>0){
                                          setState(() {
                                            message="***** ORDER DETAILS ***** \n Ginger Garlic Paste 250Gm:${Provider.of<Data>(context,listen: false).item1Count}  \n Ginger Garlic Paste 1.00 Kg :${Provider.of<Data>(context,listen: false).item3Count} \n Total=${total} \n Location:https://www.google.com/maps?q=$latitude,$longitude  \n ***** CONFIRM VIA TEXT OR CALL *****";
                                          });

                                        }
                                        else if(Provider.of<Data>(context,listen: false).item1Count>0&&Provider.of<Data>(context,listen: false).item2Count>0&&Provider.of<Data>(context,listen: false).item3Count<1){
                                          setState(() {
                                            message="***** ORDER DETAILS ***** \n Ginger Garlic Paste 250 Gm:${Provider.of<Data>(context,listen: false).item1Count} \n Ginger Garlic Paste 500 Gm:${Provider.of<Data>(context,listen: false).item2Count} \n Total=${total} \n Location:https://www.google.com/maps?q=$latitude,$longitude  \n ***** CONFIRM VIA TEXT OR CALL ***** ";
                                          });
                                        }
                                        else if(Provider.of<Data>(context,listen: false).item1Count>0&&Provider.of<Data>(context,listen: false).item2Count<1&&Provider.of<Data>(context,listen: false).item3Count<1){
                                          setState(() {
                                            message="***** ORDER DETAILS ***** \n Ginger Garlic Paste 250 Gm: ${Provider.of<Data>(context,listen: false).item1Count} \n Total=${total} \n Location:https://www.google.com/maps?q=$latitude,$longitude  \n ***** CONFIRM VIA TEXT OR CALL *****";
                                          });
                                        }
                                        else if(Provider.of<Data>(context,listen: false).item1Count<1&&Provider.of<Data>(context,listen: false).item2Count>0&&Provider.of<Data>(context,listen: false).item3Count<1){
                                          setState(() {
                                            message="***** ORDER DETAILS ***** \n Ginger Garlic Paste 500 Gm:${Provider.of<Data>(context,listen: false).item2Count} \n Total=${total} \n Location:https://www.google.com/maps?q=$latitude,$longitude  \n ***** CONFIRM VIA TEXT OR CALL *****";
                                          });
                                        }
                                        else if(Provider.of<Data>(context,listen: false).item1Count<1&&Provider.of<Data>(context,listen: false).item2Count<1&&Provider.of<Data>(context,listen: false).item3Count>0){
                                          setState(() {
                                            message="***** ORDER DETAILS ***** \n Ginger Garlic Paste 1.00 Kg :${Provider.of<Data>(context,listen: false).item3Count} \n Total=${total} \n Location:https://www.google.com/maps?q=$latitude,$longitude  \n ***** CONFIRM VIA TEXT OR CALL *****";
                                          });
                                        }
                                        else if(Provider.of<Data>(context,listen: false).item1Count<1&&Provider.of<Data>(context,listen: false).item2Count<1&&Provider.of<Data>(context,listen: false).item3Count<1){
                                          setState(() {
                                            message="null";
                                          });
                                        }
                                        if(total>0){
                                          setState(() {
                                            sendSms=true;
                                          });

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
                                          child: Image.asset('images/sms.png')),
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
          );
        },

      ),
    );

  }
}





