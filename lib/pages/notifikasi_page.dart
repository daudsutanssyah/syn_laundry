import 'package:flutter/material.dart';
import 'package:syn_laundry/themes/themes.dart';

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifikasi",
          style: primaryTextStyle.copyWith(fontWeight: FontWeight.w500),
        ),
        leading: Container(
          margin: EdgeInsets.only(left: 10),
          child: Image.asset(
            'assets/ic-back.png',
            width: 36,
            height: 36,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Text(
              "Tandai Terbaca",
              style: greenTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hore!! Pesananmu sedang diproses",
                        style: primaryTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Cek pesananmu sekarang!",
                        style: primaryTextStyle.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Spacer(),
                  Image.asset(
                    'assets/img-sukses.png',
                    width: 21,
                    height: 21,
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 25, left: 20, right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: blackColor,
                )),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cucianmu telah selesai!",
                        style: primaryTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Kamu bisa cek kelengkapan cucianmu!",
                        style: primaryTextStyle.copyWith(
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
