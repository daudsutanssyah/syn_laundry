
import 'package:flutter/material.dart';
import 'package:syn_laundry/config/config.dart';
import 'package:syn_laundry/models/Product_model.dart';
import 'package:syn_laundry/themes/themes.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.productModel});

  // buat variabel agar bisa menerima nilai dari si pemakai class/widget ini
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Stack(
        children: [
          Image.network(
            productModel.gambar,
            width: 150,
            height: 136,
          ),
          Container(
            margin: EdgeInsets.only(top: 60, left: 11),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.namaProduct,
                  style: whiteTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
                Text(
                  Config.convertToIdr(int.parse(productModel.harga), 0),
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
