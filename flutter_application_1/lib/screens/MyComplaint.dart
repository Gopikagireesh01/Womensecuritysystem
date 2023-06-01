import 'package:flutter/material.dart';
class MyComplaint extends StatelessWidget {
  const MyComplaint({super.key});

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
              Text('Complaintid'),
               Text('Status'),
                Text('Date'),      
            ]),
            TableRow(children: [
              Text('001'),
               Text('Under Investigation'),
                Text('08/06/2023'),
                      
            ]),
            
          ],
        ),
      ),
      
             
    
              ),);
  }
}