import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_chat/model/exercise_model.dart';

class FirebaseManager {
  static CollectionReference<ExerciseModel> getCollection() {
    return FirebaseFirestore.instance
        .collection('Exercise')
        .withConverter<ExerciseModel>(
      fromFirestore: (snapshot, _) => ExerciseModel.fromjson(snapshot.data()!),
      toFirestore: (value, _) => value.toJson(),
    );
  }

  static Future<void> addExercise(ExerciseModel exercise) {
    CollectionReference collection = getCollection();
    var doc = collection.doc();
    exercise.id = doc.id;
    return doc.set(exercise);
  }

  static Future<void> deleteExercise(String taskId) {
    return getCollection().doc(taskId).delete();
  }

  static void updateExercise(ExerciseModel model) {
    getCollection().doc(model.id).update(model.toJson());
  }
}
