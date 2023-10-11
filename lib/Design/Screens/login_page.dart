import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';
import 'package:ways_chauffeur/Design/Screens/otp_page.dart';

import '../utils/Strings.dart';
import '../utils/colors.dart';
import '../utils/text_style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _emailLoginText = TextEditingController();
  bool privacy=false;
  @override
  Widget build(BuildContext context) {
    final me = MediaQuery.of(context).size;

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
                SizedBox(height: me.height * .15,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: TextFormField(
                      controller: _emailLoginText,
                      textAlignVertical: TextAlignVertical.center,
                      decoration:  InputDecoration(
                          border: InputBorder.none,
                          hintText:email_hint,
                          hintStyle: hint_style,
                          filled: true),
                      style:  black15,
                      cursorColor: black,
                      cursorHeight: 20,
                      validator: (String? value) {
                        return value == null || value.isEmpty
                            ? "Email is required."
                            : null;
                      },
                      textInputAction: TextInputAction.next),
                ),
                SizedBox(height: me.height * .15,),
                TouchRippleEffect(
                  rippleColor: black.withOpacity(.5),
                  height: 20,
                  width: 22,
                  borderRadius: BorderRadius.circular(4),
                  onTap: ()
                  {
                    privacy=!privacy;
                    setState(() {});
                  },
                  child: Container(
                    height: 20,
                    width: 22,
                    decoration: BoxDecoration(
                        color: grey,
                        borderRadius: BorderRadius.circular(4)
                    ),
                    child: privacy?Center(child: Icon(Icons.check,color: black,size: 15,)):Container(),
                  ),
                ),
                Text(privacy_st,style: black12_semi,),
                SizedBox(height: me.height * .025,),
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
                          MaterialPageRoute(builder: (context) => OtpPage()));
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
