import 'package:flutter/material.dart';
import 'package:syn_laundry/models/product_model.dart';
import 'package:syn_laundry/pages/notifikasi_page.dart';
import 'package:syn_laundry/services/product_services.dart';
import 'package:syn_laundry/themes/themes.dart';
import 'package:syn_laundry/widgets/product_widget.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        //Baris 1
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 25),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Selamat Datang!",
                        style: primaryTextStyle.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    Text(
                      "Mau dibantu apa hari ini?",
                      style: secondaryTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Spacer(), //mengambil sisa space
                //sisi kanan
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotifikasiPage()));
                    },
                    child: Icon(Icons.notifications)),
              ],
            ),
          ),

          // baris 2
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Stack(
              //widget tumpukan
              children: [
                Image.asset("assets/img-cta.png"),
                Positioned(
                  top: 100,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cucian",
                        style: whiteTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Numpuk?",
                        style: whiteTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Container(
                        width: 115,
                        height: 33,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Ayo Cuci!",
                            style: greenTextStyle.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          // baris 3
          Container(
            margin: EdgeInsets.only(top: 18, left: 20),
            child: Text(
              "Layanan Kami",
              style: primaryTextStyle.copyWith(
                  fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),

          // baris 4
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 18),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: FutureBuilder<List<ProductModel>>(
                  future: ProductServices.getProductList(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(
                        color: primaryColor,
                      );
                    } else if (snapshot.hasData) {
                      return Row(
                        children: [
                          ...snapshot.data!.map((dataProduct) {
                            // mengambil index dari perulangan map
                            var index = snapshot.data!.indexOf(dataProduct);
                            return Container(
                              margin: EdgeInsets.only(
                                left: index > 0 ? 20 : 0
                              ),
                              child: ProductWidget(
                                productModel: dataProduct,
                              ),
                            );
                          })
                        ],
                      );
                    } else {
                      return Container();
                    }
                  }),
            ),
          ),

          // baris 5
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 23),
            child: Stack(
              children: [
                Image.asset("assets/img-drycleaning.png"),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dry Cleaning",
                        style: whiteTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "IDR 10000 / Kg",
                        style: whiteTextStyle.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
