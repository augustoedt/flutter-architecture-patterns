import 'package:flutter/material.dart';
import 'package:shop_mvc_provider/controller/cart_controller.dart';
import 'package:shop_mvc_provider/controller/shop_controller.dart';
import 'package:shop_mvc_provider/model/category.dart';
import 'package:shop_mvc_provider/model/product.dart';
import 'package:shop_mvc_provider/ui/cart/cart_page.dart';
import 'package:shop_mvc_provider/ui/widgets/counter_buttom.dart';
import 'package:shop_mvc_provider/ui/widgets/defaut_page_layout.dart';
import '../widgets/drowpdown_widget.dart';
import '../widgets/tile_product_item.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    final shopController = context.read<ShopController>();
    final cartController = context.read<CartController>();

    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          automaticallyImplyLeading: false,
          title: Text('Fashion Shop'),
          actions: [
            CounterButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => CartPage()));
                },
                icon: const Icon(Icons.shopping_cart, color: Colors.white),
                label: Text('My cart', style: TextStyle(color: Colors.white)))
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
              Consumer<List<Product>>(
                builder: (_,productView,child)=>Wrap(
                  children: List.generate(
                      productView.length,
                      (index) => TileProductItem(
                        product: productView[index],
                        onAddCart: (selectedProduct){
                          cartController.addProduct(selectedProduct);
                        },
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}
