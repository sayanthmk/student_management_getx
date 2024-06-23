import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'item.dart';

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
  }

  void deleteItem(int index) {
    items[index].delete();
    items.removeAt(index);
  }
}
