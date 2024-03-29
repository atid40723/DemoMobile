import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  Position? userLocation;
  GoogleMapController? mapController;
  late Future<Position> _locationFuture;

  @override
  void initState() {
    super.initState();
    _locationFuture = _getLocation();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<Position> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

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

    userLocation = await Geolocator.getCurrentPosition();
    return userLocation!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps'),
        backgroundColor: Color.fromRGBO(84, 196, 134, 0.875),
      ),
      body: FutureBuilder<Position>(
        future: _locationFuture,
        builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            // Return GoogleMap widget using user's location
            return GoogleMap(
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target:
                    LatLng(snapshot.data!.latitude, snapshot.data!.longitude),
                zoom: 15,
              ),
            );
          }
        },
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.startFloat, // จัดตำแหน่งปุ่มเป็นฝั่งซ้าย
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          mapController?.animateCamera(CameraUpdate.newLatLngZoom(
              LatLng(userLocation!.latitude, userLocation!.longitude), 18));
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(
                  'Your location has been sent!\nlat: ${userLocation!.latitude} long: ${userLocation!.longitude} ',
                ),
              );
            },
          );
        },
        label: Text("Send Location"),
        icon: Icon(Icons.near_me),
      ),
    );
  }
}
