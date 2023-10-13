import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../../model/lat_lng.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'dart:io';

import '../utils/ing_strings.dart';


class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
    static Stream<Position> getPositionStream({LocationSettings? locationSettings,}) =>
      GeolocatorPlatform.instance.getPositionStream(
        locationSettings: locationSettings,
      );
  @override
  void initState() {
    super.initState();
    getPositionStream();
    getCustomMarker();
  }

  double mapBottomPadding = 0.0;

  late BitmapDescriptor customIcon;

  late GoogleMapController mapController;
  Set<Marker> _markers = {
  };
  Position? _currentPosition;
  static double lat = 0.0;
  static double lng = 0.0;
  Future<DemoModel> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {

      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
        await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      lat = _currentPosition?.latitude ?? 0.0;
      lng = _currentPosition?.longitude ?? 0.0;
      _kGoogle;
    }).catchError((e) {
      debugPrint(e);
    });

    return DemoModel(lat, lng);
  }


    late GoogleMapController _controller;
    late BitmapDescriptor myIcon;



    setMarkerAndMoveCamera(Position position){
      _controller.animateCamera(CameraUpdate.newCameraPosition( CameraPosition(
        target: LatLng(position.latitude,position.longitude),
        zoom: 15.0,
      )));

      setState(() {
        _markers.add(
            Marker(
              rotation: 0,
              infoWindow: InfoWindow(
                title: 'dhaka',
              ),
              markerId: MarkerId('currentlodation'),
              position: LatLng(position.latitude,position.longitude),
              icon: myIcon == null? BitmapDescriptor.defaultMarker : myIcon /*BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue)*/,
            )
        );
      });
    }

    getCustomMarker(){
      getMarkerIcon(CarImg,'Bike(0 kph)',Colors.indigo,0.0).then((value){
        setState(() {
          myIcon = value;
        });
      });
    }

    static final CameraPosition _kGoogle = CameraPosition(
    target: LatLng(lat, lng),
    zoom: 14.4746,

  );
  var map=0.0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(25, 25)),
        'assets/images/shop_circle.png')
        .then((d) {
      customIcon = d;
    });
    void onMapcreated(GoogleMapController controller) {
      setState(() {
        map = MediaQuery.of(context).size.height * .74;
      });
    }
    return Scaffold(
      body: FutureBuilder(
          future: _determinePosition(),
          builder: (context, AsyncSnapshot<DemoModel> snapshot) {
            if (snapshot.data != null && snapshot.data?.number1 != 0.0) {
              return Stack(
                children: [
                  GoogleMap(
                    padding: EdgeInsets.only(top: map),
                    initialCameraPosition: _kGoogle,
                    zoomControlsEnabled: false,
                    mapToolbarEnabled: true,
                    buildingsEnabled: true,
                    myLocationButtonEnabled: true,
                    myLocationEnabled: false,
                    mapType: MapType.terrain,
                    markers: _markers,
                    onMapCreated: (GoogleMapController controller) {
                      _controller = controller;
                      setMarkerAndMoveCamera(_currentPosition!);
                    },
                    trafficEnabled: true,
                    compassEnabled: true,
                  ),
                ],
              );
            } else {
              return SizedBox(

              );
            }
          }),
    );
  }
}

Future<BitmapDescriptor> getMarkerIcon(String imagePath,String infoText,Color color,double rotateDegree) async {
  final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
  final Canvas canvas = Canvas(pictureRecorder);


  Size canvasSize = Size(300.0,400.0);
  Size markerSize = Size(150.0,150.0);
  final double infoHeight = 10.0;
  final double shadowWidth = 30.0;
  canvas.translate(canvasSize.width/1.5, canvasSize.height/2+infoHeight);
  Rect oval = Rect.fromLTWH(-markerSize.width, -markerSize.height/10, markerSize.width-shadowWidth, markerSize.height-shadowWidth);
  canvas.save();
  canvas.clipPath(Path()
    ..addRect(oval));
  ui.Image image = await getImageFromPath(imagePath);
  paintImage(canvas: canvas,image: image, rect: oval, fit: BoxFit.fill);
  canvas.restore();
  canvas.restore();
  final ui.Image markerAsImage = await pictureRecorder.endRecording().toImage(
      canvasSize.width.toInt(),
      canvasSize.height.toInt()
  );
  final ByteData? byteData = await markerAsImage.toByteData(format: ui.ImageByteFormat.png);
  final Uint8List uint8List = byteData!.buffer.asUint8List();
  return BitmapDescriptor.fromBytes(uint8List);
}


Future<ui.Image> getImageFromPath(String imagePath) async {
  var bd = await rootBundle.load(imagePath);
  Uint8List imageBytes = Uint8List.view(bd.buffer);

  final Completer<ui.Image> completer = new Completer();

  ui.decodeImageFromList(imageBytes, (ui.Image img) {
    return completer.complete(img);
  });

  return completer.future;
}