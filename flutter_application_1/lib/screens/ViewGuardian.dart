import 'package:flutter/material.dart';
class ViewGuardian extends StatelessWidget {
  const ViewGuardian({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Women Security System'),
      ),
      body: SafeArea(
        child:
Container(
        color: Colors.white,
        padding: EdgeInsets.all(20.0),
        child: Table(
          border: TableBorder.all(color: Colors.black),
          children: [
            TableRow(children: [
              Text('Name'),
              Text('Gireesh V N'),
            ]),
            TableRow(children: [
              Text('phone'),
              Text('9544572589'),
            ]),
             TableRow(children: [
              Text('Email'),
              Text('gireeshvn@gmail.com'),
            ]),
          ],
        ),
      ),
      
             
    
              ),);
  }
}