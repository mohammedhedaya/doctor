class ExerciseModel {
  String id;
  String title;
  String description;
  int date;
  bool isDone;

  ExerciseModel({
    required this.date,
    required this.description,
    this.id = '',
    this.isDone = false,
    required this.title,
  });

  factory ExerciseModel.fromjson(Map<String, dynamic> json) {
    return ExerciseModel(
      date: json['date'],
      description: json['description'],
      id: json['id'] ?? '',
      isDone: json['isDone'] ?? false,
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'description': description,
      'isDone': isDone,
      'title': title,
    };
  }
}
