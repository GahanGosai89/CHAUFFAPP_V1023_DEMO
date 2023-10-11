import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';
import '../../home_page.dart';
import '../utils/Strings.dart';
import '../utils/colors.dart';
import '../utils/text_style.dart';
import 'home_page.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    final me=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: me.width * .13),
        child: SingleChildScrollView(
          child: SizedBox(
            height: me.height,
            width: me.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Text(ways,style: Logo54,)),
                Align(
                    alignment: Alignment.center,
                    child: Text(chauffeur,style: Logo25,)),
                SizedBox(height: me.height * .12,),
                Text("Code",style: text18,),
                PinCodeFields(
                  length: 4,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  //controller: Otp,
                  keyboardType:  TextInputType.number,
                  padding: EdgeInsets.symmetric(horizontal: 5,vertical: 8),

                  activeBorderColor: textfeild_color,
                  borderColor: textfeild_color,
                  animation: Animations.shrink,
                  textStyle: black15,
                  fieldBackgroundColor: textfeild_color,
                  activeBackgroundColor: textfeild_color,

                  onComplete: (String value) {  },
                ),
                SizedBox(height: me.height * .22,),
                Container(
                  height: 45,
                  width: me.width,
                  decoration: BoxDecoration(
                      color: black,
                      borderRadius: BorderRadius.circular(4)
                  ),
                  child:TouchRippleEffect(
                    rippleColor: white,
                    onTap: ()
                    {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) =>  HomeScreen1()));
                    },
                    child: Center(
                      child: Text(continues,style: button_white,),
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
