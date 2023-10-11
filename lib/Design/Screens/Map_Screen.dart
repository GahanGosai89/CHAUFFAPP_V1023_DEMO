import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../../model/lat_lng.dart';
import '../utils/colors.dart';

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
  }

  double mapBottomPadding = 0.0;

  late BitmapDescriptor customIcon;

  late GoogleMapController mapController;
  Set<Marker> markers = {
 Marker(
  markerId: MarkerId('currentLocation'),
  position: LatLng(37.7749, -122.4194),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue), // Customize the icon
  )
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



  // on below line we are specifying our camera position
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
                    myLocationEnabled: true,
                    mapType: MapType.terrain,
                    markers: markers,
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

