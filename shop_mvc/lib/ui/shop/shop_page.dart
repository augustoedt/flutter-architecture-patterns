import 'package:flutter/material.dart';
import 'package:shop_mvc/controller/shop_controller.dart';
import 'package:shop_mvc/model/category.dart';
import 'package:shop_mvc/ui/cart/cart_page.dart';
import 'package:shop_mvc/ui/widgets/counter_buttom.dart';
import 'package:shop_mvc/ui/widgets/defaut_page_layout.dart';
import '../../inherited_provider.dart';
import '../widgets/drowpdown_widget.dart';
import '../widgets/product_item.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    final controller = context.fetch<ShopController>();
    final viewProducts = controller.viewProducts;

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
                counter: controller.cartCounter(),
                icon: const Icon(Icons.shopping_cart, color: Colors.white),
                label: Text('My cart', style: TextStyle(color: Colors.white)))
          ],
        ),
        body: DefaultPageLayout(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Dropdown<MyCategory>(
                  items: MyCategory.sampleData,
                  onSelected: (categoryFilter) {
                    controller.sortProduct(filter: categoryFilter);
                    setState(() {});
                  },
                ),
              ),
              SizedBox(height: 12),
              Wrap(
                children: List.generate(
                    controller.products.length,
                    (index) => AnimatedSwitcher(
                          duration: const Duration(milliseconds: 600),
                          transitionBuilder: (child, animation) =>
                              ScaleTransition(scale: animation, child: child),
                          child: ProductItem(
                            key: ValueKey<String>(viewProducts[index].name),
                            product: viewProducts[index],
                            onPressed: () {
                              controller.addCart(viewProducts[index]);
                              setState(() {});
                            },
                          ),
                        )),
              ),
            ],
          ),
        ));
  }
}
