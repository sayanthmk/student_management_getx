import 'package:flutter/material.dart';
import 'package:getx_student_management_app/model/item.dart';
import 'package:getx_student_management_app/widgets/profile_container.dart';
import 'dart:io';

class ProfilePage extends StatelessWidget {
  final Item item;
  const ProfilePage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.deepPurpleAccent[200],
        elevation: 16.0,
        centerTitle: true,
        title: const Text(
          "PROFILE",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              item.image.isNotEmpty
                  ? Image.file(
                      File(item.image),
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    )
                  : Center(
                      child: Container(
                        height: 200,
                        color: Colors.grey[300],
                        child: Icon(
                          Icons.image,
                          size: 100,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
              const SizedBox(height: 20),
              Column(
                children: [
                  CustomTextContainer(
                    text: 'Name: ${item.name}',
                  ),
                  const SizedBox(height: 10),
                  CustomTextContainer(
                    text: 'Age: ${item.age}',
                  ),
                  const SizedBox(height: 10),
                  CustomTextContainer(
                    text: 'Phone: ${item.phone}',
                  ),
                  const SizedBox(height: 10),
                  CustomTextContainer(
                    text: 'Country: ${item.country}',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
