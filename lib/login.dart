import 'dart:convert';
import 'package:flutter/material.dart';

// import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:socket_io_client/socket_io_client.dart';
import 'package:ways_chauffeur/verify_password.dart';
import 'model/login_response.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

Future<LoginResponse> loginAPI(String email) async {
  LoginResponse loginResponse;
  var body = json.encode({"email": email});
  print(Uri.https('api.ways-cars.com', 'driver/mobile-login'));
  print(body);
  var response =
      await http.post(Uri.https('api.ways-cars.com', 'driver/mobile-login'),
          headers: {
            "content-type": "application/json",
          },
          body: body);

  // var jsonResponse = json.decode(response.body);
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
  loginResponse = LoginResponse.fromJson(jsonDecode(response.body) ?? {});
  return loginResponse;
}

class _MyLoginState extends State<MyLogin> {
  final _emailLoginText = TextEditingController();
  final GlobalKey<FormState> _formLoginKey = GlobalKey<FormState>();
  bool valueCheck = false;
  late IO.Socket socket;
  String url = "wss://api.ways-cars.com";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // initSocket();
    connectToServer();
  }

  @override
  void dispose() {
    socket.disconnect();
    super.dispose();
  }

  /*Future<void> initSocket() async {
    try {
      socket = IO.io(url, <String, dynamic>{
        'transports': ['websocket'],
        // "autoConnect": false,
        'autoConnect': false,
      });
      */ /*socket = IO.io(
          url,
          OptionBuilder()
              .setTransports(['websocket']) // for Flutter or Dart VM
              .disableAutoConnect() // disable auto-connection
              // .setExtraHeaders({'Connection': 'upgrade', 'Upgrade': 'websocket'}) // optional
              .build());*/ /*
      // socket = IO.io(url);

      socket.connect();
      socket.onConnect((data) => {print('Connect: ${socket.id}')});
      socket.emit('/test', 'test');
      socket.on("connect_error", (data) => print('connect_error: $data'));
    } catch (e) {
      print("Error Socket: '$e'");
    }
*/ /*
    Future.delayed(const Duration(milliseconds: 30000), () {
      bool s = socket.connected;
      print("SocketIOStatus: '$s'");
      Fluttertoast.showToast(
          msg: s.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    });
*/ /*
  }*/

  void connectToServer() {
    try {
      // Configure socket transports must be sepecified
      /*socket = io(url, <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
      });*/

      socket = io(
          "https://api.ways-cars.com",
          OptionBuilder()
              .setTransports(['websocket']) // for Flutter or Dart VM
              .disableAutoConnect()
              // .setTimeout(10000)
              .setExtraHeaders(
                  {'Connection': 'Upgrade', 'Upgrade': 'websocket'}) // optional
              .build());

      // Connect to websocket
      socket.connect();

      // Handle socket events
      socket.on('connect', (_) => print('connect: ${socket.id}'));
      // socket.on('location', handleLocationListen);
      // socket.on('typing', handleTyping);
      // socket.on('message', handleMessage);
      socket.on('disconnect', (_) => print('disconnect'));
      socket.on('fromServer', (data) => print('from_server: $data'));
      socket.on("error", (data) => print('error: $data'));
      socket.onConnectError((data) {

        print("Error Connecting - > $data");

      });

      socket.on("connect_error", (data) => print('connect_error: $data'));
    } catch (e) {
      print(e.toString());
    }
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
                    height: 80,
                  ),
                  Row(
                    //Center Row contents horizontally,
                    mainAxisAlignment: MainAxisAlignment.center,
                    //Center Row contents vertically,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: TextFormField(
                              controller: _emailLoginText,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "E-mail",
                                  hintStyle: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      color: Color(0xffB2B4B8)),
                                  fillColor: Color(0xffD9D9D9),
                                  filled: true),
                              style: const TextStyle(
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                color: Color(0xffB2B4B8),
                              ),
                              validator: (String? value) {
                                return value == null || value.isEmpty
                                    ? "Email is required."
                                    : null;
                              },
                              textInputAction: TextInputAction.next),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 140,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        unselectedWidgetColor: Color(0xffD9D9D9),
                      ),
                      child: Checkbox(
                        value: this.valueCheck,
                        checkColor: Colors.black,
                        activeColor: Color(0xffD9D9D9),
                        onChanged: (bool? value) {
                          setState(() {
                            this.valueCheck = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          "I agree with Terms & Conditions, Privacy Policy",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 55,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      elevation: 5,
                    ),
                    onPressed: () async {
                      if (_formLoginKey.currentState!.validate()) {
                        if (valueCheck) {
                          LoginResponse loginRes =
                              await loginAPI(_emailLoginText.text);
                          Fluttertoast.showToast(
                              msg: loginRes.message,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Color(0xff010114),
                              textColor: Colors.white,
                              fontSize: 15.0);
                          if (loginRes.success) {
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setString(
                                'driverId', loginRes.driverId);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => VerifyPassword()));
                          } else {
                            Fluttertoast.showToast(
                                msg: 'Something Wrong',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.grey,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                        } else {
                          Fluttertoast.showToast(
                              msg: 'Please check privacy policy',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.grey,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      }
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
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
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
