import 'package:get/get.dart';
import 'package:getx_student_management_app/controller.dart';
import 'item.dart';

class SearchControllPage extends GetxController {
  var searchQuery = ''.obs;
  var filteredItems = <Item>[].obs;

  final ItemController itemController = Get.find();

  @override
  void onInit() {
    super.onInit();
    filterItems();
    debounce(searchQuery, (_) => filterItems(),
        time: const Duration(milliseconds: 300));
  }

  void filterItems() {
    if (searchQuery.isEmpty) {
      filteredItems.assignAll(itemController.items);
    } else {
      final query = searchQuery.toLowerCase();
      var filteredList = itemController.items
          .where((item) =>
              item.name.toLowerCase().contains(query) ||
              item.phone.contains(query) ||
              item.country.toLowerCase().contains(query))
          .toList();
      filteredItems.assignAll(filteredList);
    }
  }
}
