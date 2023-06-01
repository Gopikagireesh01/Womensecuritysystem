import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
//import 'package:app_settings/app_settings.dart';


 main() {

  runApp(MyApp());
 
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.indigo,


      ),
      home: Homescreen(),
     
    );
  }
}


class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late Position _currentPosition;
  _getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        // Permissions are denied, next step is to inform the user and guide
        // them to the settings page
        showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Location Permission'),
              content: const Text(
                  'This app needs location permissions to get your location. Please grant the permission in the app settings.'),
              actions: <Widget>[
                TextButton(
                    child: const Text('Open Settings'),
                    onPressed: () async {
                      openAppSettings();
                      Navigator.of(context).pop();
                    }),
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        print(_currentPosition.latitude);
        print(_currentPosition.longitude);
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Women Security System'),
      ),
       backgroundColor: Colors.white,
      body: SafeArea(child: Column(children:  [Text('Home Screen', style: TextStyle(
        color: Colors.blue,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),),
      ElevatedButton(onPressed: (){
         _getCurrentLocation();
      }, child: Text('SOS'),),
      ElevatedButton(onPressed: (){
        Navigator.of(context).pushNamed('LoginAdmin');
        //_getCurrentLocation();
       
      }, child: Text('Admin Login'),),
     
      ElevatedButton(onPressed: (){
        Navigator.of(context).pushNamed('LoginPolice');
         
      }, child: Text('Police Login'),),

      ElevatedButton(onPressed: (){
        Navigator.of(context).pushNamed('LoginUser');
        },
       child: Text('User Login'),),

      ElevatedButton(onPressed: (){
        Navigator.of(context).pushNamed('UserReg');
      }, child: Text('User Register'),)
     
     
     
      ]),),
    );
  }
}
