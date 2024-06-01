import 'package:doctor_chat/view/screens/categories/CategoriesFields.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('الصفحه الرئيسيه')),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("Screen 1"),
              onTap: (){},
            ),
            ListTile(
              title: Text("Screen 2"),
              onTap: (){},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          CategoriesFields(
            (category) {
            },
          ),
        ],
      ),
    );
  }
}
