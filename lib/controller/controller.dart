import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../model/item.dart';

class ItemController extends GetxController {
  var items = <Item>[].obs;
  late Box<Item> itemBox;

  @override
  void onInit() {
    super.onInit();
    itemBox = Hive.box<Item>('items');
    items.addAll(itemBox.values.toList());
  }

  void addItem(
      String name, int age, String image, String phone, String country) {
    final newItem = Item(
        name: name, age: age, image: image, phone: phone, country: country);
    itemBox.add(newItem);
    items.add(newItem);
    items.refresh();
  }

  void updateItem(int index, String name, int age, String image, String phone,
      String country) {
    final item = items[index];
    item.name = name;
    item.age = age;
    item.image = image;
    item.phone = phone;
    item.country = country;
    item.save();
    items[index] = item;
    items.refresh();
  }

  void deleteItem(int index) async {
    try {
      await itemBox.deleteAt(index);
      items.removeAt(index);
    } catch (e) {
      // ignore: avoid_print
      print("Error Deleting : $e");
    }
    items.refresh();
  }
}
  // void deleteItem(int index) {
  //   final key = itemBox.keyAt(index);
  //   itemBox.delete(key);
  //   items.removeAt(index);
  //   items.refresh();
  // }

  // void deleteItem(int index) {
  //   itemBox.deleteAt(index);
  //   items.refresh();
  // }