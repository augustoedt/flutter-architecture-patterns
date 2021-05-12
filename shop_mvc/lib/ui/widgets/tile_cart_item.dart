import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_mvc/model/cart_item.dart';
import 'package:shop_mvc/model/product.dart';

class TileCartItem extends StatelessWidget {
  final CartItem item;
  final ValueChanged<Product> onRemove;

  const TileCartItem({Key key, this.item, this.onRemove}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 100,
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
            ElevatedButton(
                onPressed: () {
                  onRemove(item.product);
                },
                child: Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
