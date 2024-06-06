import 'package:doctor_chat/view/screens/DataOfChild/DiagnosisScreen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text('معلومات الأطفال',style: TextStyle(color: Colors.blue),),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('children')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final childrenDocs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: childrenDocs.length,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: Colors.blue, width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Center(
                          child: Text(
                            childrenDocs[index]['name'],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('العمر: ${childrenDocs[index]['age']}'),
                            SizedBox(width: 10),
                            Icon(Icons.cake),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('العنوان: ${childrenDocs[index]['address']}'),
                            SizedBox(width: 10),
                            Icon(Icons.location_on),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('المشكلة: ${childrenDocs[index]['problem']}'),
                            SizedBox(width: 10),
                            Icon(Icons.warning),
                          ],
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DiagnosisScreen(
                                    childData: childrenDocs[index],
                                  ),
                                ),
                              );
                            },
                            child: Text('تشخيص وإرسال التمارين'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


