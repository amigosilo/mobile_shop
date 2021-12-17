import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/rendering.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ProductList> createState() => _ProductListState();
}


class _ProductListState extends State<ProductList> {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

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
                children:[
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                            child: Column(
                                              children: [
                                                Image.asset(document['img_path'],
                                                  height: 200,
                                                  width: 200,
                                                  fit:  BoxFit.fitWidth,
                                                ),
                                                TextButton(
                                                  child: Text(
                                                      document['name'],
                                                      style: TextStyle(fontSize: 19)
                                                  ),
                                                  style: ButtonStyle(
                                                      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(13)),
                                                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(18.6),
                                                          )
                                                      )
                                                  ),
                                                  onPressed: () {
                                                    // prefs.setString('product_id', document['id']);
                                                    Navigator.pushNamed(context, '/product_info');
                                                  },
                                                ),
                                              ],
                                            ),
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
