import 'package:flutter/cupertino.dart';
import 'package:shop_mvc_valuenotifier/model/category.dart';
import 'package:shop_mvc_valuenotifier/model/product.dart';

class ShopController{
  ValueNotifier<List<Product>> productsListNotifier = ValueNotifier<List<Product>>([]);
  List<Product> productIndex;

  ShopController(){
    productIndex = Product.sampleData;
    viewProducts = productIndex;
  }

  void sortProduct({Category filter}) {
    if(filter.id==1) viewProducts = productIndex;
    else viewProducts = productIndex.where((el) => el.category.id==filter.id).toList();
  }

  List<Product> get viewProducts => productsListNotifier.value;
  set viewProducts(List<Product> shopList){
    productsListNotifier.value = shopList;
  }

}
