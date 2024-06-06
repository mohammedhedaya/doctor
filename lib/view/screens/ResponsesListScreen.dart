import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:just_audio/just_audio.dart';

class ResponsesListScreen extends StatefulWidget {
  @override
  _ResponsesListScreenState createState() => _ResponsesListScreenState();
}

class _ResponsesListScreenState extends State<ResponsesListScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AudioPlayer _audioPlayer = AudioPlayer();
  int? _playingIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            'نتائج التمارين',
            style: TextStyle(color: Colors.blue),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.blue),
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
              bool isPlaying = _playingIndex == index;
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(
                    'نتيجة تمرين رقم ${index + 1}',
                    style: TextStyle(color: Colors.pink),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_circle_filled_rounded,
                      color: Colors.blue,
                    ),
                    onPressed: () async {
                      if (isPlaying) {
                        await _audioPlayer.play();
                      } else {
                        await _audioPlayer.setUrl(response['audio_url']);
                        await _audioPlayer.pause();
                      }
                      setState(() {
                        _playingIndex = isPlaying ? null : index;
                      });
                    },
                  ),
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
