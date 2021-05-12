import 'package:shop_mvc/model/product.dart';

class CartItem{
  Product product;
  int total = 0;

  CartItem(this.product,{this.total}):assert(product!=null);

  void add(){
    this.total+=1;
  }

  void remove(){
    if(total>1) this.total-=1;
  }

  bool isEqual(Product product){
    return product.name == this.product.name;
  }

}