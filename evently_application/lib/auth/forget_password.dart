import 'package:evently_application/gen/assets.gen.dart';
import 'package:evently_application/l10n/app_localizations.dart';
import 'package:evently_application/service/firebase_auth_service.dart';
import 'package:evently_application/widgets/custom_text_form_field.dart';
import 'package:evently_application/widgets/main_button.dart';
import 'package:evently_application/widgets/snackbar.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});
  // the email typed on the login screen can be passed as the route argument
  static const routeName = '/forget-password';

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final email = ModalRoute.of(context)?.settings.arguments;
    if (email is String && emailController.text.isEmpty) {
      emailController.text = email;
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future<void> resetPassword() async {
    final l10n = AppLocalizations.of(context)!;
    bool isValid = formKey.currentState!.validate();
    if (!isValid) return;
    setState(() {
      isLoading = true;
    });
    bool isSent = await FirebaseAuthService.sendPasswordResetEmail(
      emailController.text.trim(),
    );
    if (!mounted) return;
    setState(() {
      isLoading = false;
    });
    if (isSent) {
      Snackbar.successSnackbar(l10n.resetEmailSent, context);
      Navigator.pop(context);
    } else {
      Snackbar.errorSnackbar(
        FirebaseAuthService.lastError ?? l10n.resetPasswordFailed,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.forgetPassword)),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Image.asset(
                  isDark
                      ? Assets.images.forgetPasswordDark.path
                      : Assets.images.forgetPasswordLight.path,
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                  label: l10n.email,
                  controller: emailController,
                  imagePath: Assets.images.sms,
                  padding: EdgeInsets.zero,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return l10n.enterEmailError;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                MainButton(
                  text: l10n.resetPassword,
                  isLoading: isLoading,
                  onPressed: resetPassword,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
