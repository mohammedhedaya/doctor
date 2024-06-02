import 'package:flutter/material.dart';
import 'package:contactus/contactus.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Contact Us',
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: ContactUs(
        cardColor: Colors.white,
        textColor: Colors.blue,
        logo: const AssetImage('assets/images/logo.jpg'),
        email: 'mmohammedhedaya@gmail.com',
        companyName: 'MUhammed Hedaya',
        companyColor: Colors.pink,
        dividerThickness: 2,
        phoneNumber: '+2001030019598',
        githubUserName: 'muhammedhedaya1',
        linkedinURL: 'https://www.linkedin.com/in/muhammedhedaya1/',
        tagLine: 'Android Developer',
        taglineColor: Colors.blue,
        instagram: 'muhammedhedaya1',
        facebookHandle: 'muhammedhedaya',
      ),
    );
  }
}
