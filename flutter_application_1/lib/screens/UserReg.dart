import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const UserReg());

class UserReg extends StatefulWidget {
  const UserReg({super.key});

  @override
  State<UserReg> createState() => _UserRegState();
}

class _UserRegState extends State<UserReg> {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'User Registration';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class. This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _mobile = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _guardianName = TextEditingController();
  final TextEditingController _guardianMobile = TextEditingController();

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter your name',
                  labelText: 'Name',
                ),
              ),
              TextFormField(
                controller: _username,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter your username',
                  labelText: 'username',
                ),
              ),
              TextFormField(
                controller: _password,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.password),
                  hintText: 'Enter your password',
                  labelText: 'password',
                ),
              ),
              TextFormField(
                controller: _mobile,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone_android),
                  hintText: 'Enter your mobile',
                  labelText: 'mobile',
                ),
              ),
              TextFormField(
                controller: _address,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.location_city),
                  hintText: 'Enter your Address',
                  labelText: 'Address',
                ),
              ),
              TextFormField(
                controller: _city,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.location_city),
                  hintText: 'Enter your City',
                  labelText: 'City',
                ),
              ),
              TextFormField(
                controller: _guardianName,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.location_city),
                  hintText: 'Enter your guardian_name',
                  labelText: 'Guardian_name',
                ),
              ),
              TextFormField(
                controller: _guardianMobile,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.location_city),
                  hintText: 'Enter your guardian mobile number',
                  labelText: 'guardian_mobile',
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: ElevatedButton(
                    child: const Text('Submit'),
                    onPressed: () {
                      submitFormData();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void submitFormData() {
    if (_formKey.currentState!.validate()) {
      String url = 'http://localhost:8080/signup';
      Map<String, dynamic> requestBody = {
        "name": _name.text,
        "username": _username.text,
        "password": _password.text,
        "mobile": _mobile.text,
        "address": _address.text,
        "city": _city.text,
        "guardian_name": _guardianName.text,
        "guardian_mobile": _guardianMobile.text
      };
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = jsonEncode(requestBody);
      http
          .post(Uri.parse(url), headers: headers, body: body).timeout(Duration(seconds: 10))
          .then((response) {
        // Handle the response
        log(response.statusCode.toString());
        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Registered Successfully')));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Something went wrong')));
        }
      }).catchError((error) {
        // Handle any errors that occurred during the HTTP request
        log(error.toString());
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Something went wrong')));
      });
    }
  }
}
