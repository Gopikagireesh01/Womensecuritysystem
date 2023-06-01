import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp( Addcategory());
class Addcategory extends StatefulWidget {
  //const Addcategory({super.key});

  @override
  State<Addcategory> createState() => _AddcategoryState();
}

class _AddcategoryState extends State<Addcategory> {
  TextEditingController _categoryTEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
      child: const Center(child: Text('Social Media')),
    ),
    Container(
      height: 50,
      color: Colors.blue,
      child: const Center(child: Text('Work Space')),
    ),
    Container(
      height: 50,
      color: Colors.blue,
      child: const Center(child: Text('Journey')),
    ),
     TextFormField(
            controller: _categoryTEC,  
            decoration: const InputDecoration(  
            icon: const Icon(Icons.email),  
            hintText: 'Enter category',  
            labelText: 'category',  
            ),  
           ),
           
          new Container(  
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),  
              child: new ElevatedButton(  
                child: const Text('Submit'),  
                  onPressed: (){
                    var _category = _categoryTEC.text;
                    print(_category);
                       String url = ' http://localhost:8080/addcategory?category=_category';
                   Map<String, dynamic> requestBody = {
                     "category" : _category,
                   };
                   http.post(Uri.parse(url), body: requestBody).then((response) {
                     // Handle the response
                     print(response.statusCode);
                     print(response.body);
                   }).catchError((error) {
                     // Handle any errors that occurred during the HTTP request
                     print(error);
                   });
                  },  
              )
             
             
              ),  
  ],
)

        
        ),
        );
}
}

   
    
  
