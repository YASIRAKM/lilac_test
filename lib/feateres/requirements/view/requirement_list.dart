import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lilac_machine_test/core/constants/color_strings.dart';
import 'package:lilac_machine_test/core/utils/gaps.dart';
import 'package:lilac_machine_test/core/utils/text_styles.dart';
import 'package:lilac_machine_test/core/widgets/custom_button.dart';
import 'package:lilac_machine_test/feateres/requirements/model/requirements_model.dart';
import 'package:lilac_machine_test/feateres/requirements/view/choose_vehicle_type.dart';
import 'package:lilac_machine_test/feateres/requirements/view_model/requirements_provider.dart';
import 'package:lilac_machine_test/main.dart';

class RequirementList extends ConsumerWidget {
  const RequirementList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var requirementState = ref.watch(requirementProvider);
    return Scaffold(
      body: requirementState.when(
        data: (data) => ListView.separated(
            itemBuilder: (context, index) {
              VenderRequirements current = data[index];
              return Card(
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: AppColors.background,
                elevation: .5,
                child: Column(
                  children: [
                    Text(
                      "${current.brand.name} ${current.vehicleModel.name} ${current.vehicleVariant.name} (${current.year})",
                      style: AppTextStyles.bodyBold,
                    ),
                    smallVerticalGap(),
                    Row()
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return mediumVerticalGap();
            },
            itemCount: data.length),
        error: (error, stackTrace) => Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Something went wrong",
                  style: AppTextStyles.bodyBold,
                ),
                mediumVerticalGap(),
                CustomButton(
                  width: 100,
                  text: "Refresh",
                  onPressed: () {
                    ref.read(requirementProvider.notifier).fetchRequirements();
                  },
                )
              ],
            ),
          ),
        ),
        loading: () => const Center(
          child: CupertinoActivityIndicator(),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomButton(
            text: "+ Create a requirement",
            onPressed: () {
              navigatorKey.currentState!.push(CupertinoPageRoute(
                builder: (context) => const ChooseVariant(),
              ));
            }),
      ),
    );
  }
}
