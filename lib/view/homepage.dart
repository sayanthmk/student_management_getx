import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_student_management_app/view/addstudent.dart';
import 'package:getx_student_management_app/view/editstudent.dart';
import 'package:getx_student_management_app/view/profilepage.dart';
import 'package:getx_student_management_app/controller/controller.dart';

class HomePage extends StatelessWidget {
  final ItemController itemController = Get.put(ItemController());
  // final SearchControllPage searchController = Get.put(SearchControllPage());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Center(
              child: Text(
            'STUDENT REGISTER',
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
          ))),
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: TextField(
          //     onChanged: (value) => searchController.searchQuery.value = value,
          //     decoration: const InputDecoration(
          //       labelText: 'Search',
          //       prefixIcon: Icon(Icons.search),
          //     ),
          //   ),
          // ),
          Expanded(
            child: Obx(() {
              final items = itemController.items;
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                          height: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(colors: [
                                Colors.deepPurple,
                                Color.fromARGB(255, 146, 110, 247),
                              ])),
                          child: Center(
                            child: ListTile(
                              title: Text(
                                item.name,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              subtitle: Text(
                                item.phone,
                                style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              leading: item.image.isNotEmpty
                                  ? CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      radius: 25,
                                      child: ClipOval(
                                        child: Image.file(
                                          File(item.image),
                                          fit: BoxFit.fill,
                                          height: 60,
                                          width: 60,
                                        ),
                                      ),
                                    )
                                  : const Icon(Icons.image),
                              onTap: () {
                                Get.to(() => ProfilePage(item: item));
                              },
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit,
                                        color: Colors.blue),
                                    onPressed: () {
                                      Get.to(() => EditItemPage(
                                          index: index, item: item));
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    onPressed: () {
                                      Get.dialog(
                                        AlertDialog(
                                          title: const Text("Delete"),
                                          actions: [
                                            InkWell(
                                              onTap: () {
                                                Get.back();
                                              },
                                              child: const Text("Cancel"),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                itemController
                                                    .deleteItem(index);
                                                Get.back();
                                              },
                                              child: const Text("Delete"),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          )));
                },
              );
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Get.to(() => AddItemPage());
          itemController.items.refresh();
        },
      ),
    );
  }
}
