import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'model/lat_lng.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late bool OnlineStatus = false;

/*  late GoogleMapController mapController;
  bool customFlag = false;
  late BitmapDescriptor customIcon1;

  */ /*Custom Marker for Maps*/ /*
  createMarker(context) {
    if (customIcon1 == null) {
      ImageConfiguration configuration = createLocalImageConfiguration(context);
      BitmapDescriptor.fromAssetImage(configuration, ImagePaths.dcGlobe) */ /* ImagePaths.dcGlobe i san asset image */ /*
          .then((icon) {
        customIcon1 = icon;
      });
    }
  }*/

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determineLocalPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  static Stream<Position> getPositionStream({
    LocationSettings? locationSettings,
  }) =>
      GeolocatorPlatform.instance.getPositionStream(
        locationSettings: locationSettings,
      );

  show() {
    Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.all(10),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.lightBlue),
              padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
              child: Text("You can make cool stuff!",
                  style: TextStyle(fontSize: 24), textAlign: TextAlign.center),
            ),
            Positioned(
                top: -100,
                child: Image.network("https://i.imgur.com/2yaf2wb.png",
                    width: 150, height: 150))
          ],
        ));
  }

  void _asyncSessionMethod() async {
    final preferences = await SharedPreferences.getInstance();
    setState(() {
      OnlineStatus = preferences.getBool('online') ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    getPositionStream();
    _asyncSessionMethod();
  }

  double mapBottomPadding = 100.0;

  // on below line we are initializing our controller for google maps.
  late BitmapDescriptor customIcon;

  late GoogleMapController mapController;
  Set<Marker> markers = {};
  Position? _currentPosition;
  static double lat = 0.0;
  static double lng = 0.0;

  // late final Future<GetSurveyData>? myFuture = getData(tokenAPI);

  /*Future<GetSurveyData> getData(String tokenAPI) async {

    final preferences = await SharedPreferences.getInstance();

    tokenAPI = preferences.getString('tokenAPI') ?? "Not found";
    tokenAPI = tokenAPI.replaceAll(*/ /*new RegExp(r'[^\w\s]+')*/ /*'"','');

    GetSurveyData? getSurveyData;
    print(Uri.https('ehubapi.amarostech.link', 'api/Survey/GetUserSurveyData'));
    var response = await http.get(
      Uri.https('ehubapi.amarostech.link', 'api/Survey/GetUserSurveyData'),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
        "Authorization":
        "Bearer $tokenAPI"
      },
    );

    var jsonResponse = json.decode(response.body);
    print(jsonResponse);
    getSurveyData = GetSurveyData.fromJson(jsonResponse);

    if (getSurveyData.data.shops.isNotEmpty) {
      for (var i = 0; i < getSurveyData.data.shops.length; i++) {
        setState(() {
          markers.add(Marker(
            icon: customIcon,
            markerId: MarkerId(getSurveyData?.data.shops[i].id??''),
            position: LatLng(getSurveyData?.data.shops[i].latitude??0.0,
                getSurveyData?.data.shops[i].longitude??0.0),
            infoWindow: InfoWindow(
              title: getSurveyData?.data.shops[i].title,
              snippet: getSurveyData?.data.shops[i].addressInEnglish,
              onTap: (){
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(20.0)), //this right
                        child: SizedBox(
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              0,
                            ),
                            child: Material(
                              // Email
                              elevation: 10,
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              child: Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Color(0xffd8ebc3),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                      10,
                                      0,
                                      10,
                                      0,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                'assets/images/task_icon.png',
                                                height: 100,
                                                width: 100,
                                              ),
                                              const SizedBox(width: 20,),
                                              Column(
                                                //horizontal Center
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  //vertical Center
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                                  children: [
                                                    Align(
                                                        alignment:
                                                        Alignment.centerLeft,
                                                        child: Text(
                                                          getSurveyData?.data.shops[i].nameInEnglish??'NA',
                                                          maxLines: 3,
                                                          textAlign:
                                                          TextAlign.start,
                                                          style: const TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 22),
                                                        )),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    SizedBox(
                                                      width: 150,
                                                      child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            getSurveyData?.data.shops[i].addressInEnglish??'NA',
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            textAlign:
                                                            TextAlign.start,
                                                            maxLines: 3,
                                                            softWrap: false,
                                                            style: const TextStyle(
                                                                color:
                                                                Colors.black,
                                                                fontSize: 12),
                                                          )),
                                                    ),
                                                  ]),
                                            ]),
                                        const Divider(
                                          thickness: .2,
                                          color: Colors.grey,
                                        ),
                                        Row(
                                          //Center Row contents horizontally,
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          //Center Row contents vertically,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children:  [
                                            Align(
                                              alignment: Alignment.center,
                                              child: InkWell(
                                                onTap: (){
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text(
                                                  "Cancel",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12),
                                                ),
                                              ),),
                                            const SizedBox(
                                              height: 20,
                                              child: VerticalDivider(
                                                thickness: .1,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Start Survey",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12),
                                                )),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          ),
                        )// here
                      );
                    });
              }
            ),
          ));
        });
      }
    }

    return getSurveyData;
  }*/

  Future<DemoModel> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.

    // _getAddressFromLatLng(await Geolocator.getCurrentPosition());
    //
    // return await Geolocator.getCurrentPosition();

    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      lat = _currentPosition?.latitude ?? 0.0;
      lng = _currentPosition?.longitude ?? 0.0;
      Fluttertoast.showToast(
          msg: "$lat, $lng",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
      _kGoogle;
      // _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });

    return DemoModel(lat, lng);
  }

  void onMapcreated(GoogleMapController controller) {
    setState(() {
      // markers.add(Marker(
      //   icon: customIcon,
      //   markerId: const MarkerId('1'),
      //   position: const LatLng(13.007488, 77.598656),
      //   infoWindow: const InfoWindow(
      //     title: 'Marker Title Second ',
      //     snippet: 'My Custom Subtitle',
      //   ),
      // ));
      // markers.add(Marker(
      //   icon: customIcon,
      //   markerId: const MarkerId('2'),
      //   position: const LatLng(13.007481, 77.598651),
      //   infoWindow: const InfoWindow(
      //     title: 'Marker Title Third ',
      //     snippet: 'My Custom Subtitle',
      //   ),
      // ));
      // markers.add(Marker(
      //   icon: customIcon,
      //   markerId: const MarkerId('3'),
      //   position: const LatLng(13.001916, 77.588849),
      //   infoWindow: const InfoWindow(
      //     title: 'Marker Title Fourth ',
      //     snippet: 'My Custom Subtitle',
      //   ),
      // ));
      mapBottomPadding = 280;
    });
  }

  // on below line we are specifying our camera position
  static final CameraPosition _kGoogle = CameraPosition(
    target: LatLng(lat, lng),
    zoom: 14.4746,
  );

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // make sure to initialize before map loading
    BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(25, 25)),
            'assets/images/shop_circle.png')
        .then((d) {
      customIcon = d;
    });

    return Scaffold(
      body: FutureBuilder(
          future: _determinePosition(),
          builder: (context, AsyncSnapshot<DemoModel> snapshot) {
            if (snapshot.data != null && snapshot.data?.number1 != 0.0) {
              return Stack(
                children: [
                  GoogleMap(
                    padding: EdgeInsets.only(top: mapBottomPadding),
                    initialCameraPosition: _kGoogle,
                    mapToolbarEnabled: true,
                    buildingsEnabled: true,
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    mapType: MapType.terrain,
                    markers: markers,
                    trafficEnabled: true,
                    compassEnabled: true,
                    onMapCreated: onMapcreated,
                    zoomControlsEnabled: true,

                  ),
                ],
              );
            } else {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Center(
                    child: Column(
                  //Horizontal
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //Vertical
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    Text("Map Loading..."),
                  ],
                )),
              );
            }
          }),
    );
  }
}
