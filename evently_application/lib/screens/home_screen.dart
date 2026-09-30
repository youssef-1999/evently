import 'package:evently_application/screens/add_event.dart';
import 'package:evently_application/screens/tabs/favorite_tab.dart';
import 'package:evently_application/screens/tabs/home_tab.dart';
import 'package:evently_application/screens/tabs/profile_tab.dart';
import 'package:evently_application/theme/app_colors.dart';
import 'package:evently_application/widgets/bottom_navigation_bar.dart';
import 'package:evently_application/widgets/home_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/home-screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> tabs = const [
    HomeTab(),
    FavoriteTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const HomeHeader(),
      // IndexedStack keeps each tab's state (scroll, selected chip) when switching
      body: IndexedStack(
        index: currentIndex,
        children: tabs,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle FAB press
          Navigator.pushNamed(context, AddEvent.routeName);
        },
        backgroundColor: AppColors.mainColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
