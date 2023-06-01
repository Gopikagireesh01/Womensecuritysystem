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
      home: PoliceHome(),
      
    );
  }
}


class PoliceHome extends StatelessWidget {
  const PoliceHome({super.key});

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
        Navigator.of(context).pushNamed('AllComp');
        
      }, child: Text('All Complaints'),),

      ElevatedButton(onPressed: (){
        Navigator.of(context).pushNamed('updatestatus');
        
      }, child: Text('updatestatus'),),
      
      
      
      
      ]),),
    );
  }
}