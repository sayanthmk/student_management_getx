import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:getx_student_management_app/addstudent.dart';
import 'package:getx_student_management_app/editstudent.dart';
import 'package:getx_student_management_app/profilepage.dart';
import 'package:getx_student_management_app/controller.dart';
import 'package:getx_student_management_app/searchcontroller.dart';

class HomePage extends StatelessWidget {
  final ItemController itemController = Get.put(ItemController());
  final SearchControllPage searchController = Get.put(SearchControllPage());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightGreenAccent,
          title: const Center(
              child: Text(
            'STUDENT REGISTER',
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
          ))),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) => searchController.searchQuery.value = value,
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Obx(() {
              final items = searchController.filteredItems.isNotEmpty ||
                      searchController.searchQuery.isNotEmpty
                  ? searchController.filteredItems
                  : itemController.items;

              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    /////////////////////////
                    // child: Card(
                    //   color: Colors.red,
                    //   child: ListTile(
                    //     title: Text(item.name),
                    //     subtitle: Text(item.phone),
                    //     leading: item.image.isNotEmpty
                    //         ? CircleAvatar(
                    //             child: Image.file(File(item.image),
                    //                 fit: BoxFit.fill),
                    //           )
                    //         : const Icon(Icons.image),
                    //     trailing: Row(
                    //       mainAxisSize: MainAxisSize.min,
                    //       children: [
                    //         IconButton(
                    //           icon: const Icon(Icons.edit),
                    //           onPressed: () {
                    //             Get.to(() =>
                    //                 EditItemPage(index: index, item: item));
                    //           },
                    //         ),
                    //         IconButton(
                    //           icon: const Icon(Icons.delete),
                    //           onPressed: () {
                    //             itemController.deleteItem(index);
                    //           },
                    //         ),
                    //       ],
                    //     ),
                    //     onTap: () {
                    //       Get.to(() => ProfilePage(item: item));
                    //     },
                    //   ),
                    // ),
/////////////////////////////////////////////////////////////////////
                    child: Slidable(
                      // Specify a key if the Slidable is dismissible.
                      key: const ValueKey(0),

                      // The start action pane is the one at the left or the top side.
                      startActionPane: ActionPane(
                        // A motion is a widget used to control how the pane animates.
                        motion: const ScrollMotion(),

                        // A pane can dismiss the Slidable.
                        dismissible: DismissiblePane(onDismissed: () {
                          itemController.deleteItem(index);
                        }),

                        // All actions are defined in the children parameter.
                        children: [
                          // A SlidableAction can have an icon and/or a label.
                          SlidableAction(
                            onPressed: (context) {
                              //////////////////
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
                                        itemController.deleteItem(index);
                                        Get.back();
                                      },
                                      child: const Text("Delete"),
                                    ),
                                  ],
                                ),
                              );
                            },
                            backgroundColor: const Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                          // SlidableAction(
                          //   onPressed: (context) {},
                          //   backgroundColor: Color(0xFF21B7CA),
                          //   foregroundColor: Colors.white,
                          //   icon: Icons.share,
                          //   label: 'Share',
                          // ),
                        ],
                      ),

                      // The end action pane is the one at the right or the bottom side.
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          // SlidableAction(
                          //   // An action can be bigger than the others.
                          //   flex: 2,
                          //   onPressed: (context) {},
                          //   backgroundColor: Color(0xFF7BC043),
                          //   foregroundColor: Colors.white,
                          //   icon: Icons.archive,
                          //   label: 'Archive',
                          // ),
                          SlidableAction(
                            onPressed: (context) {
                              Get.to(
                                  () => EditItemPage(index: index, item: item));
                            },
                            backgroundColor: const Color(0xFF0392CF),
                            foregroundColor: Colors.white,
                            icon: Icons.edit,
                            label: 'Edit',
                          ),
                        ],
                      ),

                      // The child of the Slidable is what the user sees when the
                      // component is not dragged.
                      child: Card(
                        color: Colors.black12,
                        child: ListTile(
                          title: Text(
                            item.name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(item.phone),
                          leading: item.image.isNotEmpty
                              ? CircleAvatar(
                                  radius: 20,
                                  child: ClipOval(
                                    child: Image.file(
                                      File(item.image),
                                      fit: BoxFit.fill,
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                )
                              : const Icon(Icons.image),
                          // trailing: Row(
                          //   mainAxisSize: MainAxisSize.min,
                          //   children: [
                          //     IconButton(
                          //       icon: const Icon(Icons.edit),
                          //       onPressed: () {
                          //         Get.to(() =>
                          //             EditItemPage(index: index, item: item));
                          //       },
                          //     ),
                          //     IconButton(
                          //       icon: const Icon(Icons.delete),
                          //       onPressed: () {
                          //         //////////////////
                          //         Get.dialog(
                          //           AlertDialog(
                          //             title: const Text("Delete"),
                          //             actions: [
                          //               InkWell(
                          //                 onTap: () {
                          //                   Get.back();
                          //                 },
                          //                 child: const Text("Cancel"),
                          //               ),
                          //               InkWell(
                          //                 onTap: () {
                          //                   itemController.deleteItem(index);
                          //                   Get.back();
                          //                 },
                          //                 child: const Text("Delete"),
                          //               ),
                          //             ],
                          //           ),
                          //         );
                          //         ////////////////
                          //         // itemController.deleteItem(index);
                          //       },
                          //     ),
                          //   ],
                          // ),
                          onTap: () {
                            Get.to(() => ProfilePage(item: item));
                          },
                        ),
                      ),
                    ),

                    //////////////////////////////////////
                  );
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
          searchController.filterItems();
        },
      ),
    );
  }
}
