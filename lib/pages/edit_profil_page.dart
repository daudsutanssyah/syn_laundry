import 'package:flutter/material.dart';
import 'package:syn_laundry/themes/themes.dart';

class EditProfilPage extends StatelessWidget {
  const EditProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profil",
          style: primaryTextStyle.copyWith(fontWeight: FontWeight.w500),
        ),
        leading: Container(
          margin: EdgeInsets.only(left: 10),
          child: Image.asset(
            "assets/ic-back.png",
            width: 36,
            height: 36,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 25, left: 20, right: 20),
        child: ListView(
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
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
                    hintText: "Masukkan Nama",
                    hintStyle: secondaryTextStyle,
              ),
            ),
            SizedBox(height: 25,),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
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
                    hintText: "Masukkan Email",
                    hintStyle: secondaryTextStyle,
              ),
            ),
            SizedBox(height: 25,),
            TextFormField(
              keyboardType: TextInputType.number,
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
            "Simpan Perubahan",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}