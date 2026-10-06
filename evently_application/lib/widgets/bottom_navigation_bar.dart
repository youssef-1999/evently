import 'package:evently_application/l10n/app_localizations.dart';
import 'package:evently_application/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(Assets.images.homeLight),
          activeIcon: SvgPicture.asset(Assets.images.homeDark),
          label: l10n.home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.favorite_border),
          activeIcon: const Icon(Icons.favorite),
          label: l10n.favorite,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(Assets.images.user),
          activeIcon: SvgPicture.asset(Assets.images.userDark),
          label: l10n.profile,
        ),
      ],
    );
  }
}
