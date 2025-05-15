
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import 'package:syn_laundry/pages/landing_page.dart';
import 'package:syn_laundry/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // panggil function yg akan dijalankan saat class ini dipanggil
    movingPage();
  }

  void movingPage() {
    Timer(const Duration(seconds: 2), () {
      if (SpUtil.getString("email") == "") {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const LoginPage()));
      } else {
        Get.offAll(const LandingPage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/Logo.png'),
      ),
    );
  }
}
