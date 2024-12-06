import 'package:flutter/material.dart';
import 'package:syn_laundry/models/product_model.dart';
import 'package:syn_laundry/themes/themes.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.productModel,});

  // buat variabel agar bisa menerima nilai dari si pemakai class/ widget
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Stack(
        children: [
          Image.network(productModel.gambar, width: 150, height: 136,),
          Container(
            margin: EdgeInsets.only(top: 60, left: 11),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productModel.namaProduct, style: whiteTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis,
                ), maxLines: 1, ),
                Text(productModel.harga, style: whiteTextStyle.copyWith(
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