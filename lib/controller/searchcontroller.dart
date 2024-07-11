// import 'dart:async';
// import 'package:get/get.dart';
// import 'package:getx_student_management_app/controller/controller.dart';
// import 'package:getx_student_management_app/model/item.dart';


// class SearchControllPage extends GetxController {
//   var searchQuery = ''.obs;
//   var filteredItems = <Item>[].obs;
//   late Timer _debounceTimer;

//   final ItemController itemController = Get.find();

//   @override
//   void onInit() {
//     super.onInit();
//     _debounceTimer = Timer(const Duration(milliseconds: 0), () {});
//     searchQuery.listen((query) {
//       searchStudent(query);
//     });
//   }

//   void searchStudent(String query) {
//     if (_debounceTimer.isActive) {
//       _debounceTimer.cancel();
//     }
//     _debounceTimer = Timer(const Duration(milliseconds: 300), () {
//       filteredItems.clear(); 
//       if (query.isEmpty) {
//         filteredItems.assignAll(itemController.items); 
//       } else {
//         final lowerCaseQuery = query.toLowerCase();
//         final filteredList = itemController.items
//             .where((item) =>
//                 item.name.toLowerCase().contains(lowerCaseQuery) ||
//                 item.phone.contains(query) ||
//                 item.country.toLowerCase().contains(lowerCaseQuery))
//             .toList();
//         filteredItems.assignAll(filteredList);
//       }
//     });
//   }
// }
