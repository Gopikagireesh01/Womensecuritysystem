import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
      home: UserHome(),
      
    );
  }
}


class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Women Security System'),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(children:  [Text('Women Security System', style: TextStyle(
        color: Colors.blue,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),),
      ElevatedButton(onPressed: (){
        Navigator.of(context).pushNamed('ViewPolice');
        
      }, child: Text('Search Police'),),
      SizedBox(
        height: 30,
      ),
      
      ElevatedButton(onPressed: (){
        Navigator.of(context).pushNamed('AddGuardian');
          
      }, child: Text('Add Guardian'),),
      SizedBox(
        height: 30,
      ),

      ElevatedButton(onPressed: (){
        Navigator.of(context).pushNamed('ViewGuardian');
        },
       child: Text('View Guardian'),),
       SizedBox(
        height: 30,
      ),

      ElevatedButton(onPressed: (){
        Navigator.of(context).pushNamed('SOSButton');
      }, child: Text('Emergency'),),
      SizedBox(
        height: 30,
      ),
       ElevatedButton(onPressed: (){
        Navigator.of(context).pushNamed('CreateComplaint');
      }, child: Text('Create Complaint'),),
      SizedBox(
        height: 30,
      ),
       ElevatedButton(onPressed: (){
        Navigator.of(context).pushNamed('MyComplaint');
      }, child: Text('My Complaint'),),
      SizedBox(
        height: 30,
      ),
       ElevatedButton(onPressed: (){
        Navigator.of(context).pushNamed('UpdatePrpfile');
      }, child: Text('My profile'),),
      
      
      
      ]),),
    );
  }
}