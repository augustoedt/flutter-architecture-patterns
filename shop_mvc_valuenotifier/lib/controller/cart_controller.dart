import 'package:flutter/cupertino.dart';
import 'package:shop_mvc_valuenotifier/model/cart_item.dart';
import 'package:shop_mvc_valuenotifier/model/product.dart';

class CartController {

  ValueNotifier<List<CartItem>> cartListNotifier = ValueNotifier<List<CartItem>>([]);
  ValueNotifier<int> cartLength = ValueNotifier<int>(0);

  ///create CartItem
  void addProduct(Product product,{int qty=1}) {
    int index = viewCart.indexWhere((element) => element.isEqual(product));
    if(index==-1){
      viewCart.add(CartItem(product, total: qty));
      cartLength.value = updateCounter;
    }else{
      viewCart.removeAt(index);
      viewCart.add(CartItem(product, total: qty));
      cartLength.value = updateCounter;
    }
  }

  void removeProduct(Product product) {
    print('remove Product');
    cartListNotifier.value = cartListNotifier.value.where((el) => !el.isEqual(product)).toList();
    cartLength.value = updateCounter;
  }

  void updateItem({Product product,int qty, int index}){
    if(index==null) {
      index = viewCart.indexWhere(
              (item) => item.isEqual(product));
      if(qty == viewCart[index].total) return;
    }
    viewCart[index].total = qty;
    cartListNotifier.value = viewCart;
    cartLength.value = updateCounter;
  }

  int get updateCounter {
    int total = 0;
    viewCart.forEach((el)=>total+=el.total);
    cartLength.value = total;
    return cartLength.value;
  }
  set updateCounter(int value){
    cartLength.value;
  }

  List<CartItem> get viewCart=>cartListNotifier.value;
  set viewCart(List<CartItem> cartList){
    cartListNotifier.value = cartList;
  }

}
