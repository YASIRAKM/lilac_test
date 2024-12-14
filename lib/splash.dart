import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lilac_machine_test/core/constants/image_string.dart';
import 'package:lilac_machine_test/core/utils/shared_preference_helper.dart';
import 'package:lilac_machine_test/feateres/authentication/view/login_view.dart';
import 'package:lilac_machine_test/feateres/home/view/bottom_navigation_bar.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

checkLogin(BuildContext context) async {
  Future.delayed(const Duration(seconds: 1));
  String id = await SharedPreferenceHelper.getValue(key: "token") ?? "";
  if (id.isEmpty) {
    Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute(
        builder: (context) => LoginView(),
      ),
      (route) => false,
    );
  } else {
    Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute(
        builder: (context) => const BottomNavigationView(),
      ),
      (route) => false,
    );
  }
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    checkLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(logoVector),
      ),
    );
  }
}
