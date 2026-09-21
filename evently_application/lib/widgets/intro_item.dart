import 'package:evently_application/common/app_text_styles.dart';
import 'package:flutter/material.dart';

class IntroItem extends StatelessWidget {
  final String image;
  final String title;
  final String? subtitle;
  const IntroItem({required this.image, required this.title, this.subtitle, super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Expanded(
          child: Image.asset(
            image,
            fit: BoxFit.contain,
            height: size.height * 0.15,
            
          ),
        ),
        const SizedBox(height: 10),
        Text(title, style: AppTextStyles.styleW600s20()),
        if (subtitle != null)
          Text(subtitle!, style: AppTextStyles.styleW400s16()),
      ],
    );
  }
}
