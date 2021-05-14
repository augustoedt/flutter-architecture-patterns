import 'package:flutter/material.dart';
import 'package:shop_mvc_valuenotifier/controller/cart_controller.dart';
import 'package:shop_mvc_valuenotifier/controller/shop_controller.dart';
import 'package:shop_mvc_valuenotifier/model/category.dart';
import 'package:shop_mvc_valuenotifier/ui/cart/cart_page.dart';
import 'package:shop_mvc_valuenotifier/ui/widgets/counter_buttom.dart';
import 'package:shop_mvc_valuenotifier/ui/widgets/defaut_page_layout.dart';
import '../../inherited_provider.dart';
import '../widgets/drowpdown_widget.dart';
import '../widgets/tile_product_item.dart';

class ShopPage extends StatelessWidget {
  Widget build(BuildContext context) {
    final shopController = context.fetch<ShopController>();
    final cartController = context.fetch<CartController>();
    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          automaticallyImplyLeading: false,
          title: Text('Fashion Shop'),
          actions: [
            ValueListenableBuilder<int>(
              valueListenable: cartController.cartLength,
              builder: (_,int listenableValue, __) {
                return CounterButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => CartPage()));
                    },
                    counter: listenableValue,
                    icon: const Icon(Icons.shopping_cart, color: Colors.white),
                    label:
                        Text('My cart', style: TextStyle(color: Colors.white)));
              },
            )
          ],
        ),
        body: DefaultPageLayout(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Dropdown<Category>(
                  items: Category.sampleData,
                  onSelected: (categoryFilter) {
                    shopController.sortProduct(filter: categoryFilter);
                  },
                ),
              ),
              SizedBox(height: 12),
              ValueListenableBuilder(
                  valueListenable: shopController.productsListNotifier,
                  builder: (_, listenableList, __) {
                    return Wrap(
                        children: List.generate(
                            listenableList.length,
                            (index) => TileProductItem(
                                product: listenableList[index],
                                onAddCart: (selectedProduct) {
                                  cartController.addProduct(selectedProduct);
                                })));
                  }),
            ],
          ),
        ));
  }
}
