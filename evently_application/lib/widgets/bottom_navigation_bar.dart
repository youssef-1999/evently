import 'package:evently_application/l10n/app_localizations.dart';
import 'package:evently_application/gen/assets.gen.dart';
import 'package:evently_application/theme/app_colors.dart';
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    // In dark mode the active SVGs (drawn in secColor) are recolored to mainColor
    final activeIconFilter = isDark
        ? const ColorFilter.mode(AppColors.mainColor, BlendMode.srcIn)
        : null;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: isDark ? AppColors.darkBgColor : Colors.white,
      selectedItemColor: isDark ? AppColors.mainColor : null,
      unselectedItemColor: isDark ? const Color(0xFFB9B9B9) : null,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(Assets.images.homeLight),
          activeIcon: SvgPicture.asset(
            Assets.images.homeDark,
            colorFilter: activeIconFilter,
          ),
          label: l10n.home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.favorite_border),
          activeIcon: const Icon(Icons.favorite),
          label: l10n.favorite,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(Assets.images.user),
          activeIcon: SvgPicture.asset(
            Assets.images.userDark,
            colorFilter: activeIconFilter,
          ),
          label: l10n.profile,
        ),
      ],
    );
  }
}
