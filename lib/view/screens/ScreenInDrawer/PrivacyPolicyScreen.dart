import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
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
          'سياسة الخصوصية',
          style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize:25),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '1. مقدمة',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              Text(
                'نحن نأخذ خصوصيتك على محمل الجد. توضح سياسة الخصوصية هذه كيفية جمع واستخدام وحماية معلوماتك الشخصية في تطبيقنا.',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 16),
              Text(
                '2. المعلومات التي نجمعها',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              Text(
                'نقوم بجمع المعلومات التالية:',
                style: TextStyle(fontSize: 22),
              ),
              Text(
                '- المعلومات الشخصية مثل الاسم، البريد الإلكتروني، صورة الحساب.',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '- المعلومات المتعلقة بالاستخدام مثل التمارين المنجزة، المواعيد.',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 16),
              Text(
                '3. كيفية استخدام المعلومات',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              Text(
                'نستخدم المعلومات التي نجمعها للأغراض التالية:',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '- تقديم وتحسين خدماتنا.',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '- التواصل معك بشأن حسابك واستخدامك للتطبيق.',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 16),
              Text(
                '4. حماية المعلومات',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              Text(
                'نحن نتخذ إجراءات معقولة لحماية معلوماتك الشخصية من الوصول غير المصرح به أو الكشف عنها أو التعديل أو التدمير.',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 16),
              Text(
                '5. مشاركة المعلومات',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              Text(
                'نحن لا نشارك معلوماتك الشخصية مع أطراف ثالثة، باستثناء الحالات التالية:',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '- عندما نحصل على موافقتك على القيام بذلك.',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '- عندما يكون من الضروري للامتثال للقوانين أو اللوائح أو الإجراءات القانونية.',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 16),
              Text(
                '6. حقوقك',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              Text(
                'لديك حقوق معينة تتعلق بمعلوماتك الشخصية، بما في ذلك الحق في الوصول إليها وتصحيحها وحذفها.',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 16),
              Text(
                '7. تغييرات في سياسة الخصوصية',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              Text(
                'قد نقوم بتحديث سياسة الخصوصية هذه من وقت لآخر. سنعلمك بأي تغييرات من خلال نشر السياسة الجديدة على هذه الصفحة.',
                style: TextStyle(fontSize: 2),
              ),
              SizedBox(height: 16),
              Text(
                '8. اتصل بنا',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              Text(
                'إذا كانت لديك أي أسئلة أو مخاوف بشأن سياسة الخصوصية هذه، يرجى الاتصال بنا على [mmohammedhedaya@gmail.com].',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
