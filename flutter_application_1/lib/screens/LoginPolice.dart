import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class LoginPolice extends StatefulWidget {
  const LoginPolice({super.key});

  @override
  State<LoginPolice> createState() => _LoginPoliceState();
}

class _LoginPoliceState extends State<LoginPolice> {
  TextEditingController _pemailTEC = TextEditingController();
  TextEditingController _ppasswordTEC = TextEditingController();
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
              controller: _pemailTEC,
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return 'Please enter username';

                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Username',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _ppasswordTEC,
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return 'Please enter password';

                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
            ),
            ),
             ElevatedButton(onPressed: (){
              var _pemail = _pemailTEC.text;
              var _ppassword = _ppasswordTEC.text;
              print(_pemail);
              print(_ppassword);
              String url = 'http://localhost:8080/policelogin';
                   Map<String, dynamic> requestBody = {
                     "email": _pemailTEC.text,
                     "password": _ppasswordTEC.text,
                   };

                   http.post(Uri.parse(url), body: requestBody).then((response) {
                  //   // Handle the response
                     print(response.statusCode);
                     print(response.body);
                     if(response.statusCode == 200){
                        Navigator.of(context).pushNamed('PoliceHome');}
                   }).catchError((error) {
                     // Handle any errors that occurred during the HTTP request
                     print("error");
                     print(error);
                   });
      }, 
      child: Text('Login'),),
            ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.access_alarm_rounded), label: Text('Forgot Password'),)
          ]),
        ),
      ),
    );
  }
}

