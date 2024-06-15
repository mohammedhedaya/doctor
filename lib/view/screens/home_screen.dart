import 'package:doctor_chat/auth/LoginAndSignup/screen/login.dart';
import 'package:doctor_chat/view/screens/DataOfChild/dataaboutchild.dart';
import 'package:doctor_chat/view/screens/ScreenInDrawer/PrivacyPolicyScreen.dart';
import 'package:doctor_chat/view/screens/ScreenInDrawer/UserDetailsScreen.dart';
import 'package:doctor_chat/view/screens/ScreenInDrawer/contactus.dart';
import 'package:doctor_chat/view/screens/categories/CategoriesFields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Doctor',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.all(50),
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white, // Background color for drawer header
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 1.0),
                  // Adjust the top padding to move the image down
                  child: Image.asset(
                    'assets/images/اخصائية-تخاطب.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('تفاصيل شخصية'),
                tileColor: Colors.blue,
                textColor: Colors.black,
                iconColor: Colors.blue,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserDetailsScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.policy),
                title: Text('سياسة الخصوصية'),
                tileColor: Colors.blue,
                textColor: Colors.black,
                iconColor: Colors.blue,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PrivacyPolicyScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.contact_phone),
                title: Text('اتصل بنا'),
                tileColor: Colors.blue,
                textColor: Colors.black,
                iconColor: Colors.blue,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactUsScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.info_outline_rounded),
                title: Text('الاطفال المسجله'),
                tileColor: Colors.blue,
                textColor: Colors.black,
                iconColor: Colors.blue,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InfoForChildren(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('تسجيل الخروج'),
                tileColor: Colors.blue,
                textColor: Colors.black,
                iconColor: Colors.blue,
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CategoriesFields(
              (category) {
                // Do something with the selected category
              },
            ),
          ],
        ),
      ),
    );
  }
}
