//we dont have any source which we can show items in the cart page.. so that we have created this cart model like the catalog model page to map the items from the catalog page and then we can show them in the cart page.

import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/model/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
// //this is the singleton class which creates one single object and use it everywhere..without making object everywhere.
//   static final cartModel = CartModel._internal();
//   CartModel._internal();
//   factory CartModel() => cartModel;

  late CatalogModel _catalog;

//collection of item ids= store of Ids of each item
  final List<int> _itemIds = [];

//get catalog... we created this becoz our in above catalog is private so that we cannot access..(another use)
  CatalogModel get catalog => _catalog;

//here we write other logic in this but if we take without private we ill write only one line of code
  set catalog(newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //get Items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //get Total price
  //fold means we have to give logic or operation by own.. we can give initial value and what type of operation or logic by own
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //add items
  // void add(Item item) {
  //   _itemIds.add(item.id);
  // }

  //remove items
  // void remove(Item item) {
  //   _itemIds.remove(item.id);
  // }
}

class AddMutation extends VxMutation<MyStore>{
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }

}
class RemoveMutation extends VxMutation<MyStore>{
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }

}