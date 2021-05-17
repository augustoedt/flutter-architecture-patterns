import 'package:flutter/material.dart';
import 'package:shop_mvc_streams/controller/cart_controller.dart';
import 'package:shop_mvc_streams/controller/shop_controller.dart';
import 'package:shop_mvc_streams/model/category.dart';
import 'package:shop_mvc_streams/model/product.dart';
import 'package:shop_mvc_streams/ui/cart/cart_page.dart';
import 'package:shop_mvc_streams/ui/widgets/counter_buttom.dart';
import 'package:shop_mvc_streams/ui/widgets/defaut_page_layout.dart';
import '../../inherited_provider.dart';
import '../widgets/drowpdown_widget.dart';
import '../widgets/tile_product_item.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {



  @override
  Widget build(BuildContext context) {
    final shopController = context.fetch<ShopController>();
    final cartController = context.fetch<CartController>();

    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          automaticallyImplyLeading: false,
          title: Text('Fashion Shop'),
          actions: [
            StreamBuilder<int>(
              initialData: 0,
              stream: cartController.cartCounter,
              builder: (context, AsyncSnapshot<int> snapshot) {
                int _counter = snapshot.data;
                if(snapshot.hasData){
                  return CounterButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => CartPage()));
                      },
                      counter: _counter,
                      icon: const Icon(Icons.shopping_cart, color: Colors.white),
                      label: Text('My cart', style: TextStyle(color: Colors.white)));
                }
                return SizedBox.shrink();
              }
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
              StreamBuilder<List<Product>>(
                initialData: Product.sampleData,
                stream: shopController.streamList,
                builder: (context, snapshot) {
                  List<Product> productList = snapshot.data;
                  if(snapshot.hasData){
                    return Wrap(
                      children: List.generate(
                          productList.length,
                              (index) => TileProductItem(
                            product: productList[index],
                            onAddCart: (selectedProduct) {
                              cartController.addProduct(selectedProduct);
                            },
                          )),
                    );
                  }
                  return SizedBox.shrink();
                }
              )
            ],
          ),
        ));
  }

}
