import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddExerciseScreen extends StatefulWidget {
  @override
  _AddExerciseScreenState createState() => _AddExerciseScreenState();
}

class _AddExerciseScreenState extends State<AddExerciseScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<String?> _uploadImage(File image) async {
    try {
      String fileName = 'exercises/${DateTime.now().millisecondsSinceEpoch}.jpg';
      TaskSnapshot snapshot = await _storage.ref(fileName).putFile(image);
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<int> _getNextExerciseNumber() async {
    var exercises = await _firestore.collection('exercises').orderBy('number', descending: true).limit(1).get();
    if (exercises.docs.isEmpty) {
      return 1;
    }
    return exercises.docs.first['number'] + 1;
  }

  void _addExercise() async {
    String title = _titleController.text;
    String description = _descriptionController.text;

    if (title.trim().isEmpty || description.trim().isEmpty || _image == null) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text('يرجى الانتظار جاري ارسال التمرين'),
            ],
          ),
        );
      },
    );

    String? imageUrl = await _uploadImage(_image!);
    int nextNumber = await _getNextExerciseNumber();

    if (imageUrl == null) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('فشل في رفع الصورة')),
      );
      return;
    }

    await _firestore.collection('exercises').add({
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'created_by': 'doctor_id', // استخدم معرف الطبيب الفعلي هنا
      'timestamp': FieldValue.serverTimestamp(),
      'number': nextNumber,
    });

    _titleController.clear();
    _descriptionController.clear();
    setState(() {
      _image = null;
    });

    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('تم إضافة التمرين بنجاح')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'إضافة تمرين',
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.blue),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Center(
            child: ClipOval(
              child: Image.asset(
                'assets/images/inthescreenaddexercise.jpg',
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              labelText: 'عنوان التمرين',
              labelStyle: TextStyle(color: Colors.blue),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(
              labelText: 'وصف التمرين',
              labelStyle: TextStyle(color: Colors.blue),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          _image == null
              ? Center(child: const Text('لم يتم اختيار صورة'))
              : Image.file(_image!, height: 200),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: _pickImage,
            icon: const Icon(Icons.image),
            label: const Text('اختيار صورة'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: _addExercise,
            icon: const Icon(Icons.send),
            label: const Text('إرسال التمرين'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
