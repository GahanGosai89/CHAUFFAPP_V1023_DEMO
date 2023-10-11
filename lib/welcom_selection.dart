import 'dart:convert';

import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ways_chauffeur/login.dart';

class WelcomeSelection extends StatefulWidget {
  const WelcomeSelection({Key? key}) : super(key: key);

  @override
  _WelcomeSelectionState createState() => _WelcomeSelectionState();
}

class _WelcomeSelectionState extends State<WelcomeSelection> {
  final _emailLoginText = TextEditingController();
  final GlobalKey<FormState> _formLoginKey = GlobalKey<FormState>();
  bool? value = false;
  String url = "wss://api.ways-cars.com";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // loginAPI();
    /*var channel = IOWebSocketChannel.connect(Uri.parse(url));

    channel.stream.listen((message) {
      channel.sink.add('received!');
      channel.sink.close(status.goingAway);
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.zero,
        alignment: Alignment.center,
        child: Stack(children: [
          SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(
                // top: MediaQuery.of(context).size.height * 0.5,
                top: 30,
                left: 0,
                right: 0,
              ),
              child: Center(
                  child: Form(
                key: _formLoginKey,
                child: Column(children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    width: 400,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "Your professional way to drive...",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 130,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      elevation: 5,
                    ),
                    onPressed: () async {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MyLogin()));
                      /*if (_formLoginKey.currentState!.validate()) {
                        String loginRes = await loginAPI(
                            _emailLoginText.text, _passwordLoginText.text);
                        if (loginRes == "") {
                          Fluttertoast.showToast(
                              msg: loginRes,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.grey,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setBool('userLogin', true);
                          await prefs.setString(
                              'userName', _emailLoginText.text);
                          await prefs.setString('tokenAPI', loginRes);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                        }
                      }*/
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                          color: const Color(0xff010114),
                          borderRadius: BorderRadius.circular(5)),
                      child: Container(
                        width: 261,
                        padding: const EdgeInsets.all(15),
                        constraints: const BoxConstraints(minWidth: 88.0),
                        child: const Text('SIGN IN',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontFamily: 'Poppins')),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      elevation: 5,
                    ),
                    onPressed: () async {
                      /*if (_formLoginKey.currentState!.validate()) {
                        String loginRes = await loginAPI(
                            _emailLoginText.text, _passwordLoginText.text);
                        if (loginRes == "") {
                          Fluttertoast.showToast(
                              msg: loginRes,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.grey,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setBool('userLogin', true);
                          await prefs.setString(
                              'userName', _emailLoginText.text);
                          await prefs.setString('tokenAPI', loginRes);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                        }
                      }*/
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                          color: const Color(0xffABACB0),
                          borderRadius: BorderRadius.circular(5)),
                      child: Container(
                        width: 261,
                        padding: const EdgeInsets.all(15),
                        constraints: const BoxConstraints(minWidth: 88.0),
                        child: const Text('Register',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontFamily: 'Poppins')),
                      ),
                    ),
                  ),
                ]),
              )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    'assets/images/footer_bg.png',
                    height: 119,
                    width: 856,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height - 70),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      'assets/images/car.png',
                      width: 200,
                      height: 150,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
