import 'package:flutter/material.dart';
class AllComp extends StatelessWidget {
  const AllComp({super.key});

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
                  Text('Division'),
                   Text('Complaint'),
                    Text('Details'),
                     Text('category'),
                      Text('raised date'),
                       Text('status'),
                        Text('closed date'),
                         Text('comments'),
            ]),
            TableRow(children: [
               Text('1'),
              Text('001'),
               Text('Gopika'),
                Text('Cherppulassery'),
                 Text('8157892554'),
                  Text('cpy'),
                   Text('Harrassement through messages'),
                    Text('harrassing very much'),
                     Text('social media'),
                      Text('5/1/2023'),
                       Text('closed'),
                        Text('10/2/2023'),
                         Text('Be careful while using internet'),
            ]),
            
          ],
        ),
      ),
      
             
    
              ),);
  }
}