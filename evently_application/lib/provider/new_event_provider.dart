import 'package:evently_application/enum/categories_enum.dart';
import 'package:evently_application/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewEventProvider extends ChangeNotifier {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  CategoriesEnum selectedCategory = CategoriesEnum.values.first;

  NewEventProvider();

  // pre-fill the selections when editing an existing event
  NewEventProvider.fromEvent(EventModel event) {
    selectedCategory = event.category;
    final dateTime = event.dateTime;
    if (dateTime != null) {
      selectedDate = DateUtils.dateOnly(dateTime);
      selectedTime = TimeOfDay.fromDateTime(dateTime);
    } else {
      // older events only saved the short "dd\nMMM" text (no year, no time)
      selectedDate = _parseLegacyDate(event.date);
    }
  }

  static DateTime? _parseLegacyDate(String date) {
    try {
      final parsed = DateFormat('dd\nMMM').parseStrict(date);
      return DateTime(DateTime.now().year, parsed.month, parsed.day);
    } on FormatException {
      return null;
    }
  }

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

  // selected date combined with the selected time
  DateTime? getSelectedDateTime() {
    if (selectedDate == null || selectedTime == null) return null;
    return DateTime(
      selectedDate!.year,
      selectedDate!.month,
      selectedDate!.day,
      selectedTime!.hour,
      selectedTime!.minute,
    );
  }

  String getFormattedDate() {
    if (selectedDate == null) return '';
    return DateFormat('dd\nMMM').format(selectedDate!);
  }
}
