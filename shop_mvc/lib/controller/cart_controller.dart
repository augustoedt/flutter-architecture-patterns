import 'package:shop_mvc/model/cartItem.dart';
import 'package:shop_mvc/model/product.dart';

class CartController {

  List<CartItem> _cartProducts = [];

  void addProduct(Product product) {
    int index = _cartProducts.indexWhere(
            (item) => item.isEqual(product));
    _cartProducts[index].add();
  }

  void removeProduct(Product product) {
    int index = _cartProducts.indexWhere(
            (item) => item.isEqual(product));
    _cartProducts[index].remove();
  }

  int productCounter() {
    int total = 0;
    _cartProducts.forEach((e)=>total+=e.total);
    return total;
  }

}