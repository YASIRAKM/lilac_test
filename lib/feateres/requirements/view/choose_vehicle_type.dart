import 'package:flutter/material.dart';
import 'package:lilac_machine_test/core/constants/color_strings.dart';
import 'package:lilac_machine_test/core/constants/image_string.dart';
import 'package:lilac_machine_test/core/utils/gaps.dart';
import 'package:lilac_machine_test/core/utils/text_styles.dart';
import 'package:lilac_machine_test/feateres/requirements/widgets/variant_card_widget.dart';

class ChooseVariant extends StatelessWidget {
  const ChooseVariant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const Text(
          "What whould you prefer to have ?",
          style: AppTextStyles.appBartitle,
        ),
      ),
      backgroundColor: AppColors.background,
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        children: [
          VariantCardWidget(
            image: carIcon,
            title: "Car ",
            onTap: () {},
          ),
          VariantCardWidget(
            image: bikeIcon,
            title: "Bike ",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
