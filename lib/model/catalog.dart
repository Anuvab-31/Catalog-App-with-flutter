class CatalogModel {
  // //this is the singleton class which creates one single object and use it everywhere..without making object everywhere.
  // static final catModel = CatalogModel._internal();
  // CatalogModel._internal();
  // factory CatalogModel() => catModel;
  static List<Item> items = [];

  //get Items by id
  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  //get Items by position
  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String des;
  final num price;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.des,
      required this.price,
      required this.image});

//this for decode purpose from local json file and we have to match key from the local json file
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map["id"],
        name: map["name"],
        des: map["des"],
        price: map["price"],
        image: map["image"]);
  }

//this for encode purpose which converts class to map

  toMap() => {
        "id": id,
        "name": name,
        "des": des,
        "price": price,
        "image": image,
      };
}
