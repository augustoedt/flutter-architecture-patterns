import 'package:flutter/cupertino.dart';
import 'package:shop_mvc_provider/model/category.dart';
import 'package:shop_mvc_provider/model/product.dart';

class ShopController extends ChangeNotifier{
  List<Product> _productIndex = [];
  List<Product> products = [];
  Category selectedCategory;

  ShopController(){
    _productIndex = Product.sampleData;
    selectedCategory = Category.sampleData[0];
    products = _productIndex;
  }

  void sortProduct({Category filter}) {
    if(filter.id==1) products = _productIndex;
    else products = _productIndex.where((el) => el.category.id==filter.id).toList();
    notifyListeners();
  }

  List<Product> get viewProducts => products;

}
