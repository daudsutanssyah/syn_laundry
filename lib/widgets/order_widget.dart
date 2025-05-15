import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syn_laundry/models/Checkout_model.dart';
import 'package:syn_laundry/themes/themes.dart';
import 'package:intl/intl.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({
    super.key,
    required this.dataCheckout,
  });

  final CheckoutModel dataCheckout;

  @override
  Widget build(BuildContext context) {
    // double c = 4.56;
    // int a = c.floor();
    // num subTotal = num.parse(dataCheckout.item.hargaSatuan) * num.parse(dataCheckout.item.jumlah);

    // membuat format tanggal menggunakan library intl
    DateFormat dateFormat = DateFormat('dd/MM/yyy');
    // konvert data tanggal yg dpt dari json (sudah dimodelkan di class CheckoutModel), yaitu atribut createdAt
    String formattedDate = dateFormat.format(dataCheckout.createdAt);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 16, left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: blackColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // KODE
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dataCheckout.kodeTransaksi,
                  style: primaryTextStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed: () {
                    Clipboard.setData(
                        ClipboardData(text: dataCheckout.kodeTransaksi));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Kode transaksi disalin!'),
                      ),
                    );
                  },
                ),
              ],
            ),
            // BARIS 1
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SISI KIRI
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Layanan",
                      style: primaryTextStyle.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      dataCheckout.item.namaProduct,
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Tanggal",
                      style: primaryTextStyle.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      formattedDate,
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                // SISI KANAN
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Paket",
                      style: primaryTextStyle.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      dataCheckout.item.merkProduct,
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Status",
                      style: primaryTextStyle.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      // untuk label text
                      dataCheckout.status == "0"
                          ? "Baru"
                          : (dataCheckout.status == "1"
                              ? "Diproses"
                              : "Selesai"),
                      // untuk warna text
                      style: dataCheckout.status == "0"
                          ? redTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            )
                          : dataCheckout.status == "1"
                              ? yellowTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                )
                              : greenTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
