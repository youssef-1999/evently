import 'package:evently_application/enum/categories_enum.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewEventProvider extends ChangeNotifier {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  CategoriesEnum selectedCategory = CategoriesEnum.values.first;

  void setSelectedDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  void setSelectedTime(TimeOfDay time) {
    selectedTime = time;
    notifyListeners();
  }

  void setSelectedCategory(CategoriesEnum category) {
    selectedCategory = category;
    notifyListeners();
  }

  String getFormattedDate() {
    if (selectedDate == null) return '';
    return DateFormat('dd\nMMM').format(selectedDate!);
  }
}
