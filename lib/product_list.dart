import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
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
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            child: Container(
                              height: 150,
                              width: 150,
                              color: Colors.black,
                              child: Column(
                                children: [
                                  Container(
                                    height: 120,
                                    width: 130,
                                    decoration: const BoxDecoration(
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
