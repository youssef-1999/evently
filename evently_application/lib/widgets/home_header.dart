import 'package:evently_application/l10n/app_localizations.dart';
import 'package:evently_application/common/app_language.dart';
import 'package:evently_application/common/app_text_styles.dart';
import 'package:evently_application/gen/assets.gen.dart';
import 'package:evently_application/theme/app_colors.dart';
import 'package:evently_application/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';


class HomeHeader extends StatelessWidget implements PreferredSizeWidget {
  const HomeHeader({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 72,
      title: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                AppLocalizations.of(context)!.welcomeBack,
                style: AppTextStyles.styleW400s14(
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
              ),
              Text(
                context.watch<UserProvider>().user?.name ?? '',
                style: AppTextStyles.styleW500s20(
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Assets.images.sun,
                  colorFilter: ColorFilter.mode(
                    AppColors.mainColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              ElevatedButton(
                // toggle between English and Arabic
                onPressed: () => AppLanguage.locale.value = isArabic
                    ? const Locale('en')
                    : const Locale('ar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.mainColor,
                  foregroundColor: AppColors.lightColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                // shows the language you'll switch to
                child: Text(isArabic ? "En" : "Ar"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
