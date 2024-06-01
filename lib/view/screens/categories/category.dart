import 'package:flutter/material.dart';

class Category {
  String? title;
  String? image;
  Color? color;

  Category(this.title, this.image, this.color);

  static List<Category> getCategories() {
    return [
      Category("التواصل مع الطفل", "assets/images/mail-part.png", Color(0xFF6B9FBC)),
      Category("اضافه تمارين الي الطفل", "assets/images/addtasks.png", Color(0xFFABE1E0)),
      Category("الحلول المقدمه", "assets/images/childprocess.png", Color(0xFF79C6E0)),
      Category("تحديد موعد", "assets/images/calendar.png", Color(0xFFABE1E0)),
    ];
  }
}
