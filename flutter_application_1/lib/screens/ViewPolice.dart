import 'package:flutter/material.dart';
class ViewPolice extends StatelessWidget {
  const ViewPolice({super.key});

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
              Text('Division'),
              Text('Mobile'),
              Text('Rank'),
            ]),
            TableRow(children: [
              Text('Madhav'),
              Text('Cherppulassery'),
              Text('84567344522'),
              Text('SI')
            ]),
             
          ],
        ),

      ),
      
             
    
              ),);
  }
}