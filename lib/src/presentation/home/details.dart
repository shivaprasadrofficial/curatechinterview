import 'package:flutter/material.dart';
import 'package:cura_tech/src/presentation/products/widgets/product_list.dart';
import 'package:cura_tech/src/presentation/cart/widgets/cart_drawer.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(36),
                child: Row(
                  children: <Widget>[
                    Text('Drug Details',
                        style: Theme.of(context).textTheme.title),
                  ],
                )),
          ],
        ),
      ),
      endDrawer: CartDrawer(),
    );
  }
}
