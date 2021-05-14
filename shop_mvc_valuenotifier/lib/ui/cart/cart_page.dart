import 'package:flutter/material.dart';
import 'package:shop_mvc_valuenotifier/controller/cart_controller.dart';
import 'package:shop_mvc_valuenotifier/inherited_provider.dart';
import 'package:shop_mvc_valuenotifier/model/cart_item.dart';
import 'package:shop_mvc_valuenotifier/ui/widgets/tile_cart_item.dart';
import 'package:shop_mvc_valuenotifier/ui/widgets/defaut_page_layout.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartController = context.fetch<CartController>();
    print('rebuild CartPage');
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: DefaultPageLayout(
          child: ValueListenableBuilder<List<CartItem>>(
            valueListenable: cartController.cartListNotifier,
            builder: (_, listenableList, __) {
              return Wrap(
                  direction: Axis.vertical,
                  children: listenableList.map((e) => TileCartItem(
                    item: e,
                    onRemove: cartController.removeProduct,
                  )).toList(),
                  // children: List.generate(
                  //     listenableList.length,
                  //     (index) => TileCartItem(
                  //         item: listenableList[index],
                  //         onRemove: (product) {
                  //           cartController.removeProduct(product);
                  //         }))
              );
            },
          ),
        ));
  }
}
