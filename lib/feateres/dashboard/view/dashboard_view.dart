import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lilac_machine_test/core/constants/color_strings.dart';
import 'package:lilac_machine_test/core/constants/image_string.dart';
import 'package:lilac_machine_test/core/utils/gaps.dart';
import 'package:lilac_machine_test/core/utils/text_styles.dart';
import 'package:lilac_machine_test/feateres/dashboard/widget/custom_dashboard_card.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.dashBoardBackground,
        leading: const Icon(CupertinoIcons.list_bullet_indent),
        actions: const [Icon(CupertinoIcons.bell)],
      ),
      backgroundColor: AppColors.dashBoardBackground,
      body: SafeArea(
        child: GridView(
          padding: const EdgeInsets.only(left: 15, right: 15),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              childAspectRatio: 1.1),
          children: [
            DashBoardCardWidget(
              image: totalVehicleIcon,
              count: "100",
              title: "Total vehicles",
              iconColor: AppColors.totalVehicleIconColor,
              onTap: () {},
            ),
            DashBoardCardWidget(
              iconColor: AppColors.totalBookingIconColor,
              image: totalBookingIocn,
              count: "50",
              title: "Total Bookings",
              onTap: () {},
            ),
            DashBoardCardWidget(
              iconColor: AppColors.c2bConceptIconColor,
              image: c2bConceptIocn,
              count: "25",
              title: "C2B Concept",
              onTap: () {},
            ),
            DashBoardCardWidget(
              iconColor: AppColors.vehicleForSaeIconColor,
              image: vehicleForSaleIcon,
              count: "35",
              title: "Vehicles for Sale",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
