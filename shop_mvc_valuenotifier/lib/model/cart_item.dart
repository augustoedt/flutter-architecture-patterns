import 'package:shop_mvc_valuenotifier/model/product.dart';

class CartItem{
  Product product;
  int total = 0;

  CartItem(this.product,{this.total}):assert(product!=null);

  bool isEqual(Product product){
    return product.name == this.product.name;
  }

}