import 'package:example_ui/app/theme/colors.dart';
import 'package:example_ui/features/auth/signIn/shared/horizontal_separator.dart';
import 'package:example_ui/features/auth/signIn/shared/social_media_icons.dart';
import 'package:example_ui/features/auth/signUp/signUpSetPassword/set_password_view.dart';
import 'package:example_ui/features/auth/signUp/sign_up_view_model.dart';
import 'package:example_ui/features/shared/services/string_service.dart';
import 'package:example_ui/features/shared/widgets/custom_button.dart';
import 'package:example_ui/features/shared/widgets/custom_page_route_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();

  SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SignUpViewModel>();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const Center(
              child: Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 80),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Full Name",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: nameController,
                    onChanged: viewModel.setName,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      hintText: "Enter full name",
                    ),
                    validator: (value) => StringService.isEmpty(value) ? "name can't be empty." : null,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Email Address",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: emailController,
                    onChanged: viewModel.setEmail,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      hintText: "Enter email address",
                    ),
                    validator: StringService.emailValidator,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.maxFinite,
              height: 56,
              child: CustomButton(
                onTap: () async {
                  if (formKey.currentState?.validate() ?? false) {
                    viewModel.setTempUser();
                    await Navigator.push(
                      context,
                      CustomPageRouteBuilder.sharedAxisTransition(
                        pageBuilder: (context, primaryAnimation, secondaryAnimation) => SetPasswordView(),
                      ),
                    );
                  }
                },
                label: "Continue",
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(color: WorkoutAppColors.grey0),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "Sign In",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const HorizontalSeparator(),
            const SizedBox(height: 32),
            const SocialMediaIcons(),
          ],
        ),
      ),
    );
  }
}
