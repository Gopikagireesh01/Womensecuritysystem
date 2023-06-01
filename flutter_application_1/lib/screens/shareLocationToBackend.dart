import 'package:location/location.dart';
import 'package:http/http.dart' as http;
//import 'package:latlng/latlng.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
//import 'package:geolocator_platform_interface/src/enums/location_accuracy.dart';
//import 'package:location_platform_interface/location_platform_interface.dart/' as LocationAccuracy;

void shareLocationToBackend() async {
//   Location location = Location();
//   bool _serviceEnabled;
//   PermissionStatus _permissionGranted;
//   LocationData _locationData;

//   // Check if location services are enabled
//   //_serviceEnabled = await location.serviceEnabled();
//   _serviceEnabled = true;
//   if (!_serviceEnabled) {
//     _serviceEnabled = await location.requestService();
//     if (!_serviceEnabled) {
//       // Location services are not enabled, handle accordingly
//       return;
//     }
//   }

//   // Check if location permission is granted
//  // _permissionGranted = await location.hasPermission();
//   _permissionGranted = PermissionStatus.granted;
//   if (_permissionGranted == PermissionStatus.denied) {
//     _permissionGranted = await location.requestPermission();
//     if (_permissionGranted != PermissionStatus.granted) {
//       // Location permission not granted, handle accordingly
//       return;
//     }
//   }

//   // Get the current location
//   _locationData = await location.getLocation();

  // Prepare the data to send to the backend
   //Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
   //LatLng userLocation = LatLng(position.latitude, position.longitude);
  //Map<String, dynamic> locationData = {
    //'latitude': userLocation.latitude,
    //'longitude': userLocation.longitude,
  //};

  // Send the data to the backend
  try {
     String url = 'http://localhost:8080/sendsms';
  
     Uri uri = Uri.parse(url);
    final response = await http.post(
      uri,
     // body: locationData,
    );
    
    // Handle the response from the backend if needed
    // ...
  } catch (e) {
    // Handle any errors that occurred during the HTTP request
    // ...
  }
}
