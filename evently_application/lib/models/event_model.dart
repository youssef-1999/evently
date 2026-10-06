import 'package:evently_application/enum/categories_enum.dart';

class EventModel {
  final String id;
  final String title;
  final String description;
  final String date;
  final CategoriesEnum category;
  final bool isFavorite;

  const EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.category,
    this.isFavorite = false,
  });

  EventModel copyWith({bool? isFavorite}) {
    return EventModel(
      id: id,
      title: title,
      description: description,
      date: date,
      category: category,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'category': category.toJson(),
      'isFavorite': isFavorite,
    };
  }

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      date: json['date'] as String,
      category: CategoriesEnum.fromJson(json['category'] as String),
      isFavorite: json['isFavorite'] as bool? ?? false,
    );
  }
}
