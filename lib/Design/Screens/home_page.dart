import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';
import 'package:ways_chauffeur/Design/Screens/Map_Screen.dart';
import 'package:ways_chauffeur/Design/utils/text_style.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../utils/colors.dart';
import '../utils/ing_strings.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  bool _switchValue = true;
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final me = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: [
          MapScreen(),
          Column(
            children: [
              SizedBox(
                height: me.height * .07,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: me.height * .07,
                      width: me.height * .07,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 1,
                                blurRadius: 10)
                          ]),
                      child: Center(
                        child: Icon(
                          Icons.dehaze_rounded,
                          color: blue,
                          size: me.height * .04,
                        ),
                      ),
                    ),
                    Container(
                      height: me.height * .07,
                      width: me.height * .07,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 1,
                                blurRadius: 10)
                          ]),
                      child: InkWell(
                        onTap: () {
                         _showDialog1();
                        },
                        child: Center(
                          child: Text(
                            "Offers\n10",
                            textAlign: TextAlign.center,
                            style: blue11,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: me.height * .07,
                      width: me.height * .07,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 1,
                                blurRadius: 10)
                          ]),
                      child: Center(
                        child: Text(
                          "Jobs",
                          textAlign: TextAlign.center,
                          style: blue13,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),

        ],
      ),
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  void settoogle(bool data) {
    _switchValue = data;
    setState(() {});
  }
  _showDialog() async {
    await Future.delayed(const Duration(milliseconds: 50));
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .28,

                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4)),
                    child: Scaffold(
                      body: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            Text(
                              "Offline /Online",
                              style: black15,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .03,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Business class",
                                  style: black12,
                                ),
                                Text(
                                  "Mercedes Benz  E-Class",
                                  style: black12,
                                )
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(),
                                Text(
                                  "YES 22 UK ",
                                  style: black24,
                                )
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .03,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 54,
                                  width: MediaQuery.of(context).size.width * .4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Color(0xffE5E5E5),
                                  ),
                                  child: TouchRippleEffect(
                                    rippleColor: blue.withOpacity(.5),
                                    onTap: () {
                                      settoogle(false);
                                      Navigator.pop(context);
                                    },
                                    child: Center(
                                      child: Text(
                                        "STAY OFFLINE",
                                        style: blue11,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 54,
                                  width: MediaQuery.of(context).size.width * .4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: blue,
                                  ),
                                  child: TouchRippleEffect(
                                    rippleColor: Colors.white.withOpacity(.5),
                                    onTap: () {
                                      settoogle(true);
                                      Navigator.pop(context);
                                    },
                                    child: Center(
                                      child: Text(
                                        "GO ONLINE ",
                                        style: white12,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    // Other child widgets here
                  ),
                ].animate(interval: 200.ms).fade(duration: 600.ms),
              );
            },
          );
        });
  }
  void bottomsheet()
  {
    showModalBottomSheet(
        backgroundColor: Colors.transparent
        ,context: context, builder: (BuildContext conext)
    {
      return StatefulBuilder(

          builder: (BuildContext context, StateSetter setState)
      {
        final me=MediaQuery.of(context).size;
        return Container(
          height: me.height * .46,
          width: me.width,
          margin: EdgeInsets.only(left: 10,right: 10),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5)
            )
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("drive to ",style: black12,),
                    Row(

                      children: [
                        Icon(Icons.location_on_rounded,color: Colors.black,),
                        Text("WII",style: black15,),

                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: me.height * .01),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Color(0xffE5E5E5).withOpacity(.24),
                        child: Center(
                       child:  Image.asset(menuIcon,height: 20,width: 20,),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("pickup",style: black12,),
                    Text("12:34",style: black20,),
                    Container()
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 1,
                width: me.width,
                color: Colors.black.withOpacity(.2),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(messageIcon,height: me.height * .04,width: me.height * .04,),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: white,
                          backgroundImage: AssetImage(personIcon),
                        ),
                        SizedBox(
                          height:
                          MediaQuery.of(context).size.height *
                              .04,
                        ),
                        Text("James Arthur ",
                            style: TextStyle(
                                color: Color(0xffB2B4B8),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins'))
                      ],
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xffE5E5E5).withOpacity(.24),
                      child: Center(
                        child: Icon(Icons.arrow_forward_ios_rounded,size: 20,color: Color(0xffB2B4B8),),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 1,
                width: me.width,
                color: Colors.black.withOpacity(.2),
              ),
              Container(
                height: 54,
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: blue,
                ),
                child: TouchRippleEffect(
                  rippleColor: Colors.white.withOpacity(.5),
                  onTap: () {
                    settoogle(true);
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Text(
                      "ARRIVED",
                      style: white12,
                    ),
                  ),
                ),
              ),


            ],
          ),
        );
      });
    });
  }
  _showDialog1() async {
    await Future.delayed(const Duration(milliseconds: 50));
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .3,
                  ),
                  TouchRippleEffect(
                    onTap: ()
                    {
                      Navigator.pop(context);
                      bottomsheet();
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * .35,

                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4)),
                      child: Scaffold(
                        body: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * .35,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Business",
                                    style: blue15,
                                  ),
                                  Text(
                                    "SCH",
                                    style: blue15,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.square,
                                        color: blue,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Image.asset(
                                        arrowbottom,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .17,
                                      ),
                                      Text(
                                        "12 min",
                                        style: TextStyle(
                                            color: Color(0xff91919D),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Poppins'),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      LinearPercentIndicator(
                                        width: MediaQuery.of(context).size.width *
                                            .7,
                                        isRTL: true,
                                        animation: true,
                                        animationDuration: 10000,
                                        lineHeight: 40.0,
                                        percent: 1,
                                        linearStrokeCap: LinearStrokeCap.butt,
                                        center: Text(
                                          "£256.00",
                                          style: white18,
                                        ),
                                        onAnimationEnd: () {
                                          Navigator.pop(context);
                                        },
                                        progressColor: Color(0xffE5E5E5),
                                        backgroundColor: black,
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .02,
                                      ),
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundColor: white,
                                        backgroundImage: AssetImage(personIcon),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .01,
                                      ),
                                      Text("James Arthur ",
                                          style: TextStyle(
                                              color: Color(0xffB2B4B8),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Poppins'))
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.location_pin,
                                        color: blue,
                                        size: 20,
                                      ),
                                      Text(
                                        "WC1A",
                                        style: blue15,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 5),
                                        child: Image.asset(
                                          arrowright,
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  .5,
                                        ),
                                      ),
                                      Text(
                                        " 17 mls ",
                                        style: TextStyle(
                                            color: Color(0xff91919D),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Poppins'),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Image.asset(
                                        falgicon,
                                        height: 20,
                                        width: 20,
                                      ),
                                      Text(
                                        "TWC",
                                        style: blue15,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      // Other child widgets here
                    ),
                  ),
                ].animate(interval: 200.ms).fade(duration: 800.ms),
              );
            },
          );
        });
  }
  Widget buildMyNavBar(BuildContext context) {
    final me = MediaQuery.of(context).size;
    return Container(
      height: me.height * .1,
      padding: EdgeInsets.only(top: 1),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(20)),
      child: Container(
        height: me.height * .1,
        padding: EdgeInsets.zero,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                InkWell(
                    // padding: EdgeInsets.zero,
                    enableFeedback: false,
                    onTap: () {
                      setState(() {
                        pageIndex = 0;
                      });
                    },
                    child: pageIndex == 0
                        ? Icon(
                            Icons.circle,
                            color: blue,
                          )
                        : Icon(
                            Icons.circle,
                            color: rediogrey,
                          )),
                Text(
                  "MAP",
                  style: pageIndex == 0 ? grey115 : grey15,
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                InkWell(
                    // padding: EdgeInsets.zero,
                    enableFeedback: false,
                    onTap: () {
                      setState(() {
                        pageIndex = 1;
                      });
                    },
                    child: pageIndex == 1
                        ? Icon(
                            Icons.circle,
                            color: blue,
                          )
                        : Icon(
                            Icons.circle,
                            color: rediogrey,
                          )),
                Text(
                  "HELP",
                  style: pageIndex == 1 ? grey115 : grey15,
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  _switchValue ? "ONLINE " : "OFFLINE",
                  style: _switchValue ? grey112 : grey12,
                ),
                Container(
                  padding: EdgeInsets.all(4),
                  child: CupertinoSwitch(
                    value: _switchValue,
                    activeColor: Color(0xff012169),
                    trackColor: Color(0xffC8102E),
                    onChanged: (value) async {
                      _showDialog();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
