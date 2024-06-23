import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_student_management_app/controller.dart';
import 'package:getx_student_management_app/imagecontroller.dart';

class AddItemPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final ItemController itemController = Get.find();
  final ImageController imageController = Get.put(ImageController());
  final _formKey = GlobalKey<FormState>();

  AddItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add student')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Obx(() {
                  return Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.blue,
                          child: ClipOval(
                            child: imageController
                                    .selectedImagePath.value.isNotEmpty
                                ? Image.file(
                                    File(imageController
                                        .selectedImagePath.value),
                                    fit: BoxFit.cover,
                                    width: 120,
                                    height: 120,
                                  )
                                : const Icon(
                                    Icons
                                        .person, // Default icon when no image is selected
                                    size:
                                        60, // Adjust size according to your need
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.dialog(
                              AlertDialog(
                                title: const Text("Choose image"),
                                actions: [
                                  InkWell(
                                    onTap: () {
                                      imageController.pickImageFromGallery();
                                      Get.back();
                                    },
                                    child: const Text("Gallery"),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      imageController.pickImageFromCamera();
                                      Get.back();
                                    },
                                    child: const Text("Camera"),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: const CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.red,
                            child: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                const SizedBox(
                  height: 20,
                ),

                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is empty';
                    } else {
                      return null;
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: ageController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Age'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Age is empty';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),

                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Phone'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone number is empty';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                //
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: countryController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Country'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Country is empty';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),

                const SizedBox(height: 50),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      itemController.addItem(
                        nameController.text,
                        int.parse(ageController.text),
                        imageController.selectedImagePath.value,
                        phoneController.text,
                        countryController.text,
                      );
                      Get.back();
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(child: Text("Add")),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// TextFormField(
//   controller: nameController,
//   decoration: const InputDecoration(labelText: 'Name'),
// ),
// ElevatedButton(
//   onPressed: () {
//     itemController.addItem(
//       nameController.text,
//       int.parse(ageController.text),
//       imageController.selectedImagePath.value,
//       phoneController.text,
//       countryController.text,
//     );
//     Get.back();
//   },
//   child: const Text('Add Item'),
// ),
// TextFormField(
//   controller: countryController,
//   decoration: const InputDecoration(labelText: 'Country'),
// ),
// TextFormField(
//   controller: phoneController,
//   decoration: const InputDecoration(labelText: 'Phone'),
//   keyboardType: TextInputType.phone,
// ),
// TextFormField(
//   controller: ageController,
//   decoration: const InputDecoration(labelText: 'Age'),
//   keyboardType: TextInputType.number,
// ),
