import 'package:flutter/material.dart';  
  
void main() => runApp(updatestatus());  
  
class updatestatus extends StatelessWidget {  
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
              icon: const Icon(Icons.input_rounded),  
              hintText: 'complaint id',  
              labelText: 'complaint id',  
            ),  
          ),  
          TextFormField(  
            decoration: const InputDecoration(  
              icon: const Icon(Icons.query_stats_rounded),  
              hintText: 'Enter status',  
              labelText: 'status',  
            ),  
          ),  
           
          new Container(  
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),  
              child: new ElevatedButton(  
                child: const Text('Update'),  
                  onPressed: (){ Navigator.of(context).pushNamed('Homescreen'); } ,  
              )),  
        ],  
      ),  
    );  
  }  
}  