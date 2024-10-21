import 'package:flutter/material.dart';
import 'package:syn_laundry/themes/themes.dart';
import 'package:syn_laundry/widgets/order_widget.dart';

class ListOrderPage extends StatelessWidget {
  const ListOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pemesanan",
          style: primaryTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          //baris 1
          Container(
              margin: EdgeInsets.only(
                top: 40,
                left: 20,
              ),
              child: Text(
                "Dalam Proses",
                style: primaryTextStyle.copyWith(
                    fontSize: 18, fontWeight: FontWeight.w500),
              )),
          // baris 2
          OrderWidget(
            layanan: "Laundry",
            paket: "Reguler",
            tanggal: "20/10/2024",
            status: "Diproses",
          ),

          //baris 2
          Container(
              margin: EdgeInsets.only(
                top: 61,
                left: 20,
              ),
              child: Text(
                "Riwayat Pemesanan",
                style: primaryTextStyle.copyWith(
                    fontSize: 18, fontWeight: FontWeight.w500),
              )),
          // baris 3
          OrderWidget(
            layanan: "Setrika",
            paket: "Reguler",
            tanggal: "12/10/2024",
            status: "Selesai",
          ),
          // baris 3
          OrderWidget(
            layanan: "Setrika",
            paket: "Reguler",
            tanggal: "15/10/2024",
            status: "Selesai",
          ),
        ],
      ),
    );
  }
}
