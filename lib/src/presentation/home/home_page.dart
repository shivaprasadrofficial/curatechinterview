import 'package:flutter/material.dart';
import 'package:cura_tech/src/presentation/cart/widgets/cart_drawer.dart';
import 'package:cura_tech/src/presentation/home/my_app_bar.dart';
import 'package:cura_tech/src/presentation/products/widgets/product_list.dart';

class HomePage extends StatelessWidget {
  final String searchTerm = 'Drugs';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: <Widget>[
                    Text('Drugs List',
                        style: Theme.of(context).textTheme.title),
                  ],
                )),
            Expanded(
              child: ProductList(),
            )
          ],
        ),
      ),
      endDrawer: CartDrawer(),
    );
  }
}
