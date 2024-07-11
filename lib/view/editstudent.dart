import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_student_management_app/controller/controller.dart';
import 'package:getx_student_management_app/controller/imagecontroller.dart';
import 'package:getx_student_management_app/model/item.dart';
import 'package:getx_student_management_app/widgets/textfield.dart';
import 'dart:io';

class EditItemPage extends StatelessWidget {
  final int index;
  final Item item;
  final TextEditingController nameController;
  final TextEditingController ageController;
  final TextEditingController phoneController;
  final TextEditingController countryController;
  final ImageController imageController = Get.put(ImageController());

  EditItemPage({super.key, required this.index, required this.item})
      : nameController = TextEditingController(text: item.name),
        ageController = TextEditingController(text: item.age.toString()),
        phoneController = TextEditingController(text: item.phone),
        countryController = TextEditingController(text: item.country) {
    imageController.selectedImagePath.value = item.image;
  }

  final ItemController itemController = Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.deepPurple,
        elevation: 16.0,
        title: const Center(
          child: Text(
            "EDIT STUDENT",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
            iconSize: 24,
            color: Colors.deepPurple,
            tooltip: "Save",
          )
        ],
      ),
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
                          backgroundColor: Colors.deepPurple,
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
                                    Icons.person,
                                    size: 60,
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
                            backgroundColor: Colors.deepPurpleAccent,
                            child: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                const SizedBox(
                  height: 50,
                ),
                CustomTextField(
                  keyboard: TextInputType.text,
                  controller: nameController,
                  labelText: 'Name',
                  prefixIcon: const Icon(Icons.person_2_rounded),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  keyboard: TextInputType.text,
                  controller: ageController,
                  labelText: 'Age',
                  prefixIcon: const Icon(Icons.person_2_rounded),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  keyboard: TextInputType.text,
                  controller: phoneController,
                  labelText: 'Phone',
                  prefixIcon: const Icon(Icons.person_2_rounded),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  keyboard: TextInputType.text,
                  controller: countryController,
                  labelText: 'Place',
                  prefixIcon: const Icon(Icons.person_2_rounded),
                ),
                const SizedBox(height: 50),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      itemController.updateItem(
                        index,
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
                    height: 70,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent[200],
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                        child: Text(
                      "EDIT",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    )),
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
