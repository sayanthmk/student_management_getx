import 'package:hive/hive.dart';

part 'item.g.dart';

@HiveType(typeId: 0)
class Item extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

  @HiveField(2)
  String image;

  @HiveField(3)
  String phone;

  @HiveField(4)
  String country;

  Item({
    required this.name,
    required this.age,
    required this.image,
    required this.phone,
    required this.country,
  });
}
