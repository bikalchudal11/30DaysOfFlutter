class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: 'Iphone 12 pro max',
        desc: 'Apple Iphone 12 generation',
        price: 999,
        color: '#33505a',
        image:
            'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MHLD3?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1601149541000')
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

//using curly brackets in line 10 means that we have to pass the data in certain order
  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
