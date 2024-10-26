import 'package:flutter/material.dart';
import 'package:syn_laundry/themes/themes.dart';

class InfoPesanan extends StatefulWidget {
  const InfoPesanan({super.key});

  @override
  State<InfoPesanan> createState() => _InfoPesananState();
}

class _InfoPesananState extends State<InfoPesanan> {
// siapkan variabel utk menampung nilai default pada pilihan dropdown

  String layanan = "Laundry";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Informasi Pesanan",
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
      ),
      body: Container(
        margin: EdgeInsets.only(top: 54, left: 20, right: 20),
        child: ListView(
          children: [
            Text(
              "Layanan",
              style: primaryTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 6,),
            DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: greyColor,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: greyColor,
                      )),
                ),
                value: layanan,
                items: <String>['Laundry', 'Setrika']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: primaryTextStyle,
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    layanan = newValue!;
                  });
                }),
                SizedBox(height: 12,),
                 Text(
              "Nama Pemesan",
              style: primaryTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 6,),
            TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: greyColor,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: greyColor,
                        )),
                    hintText: "Masukkan Nama Lengkap",
                    hintStyle: secondaryTextStyle,
                  ),
                ),
                SizedBox(height: 12,),
                 Text(
              "Nomor Telepon",
              style: primaryTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 6,),
            TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: greyColor,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: greyColor,
                        )),
                    hintText: "Masukkan Nomor Telepon",
                    hintStyle: secondaryTextStyle,
                  ),
                ),
                SizedBox(height: 12,),
                 Text(
              "Alamat Penjemputan",
              style: primaryTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 6,),
            TextFormField(
              maxLines: 4,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: greyColor,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: greyColor,
                        )),
                    hintText: "Masukkan Alamat",
                    hintStyle: secondaryTextStyle,
                  ),
                ),
          ],
        ),
      ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 24),
          width: double.infinity,
          height: 50,
          child: TextButton(
                      onPressed: null,
                      style: TextButton.styleFrom(
                          backgroundColor: Color(0xFF4ABF92),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Text(
                        "Lanjut",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
        ),
    );
  }
}
