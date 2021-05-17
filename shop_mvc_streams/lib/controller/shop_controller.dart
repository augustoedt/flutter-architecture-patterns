import 'dart:async';

import 'package:shop_mvc_streams/model/category.dart';
import 'package:shop_mvc_streams/model/product.dart';

class ShopController{

  StreamController<List<Product>> _streamBuilder = StreamController<List<Product>>();
  Stream<List<Product>> get streamList => _streamBuilder.stream;

  List<Product> _productIndex = [];
  List<Product> products = [];

  ShopController(){
    _productIndex = Product.sampleData;
    products = _productIndex;
  }

  void sortProduct({Category filter}) {
    if(filter.id==1) products = _productIndex;
    else products = _productIndex.where((el) => el.category.id==filter.id).toList();
    _streamBuilder.add(products);
  }

  List<Product> get viewProducts => products;


  void dispose(){
    _streamBuilder.close();
  }

}
