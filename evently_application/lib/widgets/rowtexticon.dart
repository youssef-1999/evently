import 'package:evently_application/common/app_text_styles.dart';
import 'package:flutter/material.dart';

class Rowtexticon extends StatelessWidget {
  const Rowtexticon({
    super.key,
    required this.text,
    this.icon,
    this.switchValue,
    this.onSwitchChanged,
    this.onTap,
    this.backgroundColor = Colors.white,
    this.textStyle,
  });

  final String text;
  final Widget? icon;
  final bool? switchValue;
  final ValueChanged<bool>? onSwitchChanged;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SizedBox(
            height: 40,
            child: Row(
              children: [
                Text(text, style: textStyle ?? AppTextStyles.styleW500s16()),
                const Spacer(),
                if (switchValue != null)
                  Switch(value: switchValue!, onChanged: onSwitchChanged),
                ?icon,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
