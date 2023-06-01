import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginAdmin extends StatefulWidget {
  const LoginAdmin({super.key});

  @override
  State<LoginAdmin> createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {

  TextEditingController _emailTEC = TextEditingController();
  TextEditingController _passwordTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Women Security System'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            TextFormField(
              validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
              controller: _emailTEC,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'email',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
              controller: _passwordTEC,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
            ),
            ),
             ElevatedButton(child: Text('Login'), onPressed: (){
              var _email = _emailTEC.text;
              var _password = _passwordTEC.text;
              print(_email);
              print(_password);
              Navigator.of(context).pushNamed('AdminHome');}
      
      ),
            ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.access_alarm_rounded), label: Text('Forgot Password'),)
          ]),
        ),
      ),
    );
  }
}


  



