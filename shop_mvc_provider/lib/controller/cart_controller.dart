
import 'package:flutter/cupertino.dart';
import 'package:shop_mvc_provider/model/cart_item.dart';
import 'package:shop_mvc_provider/model/product.dart';

class CartController with ChangeNotifier {

  List<CartItem> _cartProducts = [];

  ///create CartItem
  void addProduct(Product product,{int qty=1}) {
    int index = _cartProducts.indexWhere(
            (item) => item.isEqual(product));
    if(index==-1) {
      _cartProducts.add(CartItem(product, total: qty));
      notifyListeners();
      return;
    }
    _cartProducts.removeAt(index);
    _cartProducts.add(CartItem(product,total: qty));
    notifyListeners();
  }

  void removeProduct(Product product) {
    _cartProducts.removeWhere((el) => el.isEqual(product));
    notifyListeners();
  }

  void updateItem({Product product,int qty, int index}){
    if(index==null) {
      index = _cartProducts.indexWhere(
              (item) => item.isEqual(product));
    }
    _cartProducts[index].total = qty;
    notifyListeners();
  }


  int _productCounter() {
    int total = 0;
    if(_cartProducts.isNotEmpty) _cartProducts.forEach((e)=>total+=e.total);
    return total;
  }

  List<CartItem> get viewCartItems => _cartProducts;

  int get totalCartItems => _productCounter();
}