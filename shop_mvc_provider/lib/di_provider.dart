import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/cart_controller.dart';
import 'controller/shop_controller.dart';
import 'model/product.dart';

class DiProvider extends StatelessWidget {

  final child;

  const DiProvider({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartController>(create: (_) => CartController()),
        ChangeNotifierProvider<ShopController>(create: (_) => ShopController()),
        ProxyProvider<ShopController, List<Product>>(
            update: (_, shopController, __) => shopController.viewProducts),
      ],
      child: child
    );
  }
}
