import 'package:evently_application/l10n/app_localizations.dart';
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
  static CategoriesEnum fromJson(String jsonName) {
    for (var category in CategoriesEnum.values) {
      if (category.name == jsonName) {
        return category;
      }
    }
    return CategoriesEnum.birthday; // Default value if no match is found
   
  }
  String getTitle(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (this) {
      case CategoriesEnum.birthday:
        return l10n.birthday;
      case CategoriesEnum.sport:
        return l10n.sport;
      case CategoriesEnum.gaming:
        return l10n.gaming;
      case CategoriesEnum.meeting:
        return l10n.meeting;
      case CategoriesEnum.eating:
        return l10n.eating;
    }
  }

  String toJson() {
    return name;
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
