
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syn_laundry/models/Checkout_model.dart';
import 'package:syn_laundry/pages/upload_page.dart';
import 'package:syn_laundry/services/checkout_services.dart';
import 'package:syn_laundry/themes/themes.dart';
import 'package:syn_laundry/widgets/order_widget.dart';
import 'package:sp_util/sp_util.dart';

class ListOrderPage extends StatelessWidget {
  const ListOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pemesanan",
          style: primaryTextStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          // BARIS 1
          Container(
            margin: const EdgeInsets.only(top: 40, left: 20),
            child: Text(
              "Pesanan Baru",
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          FutureBuilder<List<CheckoutModel>>(
            future: CheckoutServices()
                .listCheckoutBaru(SpUtil.getInt("id_user").toString()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                );
              } else if (snapshot.data!.isEmpty) {
                return Column(
                  children: [
                    Image.asset(
                      "assets/img-empty.png",
                      width: 150,
                    ),
                    Text(
                      "Belum ada Pesanan",
                      style: primaryTextStyle,
                    ),
                  ],
                );
              } else if (snapshot.hasData) {
                
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...snapshot.data!.map((dataCheckout) {
                      return InkWell(
                        onTap: () {
                         Get.to(UploadPage(dataCheckout: dataCheckout)
                         );
                        },
                        child: OrderWidget(
                          dataCheckout: dataCheckout,
                        ),
                      );
                    })
                  ],
                );
              }

              // default widget
              return Container();
            },
          ),

          Container(
            margin: const EdgeInsets.only(top: 40, left: 20),
            child: Text(
              "Dalam Proses",
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          FutureBuilder<List<CheckoutModel>>(
            future: CheckoutServices()
                .listCheckoutProses(SpUtil.getInt("id_user").toString()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                );
              } else if (snapshot.data!.isEmpty) {
                return Column(
                  children: [
                    Image.asset(
                      "assets/img-empty.png",
                      width: 150,
                    ),
                    Text(
                      "Belum ada Pesanan",
                      style: primaryTextStyle,
                    ),
                  ],
                );
              } else if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...snapshot.data!.map((dataCheckout) {
                      return OrderWidget(
                        dataCheckout: dataCheckout,
                      );
                    })
                  ],
                );
              } else if(snapshot.data!.isEmpty){
                return Column(
                  children: [
                    Image.asset("assets/img-empty.png", width: 150, ),
                    Text("Belum ada Pesanan", style: primaryTextStyle, ),
                  ],
                );
              } else if (!snapshot.hasData) {
                return Image.asset("assets/img-empty.png");
              }

              // default widget
              return Container();
            },
          ),

          // BARIS 3
          Container(
            margin: const EdgeInsets.only(top: 41, left: 20),
            child: Text(
              "Riwayat Pemesanan",
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          FutureBuilder<List<CheckoutModel>>(
            future: CheckoutServices()
                .listCheckoutSelesai(SpUtil.getInt("id_user").toString()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                );
              } else if(snapshot.data!.isEmpty){
                return Column(
                  children: [
                    Image.asset("assets/img-empty.png", width: 150, ),
                    Text("Belum ada Pesanan", style: primaryTextStyle, ),
                  ],
                );
              } else if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...snapshot.data!.map((dataCheckout) {
                      return OrderWidget(
                        dataCheckout: dataCheckout,
                      );
                    })
                  ],
                );
              } 

              // default widget
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
