

import 'package:flutter/material.dart';
import 'package:momsmaid/main.dart';
import 'package:momsmaid/screens/home.dart';
import 'package:momsmaid/widgets/constants.dart';
import 'package:momsmaid/widgets/rounded_button.dart';
import 'package:momsmaid/widgets/rounded_button_checkout.dart';
import 'package:provider/provider.dart';
class Image2 extends StatefulWidget {

  @override
  _Image2State createState() => _Image2State();
}

class _Image2State extends State<Image2> {
  PageController _pageController=PageController();

  int page=0;

  @override
  Widget build(BuildContext context) {

    return Consumer<Data>(
      builder: (context,data,child){
        return child;
      },
      child: Scaffold(

        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 10,left: 20,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacementNamed(context, 'home');
                  },
                  child: Container(

                    alignment: Alignment.centerLeft,


                    color: Color(0xffFCFEFF),
                    child: Icon(Icons.chevron_left,color: Colors.black,size: 30,),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text("Ginger Garlic Paste 500 Gms", style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.w500, color: Colors.black, fontSize: MediaQuery.of(context).size.height / 32),),
                ),
                Container(
                  child: Stack(
                    children: [

                      Container(
                        height: MediaQuery.of(context).size.height/2,
                        margin: EdgeInsets.only(top:20),

                        child: PageView(
                          controller: _pageController,
                          onPageChanged: (index){
                            setState(() {
                              page=index;
                            });
                            print(page);
                          },
                          children: [
                            Container(
                              child: Image.asset('images/injiPaste500gmsSmallFront.jpeg'),

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


                            ),
                            Container(
                              child: Image.asset('images/injiPaste500GmsSmallBack.jpeg'),

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

                            )
                          ],
                        ),
                      ),
                      Container(
                        height:MediaQuery.of(context).size.height/4,
                        width:MediaQuery.of(context).size.width/4,
                        alignment: Alignment.topLeft,
                        child: Image.asset('images/price85.png'),
                      ),

                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: page==0?Colors.grey:lightGrey
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: page==1?Colors.grey:lightGrey
                        ),
                      )
                    ],
                  ),
                ),Container(
                  margin: EdgeInsets.only(top:20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text('\u{20B9}85',
                          style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.bold,color: Colors.black,fontSize: MediaQuery.of(context).size.height / 32),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Container(
                        child: Text("(500 Gms)",style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.bold,color: Colors.black,fontSize: MediaQuery.of(context).size.height / 54),),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:10),
                  child: Row(
                    children: [
                      Text("You save ",style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.bold,color: Colors.black,fontSize: MediaQuery.of(context).size.height / 54),),
                      SizedBox(
                        width: 5,
                      ),
                      Text("\u{20B9}33",style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.bold,color: buttonRed,fontSize: MediaQuery.of(context).size.height / 54),)
                    ],
                  ),
                ),
                Provider.of<Data>(context).item2?Container(
                  height: MediaQuery.of(context).size.height / 20,
                  width:double.infinity,
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 10,),
                  child: RoundedButtonCheckout(
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, 'home');

                    },
                    color: buttonRed,
                    fontSize: MediaQuery.of(context).size.height/54,
                    text:
                    "Added to Cart",
                  ),
                ):Container(

                  height: MediaQuery.of(context).size.height / 20,
                  width:double.infinity,
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 10,),
                  child: RoundedButtonCheckout(
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, 'home');
                      setState(() {
                        Provider.of<Data>(context,listen: false).item2=true;
                        Provider.of<Data>(context,listen: false).item2Count=1;
                      });


                    },
                    color: Color(0xff2e885b),
                    fontSize: MediaQuery.of(context).size.height/54,
                    text:
                    "Add to Cart",
                  ),
                )
              ],

            ),
          ),
        ),
      ),
    );
  }
}