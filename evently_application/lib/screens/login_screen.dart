import 'package:evently_application/common/app_text_styles.dart';
import 'package:evently_application/gen/assets.gen.dart';
import 'package:evently_application/models/user_model.dart';
import 'package:evently_application/screens/register_screen.dart';
import 'package:evently_application/service/firebase_auth_service.dart';
import 'package:evently_application/theme/app_colors.dart';
import 'package:evently_application/widgets/custom_text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController= TextEditingController();
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
                  const SizedBox(height: 40),
                  Image.asset(
                    Assets.images.evently.path,
                    fit: BoxFit.contain,
                    width: 142,
                    height: 27,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Text(
                        'Login to your account',
                        style: AppTextStyles.styleW600s24(color: AppColors.mainColor).copyWith(
                          
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(label: 'Email', 
                  controller: emailController,
                   imagePath: Assets.images.sms,
                   validator: (value) {
                     if (value == null || value.isEmpty) {
                       return 'Please enter your email';
                     }
                   }),
                  CustomTextFormField(label: 'Password',
                   controller: passwordController, imagePath: Assets.images.lock, isPassword: true, 
                   validator: (value) {
                     if (value == null || value.isEmpty) {
                       return 'Please enter your Password';
                     }
                     else if (value.length < 6) {
                       return 'Password must be at least 6 characters';
                     }
                   }),
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
              
                          'Forgot Password?',
                          style: AppTextStyles.styleW600s14(color: AppColors.mainColor)
                              .copyWith(decoration: TextDecoration.underline),
              
                        ),
                      ),
                    ],
                  ), 
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child:isLoading? CircularProgressIndicator(color: AppColors.lightBgColor,): Text(
                        'Login',
                        style: AppTextStyles.styleW500s20(color: AppColors.lightBgColor),
                      ),
                      onPressed: isLoading?null:() async{
                        bool isValid = formKey.currentState!.validate();
                        if(isValid){
                          UserModel user=UserModel(email: emailController.text.trim(), password: passwordController.text.trim());
                          setState(() {
                            isLoading=true;
                          });
                     UserModel? userData=  await FirebaseAuthService.login(user);
                          setState(() {
                            isLoading=true;
                          });
                        }
                        if (formKey.currentState!.validate()) {
                          print('Sucesss login');
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
             text: "Don't have an account? ",
             style: AppTextStyles.styleW400s14(color: AppColors.lightTextColor),
             children: [
               TextSpan(
          text: "Register",
          style: AppTextStyles.styleW400s14(color: AppColors.mainColor),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.of(context)
                  .pushNamed(RegisterScreen.routeName);
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
                  const SizedBox(height: 50),
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
                            'Login with Google',
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
