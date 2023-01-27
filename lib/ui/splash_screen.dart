import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybiseo_app/ui/bottom_tab_navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  void _navigate() async {
    await Future.delayed(Duration(seconds: 2));
    Get.to(BottomTab());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
