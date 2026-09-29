import 'package:evently_application/enum/categories_enum.dart';

class EventModel {
  final String id;
  final String title;
  final String date;
  final CategoriesEnum category;
  final bool isFavorite;

  const EventModel({
    required this.id,
    required this.title,
    required this.date,
    required this.category,
    this.isFavorite = false,
  });

  EventModel copyWith({bool? isFavorite}) {
    return EventModel(
      id: id,
      title: title,
      date: date,
      category: category,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
