import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lilac_machine_test/common/common_providers.dart';
import 'package:lilac_machine_test/core/constants/color_strings.dart';
import 'package:lilac_machine_test/core/utils/text_styles.dart';

class CustomTextField extends ConsumerWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final IconData? prefixIcon;
  final bool obscureText;
  final bool isReadOnly;
  final int maxLines;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  bool validate;

  CustomTextField({
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.prefixIcon,
    this.obscureText = false,
    this.isReadOnly = false,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.validate = false,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPasswordVisible = ref.watch(passwordVisibilityProvider);

    return TextFormField(
      controller: controller,
      obscureText: obscureText ? !isPasswordVisible : false,
      keyboardType: keyboardType,
      validator: validate
          ? (value) {
              if (value == null || value.isEmpty) {
                return '$labelText is required';
              }
              if (labelText == 'Email' &&
                  !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                      .hasMatch(value)) {
                return 'Please enter a valid email';
              }

              // You can add custom validation logic for other fields if needed
              return null;
            }
          : null,
      readOnly: isReadOnly,
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true, fillColor: AppColors.fadedTextColor,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        // labelText: labelText,
        hintText: hintText, hintStyle: AppTextStyles.hintText,
        prefixIcon: prefixIcon == null
            ? null
            : Icon(prefixIcon, color: AppColors.textFieldBorder),
        suffixIcon: obscureText
            ? IconButton(
                icon: Icon(
                  isPasswordVisible
                      ? CupertinoIcons.eye_slash
                      : CupertinoIcons.eye,
                  color: AppColors.textFieldBorder,
                ),
                onPressed: () {
                  // Toggle the password visibility when the icon is pressed
                  ref.read(passwordVisibilityProvider.notifier).state =
                      !isPasswordVisible;
                },
              )
            : suffixIcon,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius:
              BorderRadius.all(Radius.circular(10)), // Make edges rounded
        ),
      ),
    );
  }
}
