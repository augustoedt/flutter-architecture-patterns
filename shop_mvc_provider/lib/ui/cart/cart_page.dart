import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_mvc_provider/controller/cart_controller.dart';
import 'package:shop_mvc_provider/ui/widgets/defaut_page_layout.dart';
import 'package:shop_mvc_provider/ui/widgets/tile_cart_item.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: DefaultPageLayout(
          child: Consumer<CartController>(
            builder: (_, controller, __) => Column(
                children: controller.viewCartItems
                    .map((e) => TileCartItem(
                        item: e,
                        onRemove: (product) {
                              controller.removeProduct(product);
                        }))
                    .toList()),
          ),
        ));
  }
}
