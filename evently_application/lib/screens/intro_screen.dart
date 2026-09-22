import 'package:evently_application/common/app_text_styles.dart';
import 'package:evently_application/screens/onboarding_screens.dart';
import 'package:evently_application/theme/app_colors.dart';
import 'package:evently_application/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:evently_application/gen/assets.gen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    // secColor is too dark to read on the dark background, so use mainColor there.
    final accent = isDark ? AppColors.mainColor : AppColors.secColor;

    ButtonStyle toggleStyle({required bool selected}) =>
        ElevatedButton.styleFrom(
          backgroundColor: selected ? accent : theme.scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: accent),
          ),
        );

    Color toggleForeground({required bool selected}) =>
        selected ? AppColors.lightBgColor : accent;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        Assets.images.evently.path,
                        fit: BoxFit.contain,
                        width: 142,
                        height: 27,
                      ),
                      const SizedBox(height: 25),
                      Image.asset(
                        isDark
                            ? Assets.images.a1stIntroWhite.path
                            : Assets.images.a1stIntro.path,
                        fit: BoxFit.cover,
                        width: 343,
                        height: 443,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Personalize Your Experience",
                        style: theme.textTheme.headlineMedium,
                      ),
                      Text(
                        "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
                        style: theme.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Language",
                            style: AppTextStyles.styleW500s18(color: accent),
                          ),
                          // Flexible + FittedBox shrinks the buttons on narrow
                          // screens instead of overflowing the row.
                          Flexible(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ElevatedButton(
                                    style: toggleStyle(selected: true),
                                    child: Text(
                                      "English",
                                      style: AppTextStyles.styleW600s16(
                                        color: toggleForeground(selected: true),
                                      ),
                                    ),
                                    onPressed: () {},
                                  ),
                                  const SizedBox(width: 8),
                                  ElevatedButton(
                                    style: toggleStyle(selected: false),
                                    child: Text(
                                      "Arabic",
                                      style: AppTextStyles.styleW600s16(
                                        color: toggleForeground(
                                          selected: false,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Theme",
                            style: AppTextStyles.styleW500s18(color: accent),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ElevatedButton(
                                style: toggleStyle(selected: !isDark),
                                child: SvgPicture.asset(
                                  Assets.images.sun,
                                  fit: BoxFit.contain,
                                  width: 24,
                                  height: 24,
                                  colorFilter: ColorFilter.mode(
                                    toggleForeground(selected: !isDark),
                                    BlendMode.srcIn,
                                  ),
                                ),
                                onPressed: () =>
                                    AppTheme.themeMode.value = ThemeMode.light,
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                style: toggleStyle(selected: isDark),
                                child: SvgPicture.asset(
                                  Assets.images.moon,
                                  fit: BoxFit.contain,
                                  width: 24,
                                  height: 24,
                                  colorFilter: ColorFilter.mode(
                                    toggleForeground(selected: isDark),
                                    BlendMode.srcIn,
                                  ),
                                ),
                                onPressed: () =>
                                    AppTheme.themeMode.value = ThemeMode.dark,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: accent),
                  onPressed: () {
                    Navigator.pushNamed(context, OnboardingScreens.routeName);
                    print("Next");
                  },
                  child: Text(
                    "Next",
                    style: AppTextStyles.styleW600s16(
                      color: AppColors.lightBgColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
