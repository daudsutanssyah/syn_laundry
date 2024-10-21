import 'package:flutter/material.dart';
import 'package:syn_laundry/pages/beranda_page.dart';
import 'package:syn_laundry/pages/list_order_page.dart';
import 'package:syn_laundry/pages/profil_page.dart';
import 'package:syn_laundry/themes/themes.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int selectecIndex = 0;

  static List<Widget> screenList = [
    BerandaPage(),
    ListOrderPage(),
    ProfilPage(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectecIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          // index 0
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          //index 1
          BottomNavigationBarItem(icon: Icon(Icons.task), label: "Pesanan"),
          //index 2
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
        currentIndex: selectecIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: greyColor,
        onTap: onItemTapped,
        backgroundColor: whiteColor,
        type: BottomNavigationBarType.fixed,
      ),
      body: screenList.elementAt(selectecIndex),
    );
  }
}
