import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:line_icons/line_icons.dart';

import '../../widgets/base_appbar.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController googleMapController;
  LatLng? currentPosition;

  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  void _getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      currentPosition = LatLng(position.latitude, position.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: BaseAppBar(appBar: AppBar(), title: "내 주변", center: true),
      body: currentPosition == null
          ? Center(
              child: Text(
                'loading map..',
                style: TextStyle(
                    fontFamily: 'Avenir-Medium', color: Colors.grey[400]),
              ),
            )
          : Stack(
              children: <Widget>[
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: currentPosition!,
                    zoom: 15,
                  ),
                  markers: markers,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  mapType: MapType.normal,
                  onMapCreated: (GoogleMapController controller) {
                    googleMapController = controller;
                  },
                ),
              ],
            ),
    );
  }
}
