import 'package:evently_application/auth/login_screen.dart';
import 'package:evently_application/common/app_text_styles.dart';
import 'package:evently_application/gen/assets.gen.dart';
import 'package:evently_application/service/firebase_auth_service.dart';
import 'package:evently_application/theme/app_theme.dart';
import 'package:evently_application/widgets/rowtexticon.dart';
import 'package:flutter/material.dart';


class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
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
          child: Text('John Doe', style: AppTextStyles.styleW600s20()),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            'johnsafwat.route@gmail.com',
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
                  text: "Dark mode",
                  switchValue: mode == ThemeMode.dark,
                  onSwitchChanged: (value) {
                    AppTheme.themeMode.value = value
                        ? ThemeMode.dark
                        : ThemeMode.light;
                  },
                ),
              ),
              Rowtexticon(
                text: "Language",
                icon: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle tap
                },
              ),
              Rowtexticon(
                text: "Logout",
                icon: const Icon(Icons.logout, color: Colors.red),
                onTap: () {
                  // Handle tap
                  FirebaseAuthService.logout();
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
