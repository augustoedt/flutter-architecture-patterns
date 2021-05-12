import 'package:shop_mvc/model/category.dart';
import 'package:shop_mvc/model/product.dart';

class ShopController{
  List<Product> _productIndex = [];
  List<Product> products = [];

  ShopController(){
    _productIndex = Product.sampleData;
    products = _productIndex;
  }

  void sortProduct({Category filter}) {
    if(filter.id==1) products = _productIndex;
    else products = _productIndex.where((el) => el.category.id==filter.id).toList();
  }

  List<Product> get viewProducts => products;

}
