import 'package:flutter/material.dart';
import 'package:syn_laundry/themes/themes.dart';

class Pesanan1Page extends StatelessWidget {
  const Pesanan1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/img-empty.png"),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Belum Ada",
              style: primaryTextStyle.copyWith(
                  fontSize: 26, fontWeight: FontWeight.w500),
            ),
            Text(
              "Pesanan...",
              style: primaryTextStyle.copyWith(
                  fontSize: 26, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
