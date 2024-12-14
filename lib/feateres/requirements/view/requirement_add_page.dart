import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lilac_machine_test/core/constants/color_strings.dart';
import 'package:lilac_machine_test/core/utils/text_styles.dart';

class AddRequirement extends ConsumerWidget {
  final int variantId;
  const AddRequirement(this.variantId, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.background,
        title: const Text(
          "Vehicle Requirements",
          style: AppTextStyles.appBartitle,
        ),
      ),
        body:const Column(),

    );
  }
}
