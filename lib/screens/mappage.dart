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
  late Marker _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
          position: kSourceLocation,
        ); 
    late Marker _destination =Marker(
          markerId: const MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'Destination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
          position: kDestinationLocation,
        ) ; 
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
      zoom : kCAMERA_ZOOM ,
      tilt: kCAMERA_TILT, 
      bearing: kCAMERA_BEALING,
      target: kSourceLocation
    );
    return Scaffold(
      body: Container(
        child: GoogleMap(
          markers: {
            if(_origin != null ) _origin,
            if(_destination != null ) _destination, 

          } , 
          // onLongPress: _addMarker,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: true,
          compassEnabled: false,
          tiltGesturesEnabled: false,
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
  void _addMarker(LatLng pos) async {
    if (_origin == null || (_origin != null && _destination != null)) {
      // Origin is not set OR Origin/Destination are both set
      // Set origin
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
          position: pos,
        );
        // Reset destination
        // _destination = null;

        // Reset info
        // _info = null;
      });
    } else {
      // Origin is already set
      // Set destination
      setState(() {
        _destination = Marker(
          markerId: const MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'Destination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
          position: pos,
        );
      });
      
    }
  }
}