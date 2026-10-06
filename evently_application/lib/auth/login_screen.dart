import 'package:evently_application/l10n/app_localizations.dart';
import 'package:evently_application/common/app_text_styles.dart';
import 'package:evently_application/gen/assets.gen.dart';
import 'package:evently_application/models/user_model.dart';
import 'package:evently_application/auth/register_screen.dart';
import 'package:evently_application/screens/home_screen.dart';
import 'package:evently_application/service/firebase_auth_service.dart';
import 'package:evently_application/theme/app_colors.dart';
import 'package:evently_application/widgets/custom_text_form_field.dart';
import 'package:evently_application/widgets/main_button.dart';
import 'package:evently_application/widgets/snackbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:evently_application/provider/user_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: Padding(
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
                      l10n.loginTitle,
                      style: AppTextStyles.styleW600s24(
                        color: AppColors.mainColor,
                      ).copyWith(),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  label: l10n.email,
                  controller: emailController,
                  imagePath: Assets.images.sms,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return l10n.enterEmailError;
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  label: l10n.password,
                  controller: passwordController,
                  imagePath: Assets.images.lock,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return l10n.enterPasswordError;
                    } else if (value.length < 6) {
                      return l10n.passwordLengthError;
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        l10n.forgotPassword,
                        style: AppTextStyles.styleW600s14(
                          color: AppColors.mainColor,
                        ).copyWith(decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
                MainButton(
                  text: l10n.login,
                  isLoading: isLoading,
                  onPressed: () async {
                    bool isValid = formKey.currentState!.validate();
                    if (isValid) {
                      UserModel user = UserModel(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                      setState(() {
                        isLoading = true;
                      });
                      UserModel? userData = await FirebaseAuthService.login(
                        user,
                      );
                      setState(() {
                        isLoading = false;
                      });
                      if (!context.mounted) return;
                      if (userData != null) {
                        context.read<UserProvider>().setUser(userData);
                        Snackbar.successSnackbar(l10n.loginSuccess, context);
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          HomeScreen.routeName,
                          (route) => false,
                        );
                      } else {
                        Snackbar.errorSnackbar(
                          FirebaseAuthService.lastError ??
                              l10n.invalidCredentials,
                          context,
                        );
                        setState(() {
                          isLoading = false;
                        });
                      }
                    }
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: l10n.noAccount,
                        style: AppTextStyles.styleW400s14(
                          color: Theme.of(context).textTheme.bodySmall?.color,
                        ),
                        children: [
                          TextSpan(
                            text: l10n.register,
                            style: AppTextStyles.styleW400s14(
                              color: AppColors.mainColor,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(
                                  context,
                                ).pushNamed(RegisterScreen.routeName);
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Text(l10n.or, style: AppTextStyles.styleW400s14()),
                    Expanded(child: Divider()),
                  ],
                ),
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
                    onPressed: isLoading
                        ? null
                        : () async {
                            setState(() {
                              isLoading = true;
                            });
                            UserModel? userData =
                                await FirebaseAuthService.loginWithGoogle();
                            setState(() {
                              isLoading = false;
                            });
                            if (!context.mounted) return;
                            if (userData != null) {
                              context.read<UserProvider>().setUser(userData);
                              Snackbar.successSnackbar(
                                l10n.loginSuccess,
                                context,
                              );
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                HomeScreen.routeName,
                                (route) => false,
                              );
                            } else if (FirebaseAuthService.lastError != null) {
                              // null error = user cancelled the picker
                              Snackbar.errorSnackbar(
                                FirebaseAuthService.lastError!,
                                context,
                              );
                            }
                          },
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
                          l10n.loginWithGoogle,
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
