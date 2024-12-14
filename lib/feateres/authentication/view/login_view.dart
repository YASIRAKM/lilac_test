import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lilac_machine_test/core/constants/image_string.dart';
import 'package:lilac_machine_test/core/utils/gaps.dart';
import 'package:lilac_machine_test/core/utils/show_message.dart';
import 'package:lilac_machine_test/core/utils/text_styles.dart';
import 'package:lilac_machine_test/core/widgets/custom_button.dart';
import 'package:lilac_machine_test/core/widgets/custom_text_field.dart';
import 'package:lilac_machine_test/data/repository.dart';
import 'package:lilac_machine_test/feateres/authentication/view_model/auth_provider.dart';
import 'package:lilac_machine_test/main.dart';

class LoginView extends ConsumerWidget {
  LoginView({super.key});
  final mail = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * .1,
          left: MediaQuery.sizeOf(context).width * .05,
          right: MediaQuery.sizeOf(context).width * .05,
        ),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                loginLogo,
                height: 200,
                width: 200,
              ),
              const Text(
                "Login With Your Email &\n Password",
                style: AppTextStyles.title,
                textAlign: TextAlign.center,
              ),
              mediumVerticalGap(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Email",
                    style: AppTextStyles.bodyBold, textAlign: TextAlign.left),
              ),
              smallVerticalGap(),
              CustomTextField(
                labelText: "Email",
                hintText: "Enter your Email here ",
                controller: mail,
                prefixIcon: Iconsax.message,
                validate: true,
              ),
              mediumVerticalGap(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: AppTextStyles.bodyBold,
                ),
              ),
              smallVerticalGap(),
              CustomTextField(
                labelText: "password",
                hintText: "Enter your Email here ",
                validate: true,
                controller: password,
                prefixIcon: Iconsax.password_check,
                obscureText: true,
              ),
              smallVerticalGap(),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {}, child: const Text("Forgot Password?")),
              ),
              const Spacer(),
              CustomButton(
                text: "Login",
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    ref
                        .read(authProvder.notifier)
                        .login(email: mail.text, password: password.text);
                    mail.clear();
                    password.clear();
                  }
                },
              ),
              smallVerticalGap(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Dont have an account?"),
                  TextButton(onPressed: () {}, child: const Text("Register"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
