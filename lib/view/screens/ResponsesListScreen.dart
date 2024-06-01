import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:just_audio/just_audio.dart';

class ResponsesListScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            'الحلول المقدمة',
            style: TextStyle(color: Colors.blue),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.blue),
        // Change the icon color

        actions: [
          IconButton(
            icon: Icon(Icons.delete, color: Colors.blue),
            onPressed: () async {
              bool confirm = await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('تأكيد'),
                  content: Text('هل أنت متأكد أنك تريد مسح كل الحلول المقدمة؟'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text('لا'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: Text('نعم'),
                    ),
                  ],
                ),
              );

              if (confirm) {
                await _deleteAllResponses();
              }
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: _firestore.collection('responses').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          var responses = snapshot.data!.docs;

          return ListView.builder(
            itemCount: responses.length,
            itemBuilder: (context, index) {
              var response = responses[index];
              return ListTile(
                title: Text('رد على التمرين ID: ${response['exercise_id']}'),
                trailing: IconButton(
                  icon: const Icon(Icons.play_arrow),
                  onPressed: () async {
                    await _audioPlayer.setUrl(response['audio_url']);
                    _audioPlayer.play();
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _deleteAllResponses() async {
    var collection = _firestore.collection('responses');
    var snapshots = await collection.get();
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
  }
}
