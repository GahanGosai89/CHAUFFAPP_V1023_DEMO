import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:http/http.dart' as http;
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ways_chauffeur/home_page.dart';
import 'model/verify_password_response.dart';

class VerifyPassword extends StatefulWidget {
  const VerifyPassword({Key? key}) : super(key: key);

  @override
  _VerifyPasswordState createState() => _VerifyPasswordState();
}

Future<String?> _getId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    // import 'dart:io'
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  } else if (Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.id; // unique ID on Android
  }
}

Future<VerifyPasswordResponse> verifyAPI(String OTP) async {
  final preferences = await SharedPreferences.getInstance();
  String driverId = preferences.getString('driverId') ?? "";
  final queryParameters = {
    // 'driverId': "62c3b980b6e10c0bac0c8df6",
    'requestType': 'login',
    'otp': OTP,
    'deviceId': await _getId(),
    'driverCurrentStatus': 'loggedInApp',
  };
  VerifyPasswordResponse verifyResponse;
  print(Uri.https('api.ways-cars.com', 'driver/verify-mobile-otp/$driverId',
      queryParameters));
  var response = await http.get(
    Uri.https('api.ways-cars.com', 'driver/verify-mobile-otp/$driverId',
        queryParameters),
    /*headers: {
        "content-type": "application/json",
      }*/
  );

  var jsonResponse = await json.decode(json.encode(response.body));

  print(jsonResponse);
  if (response.statusCode != 200) {
    Fluttertoast.showToast(
        msg: jsonResponse.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }
  verifyResponse =
      VerifyPasswordResponse.fromJson(jsonDecode(response.body) ?? {});
  return verifyResponse;
}

class _VerifyPasswordState extends State<VerifyPassword> {
  final _emailLoginText = TextEditingController();
  final GlobalKey<FormState> _formLoginKey = GlobalKey<FormState>();
  bool? value = false;
  late String valueOTP;
  late String driverId;

  void _asyncSessionMethod() async {
    final preferences = await SharedPreferences.getInstance();
    setState(() {
      driverId = preferences.getString('driverId') ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
    _asyncSessionMethod();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        alignment: Alignment.center,
        child: Stack(children: [
          SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(
                  // top: MediaQuery.of(context).size.height * 0.5,
                  top: 30,
                  left: 20,
                  right: 20),
              child: Center(
                  child: Form(
                key: _formLoginKey,
                child: Column(children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 400,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 35, bottom: 10),
                      child: Image.asset(
                        'assets/images/code.png', width: 80, height: 33,
                      ),
                    ),
                  ),
                  OTPTextField(
                    length: 4,
                    width: MediaQuery.of(context).size.width - 100,
                    fieldWidth: 64,
                    outlineBorderRadius: 5,
                    style: const TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.box,
                    onChanged: (pin) {
                      valueOTP = pin;
                      print("Changed: " + pin);
                    },
                    onCompleted: (pin) {
                      valueOTP = pin;
                      print("Completed: " + pin);
                    },
                  ),
                  const SizedBox(
                    height: 240,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      elevation: 5,
                    ),
                    onPressed: () async {
                      if (valueOTP.isNotEmpty && valueOTP.length == 4) {
                        VerifyPasswordResponse verifyRes =
                            await verifyAPI(valueOTP);

                        if (verifyRes.success) {
                          Fluttertoast.showToast(
                              msg: verifyRes.message,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.grey,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomePage()));
                        }
                      } else {
                        Fluttertoast.showToast(
                            msg: 'Please enter 4 digit code.',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }

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
                          color: Color(0xff010114),
                          borderRadius: BorderRadius.circular(5)),
                      child: Container(
                        width: 267,
                        padding: const EdgeInsets.all(15),
                        constraints: const BoxConstraints(minWidth: 88.0),
                        child: const Text('CONTINUE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                ]),
              )),
            ),
          ),
        ]),
      ),
    );
  }
}
