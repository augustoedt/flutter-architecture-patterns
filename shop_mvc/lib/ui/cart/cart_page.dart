import 'package:flutter/material.dart';
import 'package:shop_mvc/controller/cart_controller.dart';
import 'package:shop_mvc/inherited_provider.dart';
import 'package:shop_mvc/ui/widgets/cart_item_tile.dart';
import 'package:shop_mvc/ui/widgets/defaut_page_layout.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
                  .map((e) => CartItemTile(item: e, onRemove: (product){
                    controller.removeProduct(product);
                    setState(() {});
              }))
                  .toList()),
        ));
  }
}
