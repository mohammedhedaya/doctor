import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_chat/view/screens/AddExerciseScreen.dart';
import 'package:flutter/material.dart';

class DiagnosisScreen extends StatefulWidget {
  final QueryDocumentSnapshot childData;

  DiagnosisScreen({required this.childData});

  @override
  _DiagnosisScreenState createState() => _DiagnosisScreenState();
}

class _DiagnosisScreenState extends State<DiagnosisScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text('تشخيص ${widget.childData['name']}', style: TextStyle(color: Colors.blue)),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(
                child: Text(
                  'الاسم: ${widget.childData['name']}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
              ),
              SizedBox(height: 10),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('العمر: ${widget.childData['age']}'),
                  SizedBox(width: 10),
                  Icon(Icons.cake),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('العنوان: ${widget.childData['address']}'),
                  SizedBox(width: 10),
                  Icon(Icons.location_on),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('المشكلة: ${widget.childData['problem']}'),
                  SizedBox(width: 10),
                  Icon(Icons.warning),
                ],
              ),
              SizedBox(height: 20),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddExerciseScreen()));
                  },
                  child: Text('إرسال التمارين'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
