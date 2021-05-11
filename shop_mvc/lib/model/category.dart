class MyCategory{
  final String name;
  final int id;

  MyCategory({this.name, this.id});

  @override
  toString(){
    return name ?? '';
  }

  static List<MyCategory> sampleData = [
    MyCategory(name: 'All', id: 1),
    MyCategory(name: 'Body wear', id: 2),
    MyCategory(name: 'Legs wear', id: 3)
  ];
}