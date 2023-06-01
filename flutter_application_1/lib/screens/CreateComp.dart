import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const CreateComplaint());

class CreateComplaint extends StatefulWidget {
  const CreateComplaint({super.key});

  @override
  State<CreateComplaint> createState() => _CreateCompState();
}

class _CreateCompState extends State<CreateComplaint> {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Complaint Registration';
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
  final TextEditingController _date = TextEditingController();
  final TextEditingController _division = TextEditingController();
  final TextEditingController _category = TextEditingController();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _mobile = TextEditingController();

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
                controller: _date,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter the date',
                  labelText: 'Date',
                ),
              ),
              TextFormField(
                controller: _division,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter your division',
                  labelText: 'division',
                ),
              ),
              TextFormField(
                controller: _category,
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
                  hintText: 'Enter the category',
                  labelText: 'category',
                ),
              ),
              TextFormField(
                controller: _title,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone_android),
                  hintText: 'Enter title',
                  labelText: 'Title',
                ),
              ),
              TextFormField(
                controller: _description,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.location_city),
                  hintText: 'Description',
                  labelText: 'Description',
                ),
              ),
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
                controller: _address,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.location_city),
                  hintText: 'Enter your address',
                  labelText: 'Address',
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
                  icon: Icon(Icons.phone),
                  hintText: 'Enter your  mobile number',
                  labelText: 'mobile',
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
      String url = 'http://10.4.6.44:8080/registercomplaint';
      Map<String, dynamic> requestBody = {
        "date": _date.text,
        "division": _division.text,
        "category": _category.text,
        "title": _title.text,
        "description": _description.text,
        "name": _name.text,
        "address": _address.text,
        "mobile": _mobile.text
      };
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = jsonEncode(requestBody);
      http
          .post(Uri.parse(url), headers: headers, body: body)
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
