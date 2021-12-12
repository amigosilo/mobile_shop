import 'package:cloud_firestore/cloud_firestore.dart';
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
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
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
                                            color: Colors.white
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              StreamBuilder(
                                stream: FirebaseFirestore.instance.collection('product_list').snapshots(),
                                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (!snapshot.hasData) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }

                                  return Expanded(
                                    child: SizedBox(
                                      height: 200,
                                      child: ListView(
                                        children: snapshot.data!.docs.map((document) {
                                          return Center(
                                            child: Text(document['name']),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ]),
            ),
          ]),
        ),
      );
  }
}
