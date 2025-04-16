class DateModel {
  final int id;
  final String date;
  final List<String> times;

  DateModel({required this.id, required this.date, required this.times});

  factory DateModel.fromJson(Map<String, dynamic> json) {
    return DateModel(
      id: json['id'] as int,
      date: json['date'] as String,
      times: json['times'] as List<String>,
    );
  }
}
