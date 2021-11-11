import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Error extends StatefulWidget {
  const Error({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Error> createState() => _ErrorState();
}

class _ErrorState extends State<Error> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}