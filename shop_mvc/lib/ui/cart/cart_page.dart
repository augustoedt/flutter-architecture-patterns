import 'package:flutter/material.dart';
import 'package:shop_mvc/controller/cart_controller.dart';
import 'package:shop_mvc/inherited_provider.dart';
import 'package:shop_mvc/ui/widgets/defaut_page_layout.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = InheritedProvider.of<CartController>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: DefaultPageLayout(
          child: Column(
              children: controller.viewCartItems
                  .map((e) => ListTile(title: Text(e.product.name)))
                  .toList()),
        ));
  }
}
