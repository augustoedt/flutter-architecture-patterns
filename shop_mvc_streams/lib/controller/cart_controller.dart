import 'dart:async';

import 'package:shop_mvc_streams/model/cart_item.dart';
import 'package:shop_mvc_streams/model/product.dart';

class CartController {

  List<CartItem> _cartProducts = [];

  StreamController<List<CartItem>> _streamCartListController = StreamController<List<CartItem>>.broadcast();
  StreamController<int> _streamCartCounterController = StreamController<int>();

  Stream<List<CartItem>> get cartListStream => _streamCartListController.stream;
  Stream<int> get cartCounter => _streamCartCounterController.stream;

  CartController(){
    _streamCartListController.stream.listen((event) {
      _streamCartCounterController.add(event.length);
    });
  }

  ///create CartItem
  void addProduct(Product product,{int qty=1}) {
    int index = _cartProducts.indexWhere(
            (item) => item.isEqual(product));
    if(index==-1) {
      _cartProducts.add(CartItem(product, total: qty));
      _streamCartListController.add(_cartProducts);
      return;
    }
    _cartProducts.removeAt(index);
    _cartProducts.add(CartItem(product,total: qty));
    _streamCartListController.add(_cartProducts);
  }

  void removeProduct(Product product) {
    _cartProducts.removeWhere((el) => el.isEqual(product));
    _streamCartListController.add(_cartProducts);
  }

  void updateItem({Product product,int qty, int index}){
    if(index==null) {
      index = _cartProducts.indexWhere(
              (item) => item.isEqual(product));
    }
    _cartProducts[index].total = qty;
    _streamCartListController.add(_cartProducts);
  }


  int productCounter() {
    int total = 0;
    if(_cartProducts.isNotEmpty) _cartProducts.forEach((e)=>total+=e.total);
    return total;
  }

  List<CartItem> get viewLastCartItem => _cartProducts;

  void dispose(){
    _streamCartListController.close();
    _streamCartCounterController.close();
  }

}