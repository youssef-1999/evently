import 'package:evently_application/gen/assets.gen.dart';
import 'package:flutter/material.dart';

enum CategoriesEnum {
  birthday(title: "birthday"),
  sport(title: "sport"),
  gaming(title: "gaming"),
  meeting(title: "meeting"),
  eating(title: "eating");

  final String title;

  const CategoriesEnum({
    required this.title,
  });

  // Images without a suffix are the dark versions, "-1" images are the light versions.
  String getImage({required bool isDark}) {
    switch (this) {
      case CategoriesEnum.birthday:
        return isDark
            ? Assets.images.birthday.path
            : Assets.images.birthday1.path;
      case CategoriesEnum.sport:
        return isDark ? Assets.images.sport.path : Assets.images.sport1.path;
      case CategoriesEnum.gaming:
        return isDark
            ? Assets.images.bookClub.path
            : Assets.images.bookClub1.path;
      case CategoriesEnum.meeting:
        return isDark
            ? Assets.images.meeting.path
            : Assets.images.meeting1.path;
      case CategoriesEnum.eating:
        return isDark
            ? Assets.images.exhibition.path
            : Assets.images.exhibition1.path;
    }
  }

  IconData get getIcon {
    switch (this) {
      case CategoriesEnum.birthday:
        return Icons.cake;
      case CategoriesEnum.sport:
        return Icons.pedal_bike_rounded;
      case CategoriesEnum.gaming:
        return Icons.sports_esports;
      case CategoriesEnum.meeting:
        return Icons.groups;
      case CategoriesEnum.eating:
        return Icons.restaurant;
    }
  }
}
