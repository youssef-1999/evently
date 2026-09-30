import 'package:evently_application/enum/categories_enum.dart';
import 'package:evently_application/gen/assets.gen.dart';
import 'package:evently_application/provider/new_event_provider.dart';
import 'package:evently_application/theme/app_colors.dart';
import 'package:evently_application/widgets/add_event_form.dart';
import 'package:evently_application/widgets/custom_choice_chip.dart';
import 'package:evently_application/widgets/event_picker_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});
  static const routeName = '/add-event-screen';
  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
 
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> pickDate(NewEventProvider provider) async {
    final date = await showDatePicker(
      context: context,
      initialDate: provider.selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date != null) {
      provider.setSelectedDate(date);
    }
  }

  Future<void> pickTime(NewEventProvider provider) async {
    final time = await showTimePicker(
      context: context,
      initialTime: provider.selectedTime ?? TimeOfDay.now(),
    );
    if (time != null) {
      provider.setSelectedTime(time);
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return ChangeNotifierProvider(
      create: (_) => NewEventProvider(),
      child: Builder(
        builder: (ctx) {
         NewEventProvider provider= Provider.of<NewEventProvider>(ctx, listen: true);
         NewEventProvider provider2= Provider.of<NewEventProvider>(ctx, listen: false);
          return Scaffold(
            appBar: AppBar(title: const Text('Add Event')),
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
              
                        child: Image.asset(
                          provider.selectedCategory.getImage(isDark: isDark),
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 40,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: CategoriesEnum.values.map((category) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: CustomChoiceChip(categoriesEnum: category),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      AddEventFormField(
                        label: 'Title',
                        hintText: 'Event Title',
                        controller: titleController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a title';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      AddEventFormField(
                        label: 'Description',
                        hintText: 'Event Description',
                        controller: descriptionController,
                        maxLines: 5,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a description';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      EventPickerRow(
                        iconPath: Assets.images.calendarAdd,
                        label: 'Event Date',
                        actionText: provider.selectedDate == null
                            ? 'Select Date'
                            : MaterialLocalizations.of(
                                context,
                              ).formatCompactDate(provider.selectedDate!),
                        onTap: () => pickDate(provider2),
                        validator: (value) {
                          if (provider.selectedDate == null) {
                            return 'Please select a date';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      EventPickerRow(
                        iconPath: Assets.images.clock,
                        label: 'Event Time',
                        actionText: provider.selectedTime == null
                            ? 'Select Time'
                            : provider.selectedTime!.format(context),
                        onTap: () => pickTime(provider2),
                        validator: (value) {
                          if (provider.selectedTime == null) {
                            return 'Please select a time';
                          }
                          return null;
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secColor,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        onPressed: () {
                         bool isValid = formKey.currentState?.validate() ?? false;
                          if (isValid) {
                            // Handle form submission
                            // You can access the values using titleController.text, descriptionController.text, selectedDate, and selectedTime
                            // For example, you can print them to the console:
                            print('Title: ${titleController.text}');
                            print('Description: ${descriptionController.text}');
                            print('Date: ${provider.selectedDate}');
                            print('Time: ${provider.selectedTime}');
                          }
                        },
                        child: const Text(
                          'Save',
                          style: TextStyle(color: AppColors.lightColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
