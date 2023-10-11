import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'map.dart';
import 'package:getwidget/getwidget.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  late IO.Socket socket;
  bool _switchValue = true;
  final pages = [
    const MapScreen(),
    const MapScreen(),
  ];

/*  void connect(){
    socket = IO.io("https://api.ways-cars.com", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    socket.emit("/test", "Hello world");
    socket.onConnect((data) => print("connected"));
    print(socket.connected);
  }*/
  
  showDataAlert() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            /*shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),*/
            insetPadding: const EdgeInsets.only(
              top: 50.0,
            ),
            // insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            alignment: Alignment.topCenter,

            title: /*const Text(
              "Offline/Online",
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: 'Poppins',
                decoration: TextDecoration.underline,
              ),
              textAlign: TextAlign.center,
            ),*/
            const Text(
              "Offline/Online",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                shadows: [
                  Shadow(
                      color: Colors.black,
                      offset: Offset(0, -5))
                ],
                color: Colors.transparent,
                decoration:
                TextDecoration.underline,
                decorationColor: Colors.black,
                decorationThickness: 1,
                decorationStyle:
                TextDecorationStyle.solid,
              ),
              textAlign: TextAlign.center,
            ),
            content: Container(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              width: double.infinity,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const <Widget>[
                        Flexible(flex: 1, child: Text(
                          "Business class",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black,
                              fontFamily: 'Poppins',
                              fontSize: 12),
                        ),),
                        SizedBox(
                          width: 50,
                        ),
                        Flexible(flex: 1, child: Text(
                          "Mercedes Benz  E-Class",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black,
                              fontFamily: 'Poppins',
                              fontSize: 12),
                        ),)
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const <Widget>[
                        Flexible(flex: 1, child: Text(
                          "Business class",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 12),
                        ),),
                        SizedBox(
                          width: 50,
                        ),
                        Flexible(flex: 1, child: Text(
                          "YES 22 UK",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',),
                        ),)
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(
                      endIndent: 5,
                      indent: 5,
                      thickness: 1,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () => null,
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffE5E5E5),
                                // fixedSize: Size(250, 50),
                              ),
                              child: const Text(
                                'STAY OFFLINE',
                                style: TextStyle(color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () => null,
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xff040B25),
                                // fixedSize: Size(250, 50),
                              ),
                              child: const Text('GO ONLINE',
                                style: TextStyle(color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  showDetilAlert() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: const EdgeInsets.only(
              top: 50.0,
            ),
            // insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            alignment: Alignment.center,
            backgroundColor: Color(0xffF0F0FD),

            title: const Text(
              "£256.00",
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600
              ),
              textAlign: TextAlign.center,
            ),
            content: Container(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              width: double.infinity,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      //vertical
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        SizedBox(
                          width: 100,
                          child: Column(
                            children: [
                              const Text(
                                "Business",
                                style: TextStyle(fontSize: 15, fontFamily: 'Poppins'),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Image.asset(
                                'assets/images/up_to_down.png',
                                height: 100,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              const Text(
                                "12 min",
                                style: TextStyle(fontSize: 15,  fontFamily: 'Poppins'),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Icon(
                                Icons.location_on_sharp,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ),

                        CircularPercentIndicator(
                          radius: 60.0,
                          lineWidth: 10.0,
                          percent: 0.55,
                          animation: true,
                          animationDuration: 1200,
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [

                              Icon(
                                Icons.person,
                                size: 25.0,
                                color: Color(0xffCBCBCB),
                              ),
                              Text(
                                "Mary",
                                style: TextStyle(color: Colors.black, fontSize: 12, fontFamily: 'Poppins'),
                              ),
                            ],
                          ),
                          backgroundColor: Colors.white,
                          progressColor: Color(0xffFF5757),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            "WC1 A",
                            style: TextStyle(fontSize: 15,  fontFamily: 'Poppins'),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Padding(padding: EdgeInsets.only(top: 8),child: Image.asset(
                            'assets/images/left_to_right.png',
                            width: 100,
                          ),),

                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "12 min",
                            style: TextStyle(fontSize: 15,  fontFamily: 'Poppins'),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.location_on_sharp,
                            color: Colors.red,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          const Text(
                            "TW6",
                            style: TextStyle(fontSize: 15,  fontFamily: 'Poppins'),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      backgroundColor: Colors.white,
      /*appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          "Geeks For Geeks",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),*/
      /*appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          "Geeks For Geeks",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),*/
      body: Stack(children: [
        pages[pageIndex],
        Positioned(
          top: 50,
          child: Visibility(
            visible: _switchValue,
            child: SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      'assets/images/menu.png',
                      width: 60,
                      height: 60,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 105,
                      height: 80,
                      child: Card(
                        elevation: 5,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const <Widget>[
                            ListTile(
                              title: Text(
                                'Request',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              subtitle: Text(
                                '10',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      'assets/images/job_icon.png',
                      width: 60,
                      height: 60,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),

      /*pages[pageIndex],*/

      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Widget buildMyNavBar(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(thickness: 2,
            color: _switchValue ? Color(0xff1551D8) : Colors.red,
            height: 1),
        Padding(
          padding: EdgeInsets.zero,
          child: Card(
            child: Container(
              height: 65,
              padding: EdgeInsets.zero,
              width: double.infinity,
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
                              ? Container(
                              padding: EdgeInsets.all(4),
                              child: const Icon(
                                Icons.circle,
                                color: Colors.black,
                              ))
                              : Container(
                              padding: EdgeInsets.all(4),
                              child: const Icon(
                                Icons.circle,
                                color: Colors.grey,
                              ))),
                      const Text(
                        "MAP",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Poppins'),
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
                              ? Container(
                              padding: EdgeInsets.all(4),
                              child: const Icon(
                                Icons.circle,
                                color: Colors.black,
                              ))
                              : Container(
                              padding: EdgeInsets.all(4),
                              child: const Icon(
                                Icons.circle,
                                color: Colors.grey,
                              ))),
                      const Text(
                        "HELP",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        _switchValue ? "Online " : "Offline",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      InkWell(
                        // padding: EdgeInsets.zero,
                        enableFeedback: false,
                        onTap: () {
                          setState(() {
                            pageIndex = 1;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(4),
                          child: CupertinoSwitch(
                            value: _switchValue,
                            activeColor: Color(0xff1551D8),
                            trackColor: Color(0xffEB5757),
                            onChanged: (value) async {
                              setState(() {
                                _switchValue = value;
                              });
                              if (!_switchValue) {
                                showDataAlert();
                              } else {
                                showDetilAlert();
                              }
                              final prefs =
                              await SharedPreferences.getInstance();
                              await prefs.setBool('online', value);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
