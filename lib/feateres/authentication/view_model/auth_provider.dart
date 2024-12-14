import 'dart:async';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:lilac_machine_test/common/common_providers.dart';
import 'package:lilac_machine_test/core/utils/show_message.dart';
import 'package:lilac_machine_test/data/repository.dart';
import 'package:lilac_machine_test/feateres/home/view/bottom_navigation_bar.dart';
import 'package:lilac_machine_test/main.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class AuthProvider extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future login({required String email, required String password}) async {
    ref.read(loadingProvider.notifier).state = true;
    try {
      ref.read(loadingProvider.notifier).state = false;

      (bool, String) res =
          await ApiHelper.login(email: email, password: password);

      if (res.$1) {
        navigatorKey.currentState!.pushAndRemoveUntil(
          CupertinoPageRoute(
            builder: (context) => const BottomNavigationView(),
          ),
          (route) => false,
        );
        showMessage(message: "Login succesffull");
      } else {
        ref.read(loadingProvider.notifier).state = false;

        showMessage(message: "Failed to login");
      }
    } catch (e) {
      ref.read(loadingProvider.notifier).state = false;

      showMessage(message: "Failed to login");
    }
  }
}

final authProvder = AsyncNotifierProvider<AuthProvider, void>(
  () => AuthProvider(),
);
