import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class AddDiv extends StatefulWidget {
  const AddDiv({super.key});

  @override
  State<AddDiv> createState() => _AddDivState();
}

class _AddDivState extends State<AddDiv> {
  TextEditingController _divTEC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Women Security System'),
      ),
      body: SafeArea(
        child: ListView(
  padding: const EdgeInsets.all(8),
  children: <Widget>[
    Container(
      height: 50,
      color: Colors.blue,
      child: const Center(child: Text('Ottappalam')),
    ),
    Container(
      height: 50,
      color: Colors.blue,
      child: const Center(child: Text('Cherppulassery')),
    ),
    Container(
      height: 50,
      color: Colors.blue,
      child: const Center(child: Text('Perinthalmanna')),
    ),
     TextFormField( 
            controller: _divTEC, 
            decoration: const InputDecoration(  
            icon: const Icon(Icons.local_police),  
            hintText: 'Enter Division',  
            labelText: 'division',  
            ),  
           ),
           
          new Container(  
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),  
              child: new ElevatedButton(  
                child: const Text('Add'),  
                  onPressed: (){
                    var _div = _divTEC.text;
                    print(_div); 
                     Navigator.of(context).pushNamed('Homescreen'); 
                     http://localhost:8080/adddivision?division=TVM
                      String url = ' http://localhost:8080/adddivision?division=_div';
                       Map<String, dynamic> requestBody = {
                     "division" : _div,
                   };
                   http.post(Uri.parse(url), body: requestBody).then((response) {
                     // Handle the response
                     print(response.statusCode);
                     print(response.body);
                   }).catchError((error) {
                     // Handle any errors that occurred during the HTTP request
                     print(error);
                   });
                    } 
              ),
               
              ),  
  ],
)
        
        ),
        );
}
}