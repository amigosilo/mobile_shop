import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  String _name = "";
  String _email = "";
  String _contactNo = "";
  String _password = "";
  // final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              'assets/images/bg.png',
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      // Space for formatting
                      height: 300,
                    ),
                    const Text(
                      'Sign-up',
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Times New Roman'),
                    ),
                    const SizedBox(width: 20, height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.black12,
                          child: IconButton(
                            // Button for adding profile picture (function not implemented)
                            color: Colors.grey,
                            onPressed: () {}, // Placeholder function

                            icon: const Icon(
                              Icons.camera_alt,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20, height: 20),
                    const Text('Name',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        )),
                    TextField(
                      // Input field for name
                      onChanged: (text) {
                        _name = text;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Your Name',
                      ),
                    ),
                    const Text('Email',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        )),
                    TextField(
                      // Input field for email
                      onChanged: (text) {
                        _email = text;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Your Email',
                      ),
                    ),
                    const Text('Contact No.',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        )),
                    TextField(
                      // Input field for contact number
                      onChanged: (text) {
                        _contactNo = text;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Your Contact Number',
                      ),
                    ),
                    const Text('Password',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        )),
                    TextField(
                      // Input field for password
                      onChanged: (text) {
                        _password = text;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(width: 20, height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50.0,
                          width: 300,
                          child: RaisedButton(
                              // Button to sign-up
                              onPressed: () async {
                                try {
                                  var newUser = await _auth
                                      .createUserWithEmailAndPassword(
                                          email: _email, password: _password);
                                  if (newUser != null) {
                                    print('user has been created');
                                    Navigator.pushNamed(context, '/');
                                  } else {
                                    print('Unsuccessful');
                                  }
                                } on Exception catch (e) {
                                  print(e);
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0)),
                              child: const Text('Sign-up',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white)),
                              color: Colors.black),
                        ),
                      ],
                    ),
                    TextButton(
                      // Button to cancel sign-up and return to Screen 1
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: const Text('Back to Login',
                          style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
