import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/SOSbutton.dart';
import 'package:flutter_application_1/screens/sosbutton.dart';

void main() => runApp(const sosbutton());

class sosbutton extends StatelessWidget {
  const sosbutton({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatelessWidget(),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Ink(
          decoration: const ShapeDecoration(
            color: Colors.lightBlue,
            shape: CircleBorder(),
          ),
          child: IconButton(
            icon: const Icon(Icons.sos_rounded),
            color: Colors.white,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
