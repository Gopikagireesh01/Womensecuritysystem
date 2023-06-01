import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(Addpolice());

class Addpolice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Women Security System';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
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
  TextEditingController _name = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _refid = TextEditingController();
  TextEditingController _designation = TextEditingController();
  TextEditingController _division = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _pincode = TextEditingController();
  TextEditingController _district = TextEditingController();
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }

              return null;
            },
            controller: _name,
            decoration: const InputDecoration(
              icon: const Icon(Icons.person),
              hintText: 'Name',
              labelText: 'Name',
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }

              return null;
            },
            controller: _username,
            decoration: const InputDecoration(
              icon: const Icon(Icons.phone),
              hintText: 'username',
              labelText: 'username',
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }

              return null;
            },
            controller: _password,
            decoration: const InputDecoration(
              icon: const Icon(Icons.email),
              hintText: 'password',
              labelText: 'password',
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }

              return null;
            },
            controller: _mobile,
            decoration: const InputDecoration(
              icon: const Icon(Icons.password),
              hintText: 'Mobile',
              labelText: 'Mobile',
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }

              return null;
            },
            controller: _refid,
            decoration: const InputDecoration(
              icon: const Icon(Icons.location_city),
              hintText: 'Ref ID',
              labelText: 'RefId',
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }

              return null;
            },
            controller: _designation,
            decoration: const InputDecoration(
              icon: const Icon(Icons.local_police),
              hintText: 'Designation',
              labelText: 'Designation',
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }

              return null;
            },
            controller: _division,
            decoration: const InputDecoration(
              icon: const Icon(Icons.local_police),
              hintText: 'Division',
              labelText: 'Division',
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }

              return null;
            },
            controller: _address,
            decoration: const InputDecoration(
              icon: const Icon(Icons.local_police),
              hintText: 'Address',
              labelText: 'Address',
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }

              return null;
            },
            controller: _pincode,
            decoration: const InputDecoration(
              icon: const Icon(Icons.local_police),
              hintText: 'Pincode',
              labelText: 'Pincode',
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }

              return null;
            },
            controller: _district,
            decoration: const InputDecoration(
              icon: const Icon(Icons.local_police),
              hintText: 'District',
              labelText: 'District',
            ),
          ),

          new Container(
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),
              child: ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Registered Successfully')));
                  var _Name = _name.text;
                  var _Username = _username.text;
                  var _Password = _password.text;
                  var _Mobile = _mobile.text;
                  var _Refid = _refid.text;
                  var _Division = _division.text;
                  var _Designation = _designation.text;
                  var _Address = _address.text;
                  var _Pincode = _pincode.text;
                  var _District = _district.text;
                  print(_Name);
                  print(_Username);
                  print(_Password);
                  print(_Mobile);
                  print(_Refid);
                  print(_Division);
                  print(_Designation);
                  print(_Address);
                  print(_Pincode);
                  print(_District);
                   String url = 'http://localhost:8080/signuppolice';
                   Map<String, dynamic> requestBody = {
                   "name": _Name,
                  "username": _Username,
                  "password": _Password,
                  "mobile": _Mobile,
                  "reference_id":_Refid,
                  "type": _Designation,
                 "division": _Division,
                  "address": _Address,
                   "pincode": _Pincode,
                   "District": _District
                   };

                  http.post(Uri.parse(url), body: requestBody).then((response) {
                   //Handle the response
                     print(response.statusCode);
                     print(response.body);
                   }).catchError((error) {
                   //Handle any errors that occurred during the HTTP request
                     print(error);
                   });
                  }
                },
              )),
        ],
      ),
    );
  }
}
