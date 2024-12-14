import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lilac_machine_test/common/common_providers.dart';
import 'package:lilac_machine_test/core/constants/color_strings.dart';
import 'package:lilac_machine_test/core/utils/text_styles.dart';

class CustomButton extends ConsumerWidget {
  final String text;
  Widget? widget;
  double width;
  final VoidCallback onPressed;
  bool isLoading;
  bool isCanccel;

  CustomButton({
    required this.text,
    required this.onPressed,
    this.width = double.maxFinite,
    this.isLoading = false,
    this.isCanccel = false,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
      style: FilledButton.styleFrom(
        fixedSize: Size(width, 55),
        backgroundColor: isCanccel ? AppColors.background : AppColors.button,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: isCanccel
                ? const BorderSide(color: AppColors.button)
                : BorderSide.none),
      ),
      onPressed: onPressed,
      child: ref.watch(loadingProvider)
          ? const CupertinoActivityIndicator(
              color: AppColors.background,
            )
          : Text(
              text,
              style: AppTextStyles.button1,
            ),
    );
  }
}
