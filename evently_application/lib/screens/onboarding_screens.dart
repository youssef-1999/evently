import 'package:evently_application/l10n/app_localizations.dart';
import 'package:evently_application/common/app_text_styles.dart';
import 'package:evently_application/gen/assets.gen.dart';
import 'package:evently_application/models/intro_model.dart';
import 'package:evently_application/auth/login_screen.dart';
import 'package:evently_application/theme/app_colors.dart';
import 'package:evently_application/widgets/intro_item.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreens extends StatefulWidget {
  static const String routeName = '/OnboardingScreens';

  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  List<IntroModel> _buildIntroItems(AppLocalizations l10n) => [
    IntroModel(
      image: Assets.images.a2ndIntro.path,
      darkImage: Assets.images.a2ndIntroWhite.path,
      title: l10n.onboarding1Title,
      subtitle:
          l10n.onboarding1Subtitle,
    ),
    IntroModel(
      image: Assets.images.a3rdIntro.path,
      darkImage: Assets.images.a3rdIntroWhite.path,
      title: l10n.onboarding2Title,
      subtitle:
          l10n.onboarding2Subtitle,
    ),
    IntroModel(
      image: Assets.images.a4thIntro.path,
      darkImage: Assets.images.a4thIntroWhite.path,
      title: l10n.onboarding3Title,
      subtitle:
          l10n.onboarding3Subtitle,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPreviousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _goToNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _goToLogin() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      LoginScreen.routeName,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    // secColor is too dark to read on the dark background, so use mainColor there.
    final accent = isDark ? AppColors.mainColor : AppColors.secColor;
    final l10n = AppLocalizations.of(context)!;
    final introItems = _buildIntroItems(l10n);
    final isLastPage = _currentIndex == introItems.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Fixed height so the layout doesn't jump when the arrow appears.
              SizedBox(
                height: kMinInteractiveDimension,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      Assets.images.evently.path,
                      fit: BoxFit.contain,
                      width: 142,
                      height: 27,
                    ),
                    if (_currentIndex > 0)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: _goToPreviousPage,
                          icon: Icon(Icons.arrow_back_ios_new, color: accent),
                        ),
                      ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _goToLogin,
                    child: Text(
                      l10n.skip,
                      style: AppTextStyles.styleW600s14(color: accent),
                    ),
                  ),
                ],
              ),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: introItems.length,
                  onPageChanged: (index) =>
                      setState(() => _currentIndex = index),
                  itemBuilder: (context, index) => IntroItem(
                    image: isDark
                        ? introItems[index].darkImage
                        : introItems[index].image,
                    title: introItems[index].title,
                    subtitle: introItems[index].subtitle,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: accent),
                onPressed: isLastPage ? _goToLogin : _goToNextPage,
                child: Text(
                  isLastPage ? l10n.finish : l10n.next,
                  style: AppTextStyles.styleW600s16(
                    color: AppColors.lightBgColor,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedSmoothIndicator(
                    activeIndex: _currentIndex,
                    count: introItems.length,
                    onDotClicked: (index) => _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    ),
                    effect: ExpandingDotsEffect(
                      // activeDotColor: AppColors.goldColor,
                      dotWidth: 7,
                      dotHeight: 10,
                      spacing: 5,
                      // dotColor: AppColors.goldColor.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
