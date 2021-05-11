import 'package:flutter/material.dart';
import 'package:shop_mvc/model/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final VoidCallback onPressed;

  const ProductItem({Key key, this.product, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 160,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  "R\$ ${product.price}",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: onPressed, child: Text('Add cart'))
            ],
          ),
        ),
      ),
    );
  }
}
