import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'screen2.dart';
import 'screen3.dart';
import 'cart.dart';
import 'error.dart';
import 'product_info.dart';
import 'product_list.dart';
import 'transaction_history.dart';
import 'user_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Screen 1'),
        '/product_list': (context) => const ProductList(title: 'Product List'),
        '/screen2': (context) => const Screen2(title: 'Screen 2'),
        '/screen3': (context) => const Screen3(title: 'Screen 3'),
        '/product_info': (context) => const ProductInfo(title: 'Product Info'),
        '/transaction_history': (context) => const TransactionHistory(title: 'Transaction History'),
        '/user_page': (context) => const UserPage(title: 'User Page'),
        '/cart': (context) => const Cart(title: 'Cart'),
        '/error': (context) => const ProductList(title: 'Error'),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _email = "";
  String _password = "";
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
                      'Log-in',
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Times New Roman'),
                    ),
                    const SizedBox(width: 20, height: 20),
                    const Text('E-mail',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                    TextField(
                      onChanged: (text) {
                        _email = text;
                      },
                      // Input field for name
                      decoration: const InputDecoration(
                        hintText: 'Enter your e-mail address',
                        hintStyle: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20, height: 20),
                    const Text('Password',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                    TextField(
                      // Input field for password
                      onChanged: (text) {
                        _password = text;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      obscureText: true,
                    ),
                    Row(
                      // Row for buttons
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/screen3');
                          },
                          child: const Text('Forget password?',
                              style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.black,
                              )
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50.0,
                          width: 300,
                          child: RaisedButton(
                            onPressed: () async {

                                try {

                                  final _newuser = await _auth.signInWithEmailAndPassword(email:_email,password: _password);

                                  if (_newuser!= null)
                                  {
                                    Navigator.pushNamed(context, '/product_list');
                                  }
                                }
                                catch (e) {
                                  print(e);
                                }
                            },



                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0)),
                              child: const Text('Log-in',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                  )
                              ),
                              color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/screen2');
                            },
                            child: const Text('Sign up'),
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                            )
                        ),
                      ],
                    )
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
