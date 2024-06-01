import 'package:flutter/material.dart';
import 'package:doctor_chat/core/shared/firebase/firebase_manager.dart';
import 'package:doctor_chat/model/exercise_model.dart';

class AddAppointmentPage extends StatefulWidget {
  @override
  _AddAppointmentPageState createState() => _AddAppointmentPageState();
}

class _AddAppointmentPageState extends State<AddAppointmentPage> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'تحديد موعد تمارين',
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.blue),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              Center(
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/interviewbydoctor.png',
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 25),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: "رقم التمرين",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 18),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: "وصف التمرين",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 18),
              Center(
                child: Text(
                  "اختر الموعد المناسب",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                ),
              ),
              SizedBox(height: 9),
              InkWell(
                onTap: () {
                  selectDate();
                },
                child: Center(
                  child: Text(
                    selectedDate.toString().substring(0, 10),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 18),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    ExerciseModel exercise = ExerciseModel(
                      title: titleController.text,
                      description: descriptionController.text,
                      date: DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch,
                    );
                    FirebaseManager.addExercise(exercise);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("تم"),
                          content: Text("تم اضافه التمرين بنجاح"),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: Text("شكرا لك"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text("حفظ", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  selectDate() async {
    DateTime? chosenDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (chosenDate != null) {
      setState(() {
        selectedDate = chosenDate;
      });
    }
  }
}
