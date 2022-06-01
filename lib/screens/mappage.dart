import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_e_siyaha/const.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const LatLng kSourceLocation = LatLng(36.745832, 3.074327);
const LatLng kDestinationLocation = LatLng(36.759860, 3.056881);

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  late BitmapDescriptor sourceIcon;
  late BitmapDescriptor destinationIcon;
  Set<Marker> _markers = Set<Marker>();

  late LatLng currentLocation;
  late LatLng destinationLocation;
  Map<String, LatLng> _destinations = Map<String, LatLng>();

  @override
  void initState() {
    super.initState();
    // set up initial locations
    this.setIntialLocation();
    // set up marker icons
  }

  void setSourceandDestinationsMarkerIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.0), 'hello');
    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.0), 'hello');
  }

  void setIntialLocation() {
    currentLocation =
        LatLng(kSourceLocation.latitude, kSourceLocation.longitude);
    destinationLocation =
        LatLng(kDestinationLocation.latitude, kDestinationLocation.longitude);
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
      zoom : CAMERA_ZOOM ,
      tilt: CAMERA_TILT, 
      bearing: CAMERA_BEALING,
      target: kSourceLocation
    );
    return Scaffold(
      body: Container(
        child: GoogleMap(
          myLocationButtonEnabled: true,
          compassEnabled: false,
          tiltGesturesEnabled: false,
          markers: _markers,
          mapType: MapType.normal,
          initialCameraPosition: initialCameraPosition,
          onMapCreated: (GoogleMapController controller){
            controller.setMapStyle(kMapStyle); 
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
