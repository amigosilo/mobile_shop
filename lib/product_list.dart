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
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 20.0),
                                height: 200,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                    children: <Widget>[
                                      Container(width: 160.0,
                                      child:Card(
                                        child:Wrap(
                                          children: <Widget>[
                                            Image.network("https://www.google.com/imgres?imgurl=https%3A%2F%2Fmiro.medium.com%2Fmax%2F1200%2F1*mk1-6aYaf_Bes1E3Imhc0A.jpeg&imgrefurl=https%3A%2F%2Ftowardsdatascience.com%2F3-numpy-image-transformations-on-baby-yoda-c27c1409b411&tbnid=gOUAFhrbQ2nYQM&vet=12ahUKEwjGsJ_U5930AhUUgMYKHR-EBKsQMygQegUIARDqAQ..i&docid=OXvyXJop1qSGqM&w=1200&h=900&itg=1&q=image&ved=2ahUKEwjGsJ_U5930AhUUgMYKHR-EBKsQMygQegUIARDqAQ"),
                                            ListTile(
                                              title: Text("Heading1"),
                                              subtitle: Text("Subheading1"),
                                            )
                                          ],
                                        ),
                                ),
                                      )
                                    ],

                                ),

                              ), //First card





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
