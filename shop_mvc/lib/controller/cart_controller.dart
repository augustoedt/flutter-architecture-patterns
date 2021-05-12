import 'package:shop_mvc/model/cart_item.dart';
import 'package:shop_mvc/model/product.dart';

class CartController {

  List<CartItem> _cartProducts = [];

  ///create CartItem
  void addProduct(Product product,{int qty=1}) {
    int index = _cartProducts.indexWhere(
            (item) => item.isEqual(product));
    if(index==-1) {
      _cartProducts.add(CartItem(product, total: qty));
      return;
    }
    _cartProducts.removeAt(index);
    _cartProducts.add(CartItem(product,total: qty));
  }

  void removeProduct(Product product) {
    _cartProducts.removeWhere((el) => el.isEqual(product));
  }

  void updateItem({Product product,int qty, int index}){
    if(index==null) {
      index = _cartProducts.indexWhere(
              (item) => item.isEqual(product));
    }
    _cartProducts[index].total = qty;
  }


  int productCounter() {
    int total = 0;
    if(_cartProducts.isNotEmpty) _cartProducts.forEach((e)=>total+=e.total);
    return total;
  }

  List<CartItem> get viewCartItems => _cartProducts;
}