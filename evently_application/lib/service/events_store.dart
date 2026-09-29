import 'package:evently_application/enum/categories_enum.dart';
import 'package:evently_application/models/event_model.dart';
import 'package:flutter/foundation.dart';

// Shared events list: every tab listens to it, so a change in one tab
// shows up in the others. Replace the dummy data with Firestore later.
class EventsStore {
  EventsStore._();

  static final ValueNotifier<List<EventModel>> events = ValueNotifier([
    const EventModel(id: '1', title: 'This is a Birthday Party', date: '21 Nov', category: CategoriesEnum.birthday),
    const EventModel(id: '2', title: 'This is a Meeting', date: '21 Jan', category: CategoriesEnum.meeting),
    const EventModel(id: '3', title: 'Football Match', date: '12 Nov', category: CategoriesEnum.sport),
  ]);

  static void setFavorite(String id, bool isFavorite) {
    events.value = [
      for (final event in events.value)
        event.id == id ? event.copyWith(isFavorite: isFavorite) : event,
    ];
  }
}
