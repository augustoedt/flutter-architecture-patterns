
import 'category.dart';

class Product {
  final String id;
  final String name;
  final double price;
  final Category category;

  Product({this.id, this.category, this.name, this.price});

  static List<Product> sampleData = [
    Product(name: 'T-shirt', price: 19.99, category: Category.sampleData[1]),
    Product(name: 'Sweater', price: 29.99, category: Category.sampleData[1]),
    Product(name: 'Coat', price: 9.99, category: Category.sampleData[1]),
    Product(name: 'Jeans', price: 39.99, category: Category.sampleData[2]),
    Product(name: 'Socks', price: 4.99, category: Category.sampleData[2]),
    Product(name: 'Jacket', price: 59.99, category: Category.sampleData[1]),
    Product(name: 'Pajamas', price: 14.99, category: Category.sampleData[1]),
    Product(name: 'Shoes', price: 99.99, category: Category.sampleData[2]),
  ];
}
