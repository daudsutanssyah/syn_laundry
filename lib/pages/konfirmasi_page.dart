import 'package:flutter/material.dart';
import 'package:syn_laundry/themes/themes.dart';

class KonfirmasiPage extends StatelessWidget {
  const KonfirmasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Konfirmasi Pesanan",
          style: primaryTextStyle.copyWith(fontWeight: FontWeight.w500),
        ),
        leading: Container(
          margin: const EdgeInsets.only(left: 10),
          child: Image.asset(
            "assets/ic-back.png",
            width: 36,
            height: 36,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            const SizedBox(
              height: 51,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Layanan : ",
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  TextSpan(
                    text: "Laundry",
                    style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight:
                            FontWeight.w700), // Membuat teks lebih tebal
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Nama Pemesan : ",
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  TextSpan(
                    text: "Prabowo",
                    style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight:
                            FontWeight.w700), // Membuat teks lebih tebal
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Nomor Telepon : ",
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  TextSpan(
                    text: "08123456789",
                    style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight:
                            FontWeight.w700), // Membuat teks lebih tebal
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Alamat : ",
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  TextSpan(
                    text:
                        "Jl. Inspektur Sudirman, No, 1234, di samping toko ayam goreng",
                    style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight:
                            FontWeight.w700), // Membuat teks lebih tebal
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Berat Cucian (Perkiraan) : ",
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  TextSpan(
                    text: "1 Kg",
                    style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight:
                            FontWeight.w700), // Membuat teks lebih tebal
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Waktu Pengambilan : ",
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  TextSpan(
                    text: "28/10/2024",
                    style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight:
                            FontWeight.w700), // Membuat teks lebih tebal
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Paket : ",
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  TextSpan(
                    text: "Reguler",
                    style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight:
                            FontWeight.w700), // Membuat teks lebih tebal
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Metode Bayar : ",
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  TextSpan(
                    text: "Tunai",
                    style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight:
                            FontWeight.w700), // Membuat teks lebih tebal
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 93),
                    child: Text(
                      "Informasi Pembayaran",
                      style: primaryTextStyle.copyWith(
                          fontSize: 18, fontWeight: FontWeight.w800),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 67, right: 33, top: 18, bottom: 24),
                    child: Column(
                      children: [
                        Text(
                          "Total pembayaran akan di rekap oleh tim saat penjemputan dan penimbangan",
                          style: primaryTextStyle.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Text(
                          "Nota pembayaran diberikan setelah cucian diterima beres setelah pengantaran",
                          style: primaryTextStyle.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
             
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 24),
        width: double.infinity,
        height: 50,
        child: TextButton(
          onPressed: null,
          style: TextButton.styleFrom(
              backgroundColor: const Color(0xFF4ABF92),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          child: const Text(
            "Konfirmasi",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
