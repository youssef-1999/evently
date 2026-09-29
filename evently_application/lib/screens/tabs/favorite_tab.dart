import 'package:evently_application/common/app_text_styles.dart';
import 'package:evently_application/models/event_model.dart';
import 'package:evently_application/service/events_store.dart';
import 'package:evently_application/widgets/event_card.dart';
import 'package:flutter/material.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        children: [
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 16.0, ),
             child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search for  events',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
              ),
              style: AppTextStyles.styleW400s14(color: Color(0xff686868)),
                       ),
           ),
          Expanded(
            child: ValueListenableBuilder<List<EventModel>>(
                  valueListenable: EventsStore.events,
                  builder: (context, events, _) {
                    final query = searchQuery.trim().toLowerCase();
                    final favorites = events
                        .where((event) =>
                            event.isFavorite &&
                            event.title.toLowerCase().contains(query))
                        .toList();
            
                    if (favorites.isEmpty) {
            return const Center(child: Text('No favorite events yet'));
                    }
            
                    return ListView.builder(
            padding: const EdgeInsets.only(top: 16),
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final event = favorites[index];
              return EventCard(
                key: ValueKey(event.id),
                title: event.title,
                date: event.date,
                category: event.category,
                isFavorite: event.isFavorite,
                onFavoriteChanged: (value) =>
                    EventsStore.setFavorite(event.id, value),
              );
            },
                    );
                  },
                ),
          )
        ],
      ),
    );
    
  
  }
}