import 'package:flutter/material.dart';  
  
void main() => runApp(AddGuardian());  
  
class AddGuardian extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    final appTitle = 'Guardian Details';  
    return MaterialApp(  
      title: appTitle,  
      home: Scaffold(  
        appBar: AppBar(
        title: const Text('Women Security System'),
      ),  
        
        body: MyCustomForm(),  
      ),  
    );  
  }  
}  
// Create a Form widget.  
class MyCustomForm extends StatefulWidget {  
  @override  
  MyCustomFormState createState() {  
    return MyCustomFormState();  
  }  
}  
// Create a corresponding State class. This class holds data related to the form.  
class MyCustomFormState extends State<MyCustomForm> {  
  // Create a global key that uniquely identifies the Form widget  
  // and allows validation of the form.  
  final _formKey = GlobalKey<FormState>();  
  
  @override  
  Widget build(BuildContext context) {  
    // Build a Form widget using the _formKey created above.  
    return Form(  
      key: _formKey,  
      child: Column(  
        crossAxisAlignment: CrossAxisAlignment.start,  
        children: <Widget>[  
          TextFormField(  
            decoration: const InputDecoration(  
              icon: const Icon(Icons.person),  
              hintText: 'Guardian Name',  
              labelText: 'Name',  
            ),  
          ),  
          TextFormField(  
            decoration: const InputDecoration(  
              icon: const Icon(Icons.phone),  
              hintText: 'Enter first phone number',  
              labelText: 'Phone1',  
            ),  
          ),  
          TextFormField(  
            decoration: const InputDecoration(  
            icon: const Icon(Icons.phone),  
            hintText: 'Enter second phone number',  
            labelText: 'Phone2',  
            ),  
           ), 
            TextFormField(  
            decoration: const InputDecoration(  
            icon: const Icon(Icons.email),  
            hintText: 'Enter email',  
            labelText: 'Email',  
            ),  
           ),
           
          new Container(  
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),  
              child: new ElevatedButton(  
                child: const Text('Submit'),  
                  onPressed: (){ Navigator.of(context).pushNamed('Homescreen'); } ,  
              )),  
        ],  
      ),  
    );  
  }  
}  