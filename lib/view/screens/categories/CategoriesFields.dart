import 'package:doctor_chat/chat_screen.dart';
import 'package:doctor_chat/view/screens/AddExerciseScreen.dart';
import 'package:doctor_chat/view/screens/ResponsesListScreen.dart';
import 'package:doctor_chat/view/screens/categories/CategoryWidget.dart';
import 'package:doctor_chat/view/screens/categories/category.dart';
import 'package:doctor_chat/view/screens/screen_for_interview/AddAppointmentPage.dart';
import 'package:flutter/material.dart';


typedef OnCategoryClick = void Function(Category category);

class CategoriesFields extends StatefulWidget {
  final OnCategoryClick onCategoryClick;
  CategoriesFields(this.onCategoryClick, {Key? key}) : super(key: key);

  @override
  State<CategoriesFields> createState() => _CategoriesFieldsState();
}

class _CategoriesFieldsState extends State<CategoriesFields> {
  List<Category> categories = Category.getCategories();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          SizedBox(height: 100), // Add space below the text
          SizedBox(
            height: 700, // Provide a specific height
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  if (categories[index].title == "التواصل مع ولي الامر") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DoctorChatScreen(),
                      ),
                    );
                  } else if (categories[index].title == "اضافه تمارين الي الطفل") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddExerciseScreen(),
                      ),
                    );
                  } else if (categories[index].title == "نتائج التمارين") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResponsesListScreen(),
                      ),
                    );
                  } else if (categories[index].title == "تحديد موعد تمارين") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddAppointmentPage(),
                      ),
                    );
                  }
                  else {
                    widget.onCategoryClick(categories[index]);
                  }
                },
                child: CategoryItem(categories[index], index),
              ),
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
