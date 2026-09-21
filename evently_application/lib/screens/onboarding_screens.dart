import 'package:evently_application/gen/assets.gen.dart';
import 'package:evently_application/models/intro_model.dart';
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

  final List<IntroModel> _introItems = [
    IntroModel(
      image: Assets.images.a2ndIntro.path,
      title: 'Find Events That Inspire You',
      subtitle: "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
    ),
    IntroModel(
      image: Assets.images.a3rdIntro.path,
      title: 'Effortless Event Planning',
      subtitle: "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
    ),
    IntroModel(
      image: Assets.images.a4thIntro.path,
      title: 'Connect with Friends & Share Moments',
      subtitle: 'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.',
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

  void _finishIntro() {
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => const HomeScreen()),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                Assets.images.evently.path,
                fit: BoxFit.contain,
                width: 142,
                height: 27,
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _introItems.length,
                  onPageChanged: (index) => setState(() => _currentIndex = index),
                  itemBuilder: (context, index) => IntroItem(
                    image: _introItems[index].image,
                    title: _introItems[index].title,
                    subtitle: _introItems[index].subtitle,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedSmoothIndicator(
                    activeIndex: _currentIndex,
                    count: _introItems.length,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: _currentIndex != 0,
                    child: TextButton(
                      onPressed: _currentIndex == 0 ? null : _goToPreviousPage,
                      child: Text(
                        'Previous',
                        // style: TextStyle(
                        //   color: _currentIndex == 0
                        //       ? AppColors.goldColor.withValues(alpha: 0.5)
                        //       : AppColors.goldColor,
                        //   fontSize: 16,
                        //   fontWeight: FontWeight.bold,
                        // ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: _currentIndex == _introItems.length - 1
                        ? _finishIntro
                        : _goToNextPage,
                    child: Text(
                      _currentIndex == _introItems.length - 1
                          ? 'Finish'
                          : 'Next',
                      style: const TextStyle(
                        // color: AppColors.goldColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
