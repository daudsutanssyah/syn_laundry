import 'package:flutter/material.dart';
import 'package:syn_laundry/themes/themes.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.imgUrl, required this.nama, required this.harga});

  // buat variabel agar bisa menerima nilai dari si pemakai class/ widget
  final String imgUrl, nama, harga;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      child: Stack(
        children: [
          Image.asset(imgUrl, width: 150, height: 136,),
          Container(
            margin: EdgeInsets.only(top: 60, left: 11),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nama, style: whiteTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis,
                ), maxLines: 1, ),
                Text(harga, style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),),
              ],
            ),
          )
        ],
      ),
    );
  }
}