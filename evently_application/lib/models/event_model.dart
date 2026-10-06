import 'package:evently_application/enum/categories_enum.dart';

class EventModel {
  final String id;
  final String title;
  final String description;
  final String date;
  // full date & time of the event (null for events created before it was stored)
  final DateTime? dateTime;
  final CategoriesEnum category;
  final bool isFavorite;

  const EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    this.dateTime,
    required this.category,
    this.isFavorite = false,
  });

  EventModel copyWith({
    String? title,
    String? description,
    String? date,
    DateTime? dateTime,
    CategoriesEnum? category,
    bool? isFavorite,
  }) {
    return EventModel(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      dateTime: dateTime ?? this.dateTime,
      category: category ?? this.category,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'dateTime': dateTime?.millisecondsSinceEpoch,
      'category': category.toJson(),
      'isFavorite': isFavorite,
    };
  }

  factory EventModel.fromJson(Map<String, dynamic> json) {
    final millis = json['dateTime'] as int?;
    return EventModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      date: json['date'] as String,
      dateTime: millis == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(millis),
      category: CategoriesEnum.fromJson(json['category'] as String),
      isFavorite: json['isFavorite'] as bool? ?? false,
    );
  }
}
