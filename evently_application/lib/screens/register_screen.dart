import 'package:evently_application/common/app_text_styles.dart';
import 'package:evently_application/gen/assets.gen.dart';
import 'package:evently_application/screens/login_screen.dart';
import 'package:evently_application/theme/app_colors.dart';
import 'package:evently_application/widgets/custom_text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const routeName = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      
       Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Image.asset(
                  Assets.images.evently.path,
                  fit: BoxFit.contain,
                  width: 142,
                  height: 27,
                ),
                const SizedBox(height: 20),
                Text(
                  'Create your account',
                  style: AppTextStyles.styleW600s24(color: AppColors.mainColor),
                ),
                const SizedBox(height: 20),
                 CustomTextFormField(label: 'Enter your Name', 
                 imagePath: Assets.images.user,
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                     return 'Please enter your Name';
                   }
                 }),
                const SizedBox(height: 20),

                CustomTextFormField(label: 'Enter your Email', 
                 imagePath: Assets.images.sms,
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                     return 'Please enter your email';
                   }
                 }),
                const SizedBox(height: 20),
                CustomTextFormField(label: 'Enter your Password', imagePath: Assets.images.lock, isPassword: true, 
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                     return 'Please enter your Password';
                   }
                   else if (value.length < 6) {
                     return 'Password must be at least 6 characters';
                   }
                 }),
                const SizedBox(height: 20),
                CustomTextFormField(label: 'Confirm your Password', imagePath: Assets.images.lock, isPassword: true, 
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                     return 'Please enter your Password';
                   }
                   else if (value.length < 6) {
                     return 'Password must be at least 6 characters';
                   }
                 }),
               SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Sign up',
                      style: AppTextStyles.styleW500s20(color: AppColors.lightBgColor),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        print('Sucesss Register');
                        // Form is valid, perform login logic here
                      }
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   RichText(
  text: TextSpan(
    text: "Already  have an account? ",

        style: AppTextStyles.styleW400s14(color: AppColors.lightTextColor),
    children: [
      TextSpan(
        text: "Login",
        style: AppTextStyles.styleW400s14(color: AppColors.mainColor),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            Navigator.of(context)
                .pushNamed(LoginScreen.routeName);
          },
      ),
    ],
  ),
)
                  ],
                ),
                const SizedBox(height: 20),
                Row(
children: [
  Expanded(child: Divider()), 
  Text(
    'Or',
    style: AppTextStyles.styleW400s14(),
  ),
  Expanded(child: Divider()), 
],
                )
                ,
                const SizedBox(height: 72),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.lightColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.images.google.path,
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Sign up  with Google',
                          style: AppTextStyles.styleW400s14(),
                        ),
                      ],
                    ),
                  ),
                ),

            
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
