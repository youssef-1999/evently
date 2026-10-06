import 'package:evently_application/l10n/app_localizations.dart';
import 'package:evently_application/enum/categories_enum.dart';
import 'package:evently_application/models/event_model.dart';
import 'package:evently_application/screens/event_details_screen.dart';
import 'package:evently_application/service/event_service.dart';
import 'package:evently_application/widgets/custom_choice_chip.dart';
import 'package:evently_application/widgets/event_card.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  // null means "All"
  CategoriesEnum? selectedCategory;
  final eventsStream = EventService.getEventsStream();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        const SizedBox(height: 24),
        SizedBox(
          height: 40,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CustomChoiceChip(
                  isSelected: selectedCategory == null,
                  onSelected: (selected) {
                    setState(() {
                      selectedCategory = null;
                    });
                  },
                ),
              ),
              ...CategoriesEnum.values.map((category) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CustomChoiceChip(
                    categoriesEnum: category,
                    isSelected: selectedCategory == category,
                    onSelected: (selected) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                  ),
                );
              })
            ],
          ),
        ),
        const SizedBox(height: 16),
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

              final filteredEvents = selectedCategory == null
                  ? events
                  : events
                      .where((event) => event.category == selectedCategory)
                      .toList();

              if (filteredEvents.isEmpty) {
                return Center(child: Text(l10n.noEventsInCategory));
              }

              return ListView.builder(
                itemCount: filteredEvents.length,
                itemBuilder: (context, index) {
                  final event = filteredEvents[index];
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
                    onFavoriteChanged: (value) =>
                        EventService.updateEvent(event.copyWith(isFavorite: value)),
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
