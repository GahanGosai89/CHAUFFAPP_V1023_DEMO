import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';
import 'package:ways_chauffeur/Design/Screens/login_page.dart';
import 'package:ways_chauffeur/Design/utils/Strings.dart';
import 'package:ways_chauffeur/Design/utils/colors.dart';
import '../utils/ing_strings.dart';
import '../utils/text_style.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool animationCompleted = false;
  double carPosition = -200;

  @override
  void initState() {
    animateCar();
    super.initState();
  }

  void animateCar() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      carPosition = MediaQuery.of(context).size.width * .25;
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      animationCompleted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final me = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: me.height * .03),
                child: Image.asset(
                  FooterImg,
                  height: me.height * .15,
                  width: me.width,
                  fit: BoxFit.fill,
                ),
              )),
          AnimatedPositioned(
            duration: Duration(seconds: 4), // Duration of the car entering
            left: animationCompleted
                ? MediaQuery.of(context).size.width * .25
                : carPosition,
            bottom: me.height * .03, // Animate the position
            child: Image.asset(
              CarImg,
              height: me.height * .05,
              width: me.width * .4,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: me.width,
            padding: EdgeInsets.symmetric(horizontal: me.width * .13),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
             Column(
               children: [
                 Align(
                     alignment: Alignment.center,
                     child: Text(ways,style: Logo54,)),
                 Align(
                     alignment: Alignment.center,
                     child: Text(chauffeur,style: Logo25,)),
                 SizedBox(height: me.height * .15,),
                 Text(welcome_line,style: black15,),
               ].animate(delay: Duration(seconds: 3),interval: 200.ms).fade(duration: 200.ms),
             ),
                SizedBox(height: me.height * .15,),
                Column(
                  children: [
                    Container(
                      height: 45,
                      width: me.width,
                      decoration: BoxDecoration(
                          color: black,
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child: TouchRippleEffect(
                        rippleColor: white.withOpacity(.5),
                        onTap: ()
                        {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => LoginPage()));
                        },
                        child: Center(
                          child: Text(signIn,style: button_white,),
                        ),
                      ),
                    ),
                    SizedBox(height: me.height * .025,),
                    Container(
                      height: 45,
                      width: me.width,
                      decoration: BoxDecoration(
                          color: grey,
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child:TouchRippleEffect(
                        rippleColor: black.withOpacity(.5),

                        child: Center(
                          child: Text(register,style: button_black,),
                        ),
                      ),
                    ),
                  ].animate(delay: Duration(seconds: 6,),interval: 200.ms).fade(duration: 200.ms),
                )
                
              ],
            ),
          )
        ],
      ),
    );
  }
}
