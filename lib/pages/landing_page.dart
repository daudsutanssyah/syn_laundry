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
      bottomNavigationBar: SizedBox(
        height: 69,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: blackColor.withOpacity(0.3),
                blurRadius: 15.0,
                offset: Offset(0.0, 2.0),
              )
            ]
          ),
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              // index 0
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/ic-home-green.png",
                    width: 18,
                    height: 18,
                  ),
                  label: "Beranda"),
              //index 1
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/ic-pesanan.png",
                    width: 18,
                    height: 18,
                  ),
                  label: "Pesanan"),
              //index 2
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/ic-profil.png",
                    width: 18,
                    height: 18,
                  ),
                  label: "Profil"),
            ],
            
            // elevation: 50,
            currentIndex: selectecIndex,
            selectedItemColor: primaryColor,
            unselectedItemColor: greyColor,
            onTap: onItemTapped,
            backgroundColor: whiteColor,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
      body: screenList.elementAt(selectecIndex),
    );
  }
}
