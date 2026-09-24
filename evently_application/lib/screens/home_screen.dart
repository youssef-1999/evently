import 'package:evently_application/common/app_text_styles.dart';
import 'package:evently_application/theme/app_colors.dart';
import 'package:evently_application/widgets/home_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/home-screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: const HomeHeader(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          
          height: 40,
          child: ListView(
            
            scrollDirection: Axis.horizontal,
            children: [
      SizedBox(height: 24,),

              ChoiceChip(
                label: Text("All", style: AppTextStyles.styleW600s16(color: AppColors.lightColor),),
                selected: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                selectedColor: AppColors.secColor,
                showCheckmark: false,
                backgroundColor: AppColors.lightBgColor,
          
              ),
              SizedBox(width: 10,),
              ChoiceChip(
                label: Text("All", style: AppTextStyles.styleW600s16(color: AppColors.lightColor),),
                selected: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                selectedColor: AppColors.secColor,
                showCheckmark: false,
                backgroundColor: AppColors.lightBgColor,
          
              ),
              SizedBox(width: 10,),
          
              ChoiceChip(
                label: Text("All", style: AppTextStyles.styleW600s16(color: AppColors.lightColor),),
                selected: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                selectedColor: AppColors.secColor,
                showCheckmark: false,
                backgroundColor: AppColors.lightBgColor,
          
              ),
              SizedBox(width: 10,),
          
              ChoiceChip(
                label: Text("All", style: AppTextStyles.styleW600s16(color: AppColors.lightColor),),
                selected: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                selectedColor: AppColors.secColor,
                showCheckmark: false,
                backgroundColor: AppColors.lightBgColor,
          
              ),
            ],
          ),
        ),
      ),
    );
  }
}
