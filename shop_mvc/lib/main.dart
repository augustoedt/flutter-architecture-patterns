import 'package:flutter/material.dart';
import 'package:shop_mvc/controller/shop_controller.dart';
import 'package:shop_mvc/ui/shop/shop_page.dart';

import 'inherited_provider.dart';

void main() {
  runApp(ShopApp());
}

class ShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InheritedProvider(
      controllers:[
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
