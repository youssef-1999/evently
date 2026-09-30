import 'package:evently_application/common/app_text_styles.dart';
import 'package:evently_application/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventPickerRow extends StatelessWidget {
  const EventPickerRow({
    super.key,
    required this.iconPath,
    required this.label,
    required this.actionText,
    this.onTap,
    this.validator,
  });

  final String iconPath;
  final String label;
  final String actionText;
  final Future<void> Function()? onTap;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: validator,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(iconPath),
                    const SizedBox(width: 8),
                    Text(label, style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
                GestureDetector(
                  onTap: () async {
                    await onTap?.call();
                    if (field.mounted && field.hasError) field.validate();
                  },
                  child: Text(
                    actionText,
                    style: AppTextStyles.styleW400s14(
                      color: AppColors.mainColor,
                    ).copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.mainColor,
                    ),
                  ),
                ),
              ],
            ),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  field.errorText!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
