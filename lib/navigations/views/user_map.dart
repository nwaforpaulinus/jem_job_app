import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart' as loc;
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' show cos, sqrt, asin;
import '../../providers/user_provider.dart';
import '../secrets/secrets.dart';
import '../widgets/permissions.dart';

class UserMapView extends StatefulWidget {
  final String errandUserId;
  const UserMapView({Key? key, required this.errandUserId})
      : super(key: key);

  @override
  State<UserMapView> createState() => _UserMapViewState();
}

class _UserMapViewState extends State<UserMapView> {
  final Completer<GoogleMapController?> _controller = Completer();
  GeoPoint? destinationLocation = GeoPoint(0, 0);
  LatLng? curLocation = LatLng(0, 0);
  Map<PolylineId, Polyline> polyLines = {};
  PolylinePoints polylinePoints = PolylinePoints();
  Location location = Location();
  Marker? sourcePosition, destinationPosition;
  loc.LocationData? _currentPosition;

  StreamSubscription<loc.LocationData>? locationSubscription;

  @override
  void initState() {
    super.initState();
    setLocation();
    getNavigation();
    addMarker();
  }

  @override
  void dispose() {
    locationSubscription?.cancel();
    super.dispose();
  }



  setLocation() async {
    var collection = FirebaseFirestore.instance.collection('errands');
    var docSnapshot = await collection.doc(widget.errandUserId).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      GeoPoint location = data?['location']; // <-- The value you want to
      destinationLocation =
      data?['destinationLocation']; // <-- The value you
      setState(() {
        curLocation = LatLng(location.latitude, location.longitude);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: sourcePosition == null || curLocation == null || destinationLocation == null
          ? const Center(child: CircularProgressIndicator())
          : Stack(
        children: [
          GoogleMap(
            zoomControlsEnabled: false,
            polylines: Set<Polyline>.of(polyLines.values),
            initialCameraPosition: CameraPosition(
              target: curLocation as LatLng,
              zoom: 16,
            ),
            markers: {sourcePosition!, destinationPosition!},
            onTap: (latLng) {
              if (kDebugMode) {
                print(latLng);
              }
            },
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Positioned(
            top: 30,
            left: 15,
            child: GestureDetector(
              onTap: () {
                // Navigator.of(context).pushAndRemoveUntil(
                //     MaterialPageRoute(builder: (context) => const MapUI()),
                //     (route) => false);
              },
              child: const Icon(Icons.arrow_back),
            ),
          ),
          Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blue),
                child: Center(
                  child: IconButton(
                    icon: const Icon(
                      Icons.navigation_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      await launchUrl(Uri.parse(
                          'google.navigation:q=${destinationLocation
                              ?.latitude}, ${destinationLocation
                              ?.longitude}&key=${Platform.isAndroid ?
                          androidMapsKey : Platform.isIOS ? iosMapsKey : ''}'));
                    },
                  ),
                ),
              ))
        ],
      ),
    );
  }

  getNavigation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    final GoogleMapController? controller = await _controller.future;
    location.changeSettings(accuracy: loc.LocationAccuracy.high);
    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    if (_permissionGranted == loc.PermissionStatus.granted) {
      _currentPosition = await location.getLocation();

      curLocation =
          LatLng(_currentPosition!.latitude!, _currentPosition!.longitude!);

      locationSubscription =
          location.onLocationChanged.listen((LocationData currentLocation) {
            controller?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
              zoom: 16,
            )));
            if (mounted) {
              controller
                  ?.showMarkerInfoWindow(MarkerId(sourcePosition!.markerId.value));

              setState(() {
                curLocation =
                    LatLng(currentLocation.latitude!, currentLocation.longitude!);

                sourcePosition = Marker(
                  markerId: MarkerId(currentLocation.toString()),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueBlue),
                  position:
                  LatLng(currentLocation.latitude!, currentLocation.longitude!),
                  infoWindow: InfoWindow(
                      title:
                      '${double.parse((getDistance(LatLng(destinationLocation
                          ?.latitude as double, destinationLocation?.longitude as double))
                          .toStringAsFixed
                        (2)))} km'),
                  onTap: () {
                    print('market tapped');
                  },
                );
              });
              getDirections(LatLng(destinationLocation?.latitude as double,
                  destinationLocation?.longitude as double));
            }
          });
    }
  }

  getDirections(LatLng dst) async {
    List<LatLng> polylineCoordinates = [];
    List<dynamic> points = [];
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        Platform.isAndroid
            ? androidMapsKey
            : Platform.isIOS
            ? iosMapsKey
            : '',
        PointLatLng(curLocation?.latitude as  double, curLocation?.longitude
        as double),
        PointLatLng(dst.latitude, dst.longitude),
        travelMode: TravelMode.driving);
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        points.add({'lat': point.latitude, 'lng': point.longitude});
      }
    } else {
      if (kDebugMode) {
        print(result.errorMessage);
      }
    }
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = const PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.blue,
      points: polylineCoordinates,
      width: 5,
    );
    polyLines[id] = polyline;
    setState(() {});
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  double getDistance(LatLng destPosition) {
    return calculateDistance(curLocation?.latitude, curLocation?.longitude,
        destPosition.latitude, destPosition.longitude);
  }

  addMarker() {
    setState(() {
      sourcePosition = Marker(
        markerId: const MarkerId('source'),
        position: curLocation as LatLng,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      );
      destinationPosition = Marker(
        markerId: const MarkerId('destination'),
        position: LatLng(destinationLocation?.latitude as double,
            destinationLocation?.longitude as double),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
      );
    });
  }
}