import 'package:evently_application/l10n/app_localizations.dart';
import 'package:evently_application/auth/login_screen.dart';
import 'package:evently_application/common/app_text_styles.dart';
import 'package:evently_application/gen/assets.gen.dart';
import 'package:evently_application/provider/user_provider.dart';
import 'package:evently_application/screens/onboarding_screens.dart';
import 'package:evently_application/service/firebase_auth_service.dart';
import 'package:evently_application/theme/app_theme.dart';
import 'package:evently_application/widgets/rowtexticon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              Assets.images.routeProfile.path,
              width: 100,
              height: 100,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(context.watch<UserProvider>().user?.name ?? '', style: AppTextStyles.styleW600s20()),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            context.watch<UserProvider>().user?.email ?? '',
            style: AppTextStyles.styleW400s14(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
          child: Column(
            spacing: 12,
            children: [
              ValueListenableBuilder<ThemeMode>(
                valueListenable: AppTheme.themeMode,
                builder: (context, mode, _) => Rowtexticon(
                  text: l10n.darkMode,
                  switchValue: mode == ThemeMode.dark,
                  onSwitchChanged: (value) {
                    AppTheme.themeMode.value = value
                        ? ThemeMode.dark
                        : ThemeMode.light;
                  },
                ),
              ),
              Rowtexticon(
                text: l10n.language,
                icon: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle tap
                },
              ),
              Rowtexticon(
                text: l10n.logout,
                icon: const Icon(Icons.logout, color: Colors.red),
                onTap: () {
                  // Handle tap
                  FirebaseAuthService.logout();
                  Navigator.pushNamed(context, OnboardingScreens.routeName);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
