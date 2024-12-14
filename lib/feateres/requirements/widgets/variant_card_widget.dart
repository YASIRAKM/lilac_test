import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lilac_machine_test/core/constants/color_strings.dart';
import 'package:lilac_machine_test/core/utils/gaps.dart';
import 'package:lilac_machine_test/core/utils/text_styles.dart';

class VariantCardWidget extends StatelessWidget {
  final String image;

  final String title;

  final VoidCallback onTap;
  const VariantCardWidget({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: AppColors.background,
        elevation: .5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              // color: AppColors.background,
            ),
            mediumVerticalGap(),
            Text(
              title,
              style: AppTextStyles.subtitle2,
            ),
          ],
        ),
      ),
    );
  }
}
