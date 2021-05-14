import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_mvc_valuenotifier/model/cart_item.dart';
import 'package:shop_mvc_valuenotifier/model/product.dart';

class TileCartItem extends StatelessWidget {
  final CartItem item;
  final ValueChanged<Product> onRemove;

  const TileCartItem({Key key, this.item, this.onRemove}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Text(item.product.name),
                SizedBox(width: 15),
                Text('Qty: ${item.total}'),
                TextButton(
                    onPressed: () {
                      onRemove(item.product);
                    },
                    child: Text("remove"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
