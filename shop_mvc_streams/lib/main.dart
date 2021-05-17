import 'package:flutter/material.dart';

import 'controller/cart_controller.dart';
import 'controller/shop_controller.dart';
import 'inherited_provider.dart';
import 'ui/shop/shop_page.dart';

void main() {
  runApp(ShopApp());
}

class ShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InheritedProvider(
      controllers:[
        CartController(),
        ShopController()
      ],
      child: MaterialApp(
        title: 'Shop Page',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        debugShowCheckedModeBanner: false,
        home: ShopPage(),
      ),
    );
  }
}
