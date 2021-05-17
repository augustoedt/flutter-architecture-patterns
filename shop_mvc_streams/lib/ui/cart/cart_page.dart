import 'package:flutter/material.dart';
import 'package:shop_mvc_streams/controller/cart_controller.dart';
import 'package:shop_mvc_streams/inherited_provider.dart';
import 'package:shop_mvc_streams/model/cart_item.dart';
import 'package:shop_mvc_streams/ui/widgets/tile_cart_item.dart';
import 'package:shop_mvc_streams/ui/widgets/defaut_page_layout.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final controller = context.fetch<CartController>();

    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: DefaultPageLayout(
          child: StreamBuilder<List<CartItem>>(
            initialData: controller.viewLastCartItem,
            stream: controller.cartListStream,
            builder: (context, AsyncSnapshot<List<CartItem>> snapshot) {
              if(snapshot.hasData){
                return Column(
                    children: snapshot.data
                        .map((e) => TileCartItem(item: e, onRemove: (product){
                      controller.removeProduct(product);
                      setState(() {});
                    }))
                        .toList());
              }
              return SizedBox.shrink();
            }
          ),
        ));
  }
}
