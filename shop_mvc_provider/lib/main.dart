import 'package:flutter/material.dart';
import 'package:shop_mvc_provider/di_provider.dart';
import 'ui/shop/shop_page.dart';

void main() {
  runApp(ShopApp());
}

class ShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DiProvider(
      child: MaterialApp(
        title: 'Shop Page',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        debugShowCheckedModeBanner: false,
        home: ShopPage(),
      )
    );
  }
}
