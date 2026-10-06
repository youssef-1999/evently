import 'package:evently_application/l10n/app_localizations.dart';
import 'package:evently_application/common/app_text_styles.dart';
import 'package:evently_application/models/event_model.dart';
import 'package:evently_application/screens/event_details_screen.dart';
import 'package:evently_application/service/event_service.dart';
import 'package:evently_application/widgets/event_card.dart';
import 'package:flutter/material.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  String searchQuery = '';
  final eventsStream = EventService.getEventsStream();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
            decoration: InputDecoration(
              hintText: l10n.searchEvents,
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
          child: StreamBuilder<List<EventModel>>(
            stream: eventsStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text(l10n.errorMessage('${snapshot.error}')));
              }
              final events = snapshot.data ?? [];
              final query = searchQuery.trim().toLowerCase();
              final favorites = events
                  .where(
                    (event) =>
                        event.isFavorite &&
                        event.title.toLowerCase().contains(query),
                  )
                  .toList();

              if (favorites.isEmpty) {
                return Center(child: Text(l10n.noFavorites));
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
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EventDetailsScreen(event: event),
                      ),
                    ),
                    onFavoriteChanged: (value) => EventService.updateEvent(
                      event.copyWith(isFavorite: value),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
