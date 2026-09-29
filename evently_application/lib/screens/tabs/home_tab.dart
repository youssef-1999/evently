import 'package:evently_application/enum/categories_enum.dart';
import 'package:evently_application/models/event_model.dart';
import 'package:evently_application/service/events_store.dart';
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

  @override
  Widget build(BuildContext context) {
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
          child: ValueListenableBuilder<List<EventModel>>(
            valueListenable: EventsStore.events,
            builder: (context, events, _) {
              final filteredEvents = selectedCategory == null
                  ? events
                  : events
                      .where((event) => event.category == selectedCategory)
                      .toList();

              if (filteredEvents.isEmpty) {
                return const Center(child: Text('No events in this category'));
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
                    onFavoriteChanged: (value) =>
                        EventsStore.setFavorite(event.id, value),
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
