import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lilac_machine_test/core/constants/color_strings.dart';
import 'package:lilac_machine_test/core/utils/gaps.dart';
import 'package:lilac_machine_test/core/utils/text_styles.dart';

class DashBoardCardWidget extends StatelessWidget {
  final String image;
  final String count;
  final String title;
  final Color iconColor;
  final VoidCallback onTap;
  const DashBoardCardWidget({
    super.key,
    required this.image,
    required this.count,
    required this.title,
    required this.onTap,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: AppColors.background,
        elevation: .6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  // image: DecorationImage(
                  //     image: AssetImage(
                  //   logoVector,
                  // )),
                  color: iconColor,
                  shape: BoxShape.circle),
              child: Image.asset(
                image,
                color: AppColors.background,
              ),
            ),
            mediumVerticalGap(),
            // Image.asset(
            //   logoVector,
            //   color: AppColors.background,
            // ),
            Text(
              count,
              style: AppTextStyles.bodyBold,
            ),
            smallVerticalGap(),
            Text(
              title,
              style: AppTextStyles.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}
