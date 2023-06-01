import 'package:flutter/material.dart';
class ViewUser extends StatelessWidget {
  const ViewUser({super.key});

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
              Text('Sno'),
              Text('Refid'),
               Text('Name'),
                Text('Address'),
                 Text('Mobile'),
                  Text('Email'),
                   Text('Complaint'),
                    Text('Location'),
                     
            ]),
            TableRow(children: [
               Text('1'),
              Text('001'),
               Text('Gopika'),
                Text('Cherppulassery'),
                 Text('8157892554'),
                  Text('gopika@gmail.com'),
                   Text('harrassement through message'),
                     Text('Kuttikode'),
                      
            ]),
            
          ],
        ),
      ),
      
             
    
              ),);
  }
}