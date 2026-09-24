import 'package:evently_application/common/app_text_styles.dart';
import 'package:evently_application/gen/assets.gen.dart';
import 'package:evently_application/models/user_model.dart';
import 'package:evently_application/auth/login_screen.dart';
import 'package:evently_application/service/firebase_auth_service.dart';
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
    TextEditingController nameController=TextEditingController();
    TextEditingController emailController=TextEditingController();
  TextEditingController passwordController= TextEditingController();
  TextEditingController rePasswordController= TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading=false;
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
                 controller: nameController,
                 imagePath: Assets.images.user,
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                     return 'Please enter your Name';
                   }
                 }),
                const SizedBox(height: 20),

                CustomTextFormField(label: 'Enter your Email', 
                 controller: emailController,
                 imagePath: Assets.images.sms,
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                     return 'Please enter your email';
                   }
                 }),
                const SizedBox(height: 20),
                CustomTextFormField(label: 'Enter your Password',
                 controller: passwordController,
                 imagePath: Assets.images.lock, isPassword: true, 
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                     return 'Please enter your Password';
                   }
                   else if (value.length < 6) {
                     return 'Password must be at least 6 characters';
                   }
                 }),
                const SizedBox(height: 20),
                CustomTextFormField(label: 'Confirm your Password',
                 controller: rePasswordController,
                 imagePath: Assets.images.lock, isPassword: true, 
                 validator: (value) {
                   if (value!=passwordController.text.trim()) {
                     return "Password doesn't match  ";
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
                   onPressed:isLoading ? null :() async{
                        bool isValid = formKey.currentState!.validate();
                        if(isValid){
                          UserModel user=UserModel(email: emailController.text.trim(), password: passwordController.text.trim(), name: nameController.text.trim(),);
                          setState(() {
                            isLoading=true;
                          });
                          UserModel? userData = await FirebaseAuthService.register(user);
                          setState(() {
                            isLoading=false;
                          });
                          if(!context.mounted) return;
                          if(userData!=null){
                             ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Register success',style:AppTextStyles.styleW400s16(color: Colors.white)),backgroundColor: Colors.green,),
                            );
                            Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                          }
                          else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(FirebaseAuthService.lastError ?? 'Register failed',style:AppTextStyles.styleW400s16(color: Colors.white)),backgroundColor: Colors.red,),
                            );
                          }
                          
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
