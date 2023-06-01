 //import 'dart:ui';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/screens/AddDiv.dart';
import 'package:flutter_application_1/screens/CreateComp.dart';
import 'package:flutter_application_1/screens/Homescreen.dart';
import 'package:flutter_application_1/screens/LoginAdmin.dart';
import 'package:flutter_application_1/screens/MyComplaint.dart';
import 'package:flutter_application_1/screens/PoliceHome.dart';
import 'package:flutter_application_1/screens/SOSbutton.dart';
import 'package:flutter_application_1/screens/UpdateProfile.dart';
//import 'package:flutter_application_1/screens/splashscreen.dart';
import 'package:flutter_application_1/screens/LoginPolice.dart';
import 'package:flutter_application_1/screens/LoginUser.dart';
import 'package:flutter_application_1/screens/UserReg.dart';
import 'package:flutter_application_1/screens/AdminHome.dart';
import 'package:flutter_application_1/screens/UserHome.dart';
import 'package:flutter_application_1/screens/AddGuardian.dart';
import 'package:flutter_application_1/screens/Addpolice.dart';
import 'package:flutter_application_1/screens/Addcategory.dart';
import 'package:flutter_application_1/screens/ViewGuardian.dart';
import 'package:flutter_application_1/screens/AllComp.dart';
import 'package:flutter_application_1/screens/ViewPolice.dart';
import 'package:flutter_application_1/screens/ViewUser.dart';
import 'package:flutter_application_1/screens/shareLocationToBackend.dart';
import 'package:flutter_application_1/screens/updatestatus.dart';


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
      home: Homescreen() ,
      routes: {
        'Homescreen':(context) {
          return Homescreen();
      },
        'LoginAdmin':(context) {
          return LoginAdmin();
        },
        'LoginPolice' :(context) {
          return LoginPolice();
        },
        'LoginUser' :(context) {
          return LoginUser();
        },
        'UserReg' :(context) {
          return UserReg();
        },
        'UserHome' :(context) {
          return UserHome();
        },
        'AddGuardian' :(context) {
          return AddGuardian();
        },
        'AddCategory' :(context) {
          return Addcategory();
        },
        'AddDiv' :(context) {
          return AddDiv();
        
        },
        'AddPolice' :(context) {
          return Addpolice();
        },
        'AdminHome' :(context) {
          return AdminHome();
        },
        'AllComp' :(context) {
          return AllComp();
        },
        'MyComp' :(context) {
          return MyComplaint();
        },
        'PoliceHome' :(context) {
          return PoliceHome();
        },
        'UpdateProfile' :(context) {
          return UpdateProfile();
        },
        'ViewGuardian' :(context) {
          return ViewGuardian();
        },
        'ViewPolice' :(context) {
          return ViewPolice();
        },
        'ViewUser' :(context) {
          return ViewUser();
        },
        'CreateComplaint' :(context) {
          return CreateComplaint();
        },
         'updatestatus' :(context) {
          return updatestatus();
        },
      },
      
     
      
    );
  }
}

