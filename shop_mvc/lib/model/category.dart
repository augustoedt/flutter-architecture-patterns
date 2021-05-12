class Category{
  final String name;
  final int id;

  Category({this.name, this.id});

  @override
  toString(){
    return name ?? '';
  }

  static List<Category> sampleData = [
    Category(name: 'All', id: 1),
    Category(name: 'Body wear', id: 2),
    Category(name: 'Legs wear', id: 3)
  ];
}