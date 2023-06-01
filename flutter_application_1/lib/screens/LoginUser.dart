import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class LoginUser extends StatefulWidget {
  const LoginUser({super.key});

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  TextEditingController _uemailTEC = TextEditingController();
  TextEditingController _upasswordTEC = TextEditingController();
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
              controller: _uemailTEC,
              validator: (value) {
                if(value == null || value.isEmpty ) {
                  return 'Please enter email';

                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'email',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _upasswordTEC,
              validator: (value) {
                if(value == null || value.isEmpty ) {
                  return 'Please enter password';

                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
            ),
            ),
            ElevatedButton.icon(onPressed: (){
              var _uemail = _uemailTEC.text;
              var _upassword = _upasswordTEC.text;
              //print(_uemail);
              //print(_upassword);
              Navigator.of(context).pushNamed('UserHome');
               String url = 'http://localhost:8080/login';
                   Map<String, dynamic> requestBody = {
                     "email": _uemailTEC.text,
                     "password": _upasswordTEC,
                   };

                   http.post(Uri.parse(url), body: requestBody).then((response) {
                  //   // Handle the response
                     print(response.statusCode);
                     print(response.body);
                     //if(response.statusCode == 200){
                        //Navigator.of(context).pushNamed('UserHome');
                        }
                   ).catchError((error) {
                     // Handle any errors that occurred during the HTTP request
                     print("error");
                     print(error);
                   });
                  

                     
            }, icon: Icon(Icons.check), label: Text('Login'),),
             ]),
        ),
      ),
    );
  }
}

            
         

