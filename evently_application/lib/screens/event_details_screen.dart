import 'package:evently_application/common/app_text_styles.dart';
import 'package:evently_application/gen/assets.gen.dart';
import 'package:evently_application/l10n/app_localizations.dart';
import 'package:evently_application/models/event_model.dart';
import 'package:evently_application/screens/add_event.dart';
import 'package:evently_application/service/event_service.dart';
import 'package:evently_application/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({super.key, required this.event});

  final EventModel event;

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  // listen to the event so edits show up as soon as we come back
  late final eventStream = EventService.getEventStream(widget.event.id);

  Future<void> deleteEvent(EventModel event) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.deleteEvent),
        content: Text(l10n.deleteEventConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(
              l10n.delete,
              style: const TextStyle(color: AppColors.errorColor),
            ),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;
    Navigator.pop(context);
    EventService.deleteEvent(event.id);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return StreamBuilder<EventModel?>(
      stream: eventStream,
      initialData: widget.event,
      builder: (context, snapshot) {
        // null once the event has been deleted
        final event = snapshot.data ?? widget.event;
        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.eventDetails),
            actions: [
              IconButton(
                icon: const Icon(Icons.edit_outlined),
                color: AppColors.mainColor,
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AddEvent(event: event)),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline),
                color: AppColors.errorColor,
                onPressed: () => deleteEvent(event),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: _EventDetailsBody(event: event),
          ),
        );
      },
    );
  }
}

class _EventDetailsBody extends StatelessWidget {
  const _EventDetailsBody({required this.event});

  final EventModel event;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final locale = Localizations.localeOf(context).toString();
    final dateTime = event.dateTime;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            event.category.getImage(isDark: isDark),
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        const SizedBox(height: 16),
        Text(event.title, style: theme.textTheme.headlineSmall),
        const SizedBox(height: 16),
        _DetailsBox(
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SvgPicture.asset(Assets.images.calendarAdd),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dateTime == null
                        // older events only have the short card date
                        ? event.date.replaceAll('\n', ' ')
                        : DateFormat('d MMMM', locale).format(dateTime),
                    style: AppTextStyles.styleW500s16(
                      color: theme.textTheme.bodyLarge?.color,
                    ),
                  ),
                  if (dateTime != null)
                    Text(
                      TimeOfDay.fromDateTime(dateTime).format(context),
                      style: AppTextStyles.styleW400s14(
                        color: AppColors.lightSecTextColor,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(l10n.description, style: theme.textTheme.titleMedium),
        const SizedBox(height: 8),
        _DetailsBox(
          child: Text(event.description, style: theme.textTheme.bodySmall),
        ),
      ],
    );
  }
}

class _DetailsBox extends StatelessWidget {
  const _DetailsBox({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkBgColor : AppColors.lightColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark
              ? AppColors.darkborderColor
              : AppColors.lightborderColor,
        ),
      ),
      child: child,
    );
  }
}
