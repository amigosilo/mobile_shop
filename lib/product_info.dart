import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/product_list.dart';

class ProductInfo extends StatefulWidget {
  const ProductInfo({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {

  @override
  Widget build(BuildContext context) {
    final doc = ModalRoute.of(context)!.settings.arguments as Doc;

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
                  Image.asset(doc.imgPath),
                  Text(doc.name),
                  Text(doc.description),
                  Text(doc.price.toString()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}