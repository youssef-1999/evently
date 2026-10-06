import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_application/models/event_model.dart';
import 'package:flutter/foundation.dart';

class EventService {
  static CollectionReference<EventModel> getEventsCollection() {
    CollectionReference<EventModel> collection= FirebaseFirestore.instance
        .collection('events')
        .withConverter<EventModel>(
          fromFirestore: (snapshot, options) =>
              EventModel.fromJson(snapshot.data() ?? {}),
          toFirestore: (event, options) => event.toJson(),
        );
    return collection;

  }

  static Future<void> addEvent(EventModel event) async {
    try {
      final collection = getEventsCollection();
      await collection.doc(event.id).set(event);
    } on Exception catch (e) {
      // TODO
      debugPrint("-----> Error adding event: $e");
    }
  }
  // live list of events: emits again whenever an event is added/updated
  static Stream<List<EventModel>> getEventsStream() {
    return getEventsCollection().snapshots().map(
          (snapshot) => snapshot.docs.map((doc) => doc.data()).toList(),
        );
  }

  // get all events from firestore
  static Future<List<EventModel>> getAllEvents() async {
    try {
      final collection = getEventsCollection();
      final querySnapshot = await collection.get();
      return querySnapshot.docs.map((doc) => doc.data()).toList();
    } on Exception catch (e) {
      // TODO
      debugPrint("-----> Error getting events: $e");
      return [];
    }
  }

  static Future<void> updateEvent(EventModel event) async {
    try {
      final collection = getEventsCollection();
      await collection.doc(event.id).update(event.toJson());
    } on Exception catch (e) {
      // TODO
      debugPrint("-----> Error updating event: $e");
    }
  }
}
