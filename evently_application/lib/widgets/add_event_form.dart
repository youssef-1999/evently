import 'package:evently_application/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddEventFormField extends StatelessWidget {
  const AddEventFormField({
    super.key,
    required this.label,
    this.hintText,
    this.controller,
    this.validator,
    this.maxLines = 1,
  });

  final String label;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        CustomTextFormField(
          hintText: hintText,
          controller: controller,
          validator: validator,
          maxLines: maxLines,
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }
}
