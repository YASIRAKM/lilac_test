import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lilac_machine_test/common/common_providers.dart';
import 'package:lilac_machine_test/core/constants/color_strings.dart';
import 'package:lilac_machine_test/feateres/dashboard/view/dashboard_view.dart';
import 'package:lilac_machine_test/feateres/requirements/view/requirement_list.dart';
import 'package:lilac_machine_test/main.dart';

class BottomNavigationView extends ConsumerWidget {
  const BottomNavigationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(indexProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {},
        shape: const CircleBorder(),
        child: const Icon(
          CupertinoIcons.money_dollar_circle,
          color: AppColors.background,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomNavigationBar(index, ref),
      body: index == 0 ? const DashboardView() : const Scaffold(),
    );
  }

/*Bottom navigation bar */
  BottomNavigationBar bottomNavigationBar(int index, WidgetRef ref) {
    return BottomNavigationBar(
        // selectedItemColor: AppColors.primary,
        fixedColor: AppColors.primary,
        unselectedItemColor: AppColors.primary,
        currentIndex: index,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        onTap: (value) {
          if (value == 3) {
            navigatorKey.currentState!.push(CupertinoPageRoute(
              builder: (context) => const RequirementList(),
            ));
          } else {
            ref.read(indexProvider.notifier).state = value;
          }
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              activeIcon: Icon(Icons.home),
              label: "home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.message),
              activeIcon: Icon(Icons.message_outlined),
              label: "Message"),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(CupertinoIcons.add_circled),
              label: "Sell"),
          BottomNavigationBarItem(
              icon: Icon(Icons.note_alt_rounded),
              activeIcon: Icon(Icons.note_alt),
              label: "Requirements"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              activeIcon: Icon(Icons.person_2),
              label: "Profile"),
        ]);
  }
}
