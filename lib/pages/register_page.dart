import 'package:flutter/material.dart';
import 'package:syn_laundry/themes/themes.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, //umtuk menempatkan title di tengah
        title: Text("Persiapkan Akunmu"),
        leading: Image.asset('assets/ic-back.png'),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 35),
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  "Lengkapi semua informasi untuk",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "membuat akun di syKlin.",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 60, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    hintText: "Masukkan Username",
                    hintStyle: secondaryTextStyle,
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
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
                SizedBox(
                  height: 35,
                ),
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
                SizedBox(
                  height: 35,
                ),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    suffix: Image.asset(
                      'assets/ic-eye.png',
                      width: 16,
                    ),
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
                    hintText: "Masukkan Password",
                    hintStyle: secondaryTextStyle,
                  ),
                ),
                SizedBox(height: 170,),
                Container(
                  height: 50,
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  child: TextButton(
                    onPressed: null,
                    style: TextButton.styleFrom(
                        backgroundColor: Color(0xFF4ABF92),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Text(
                      "Daftar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Center(
                  child: Text("dengan mendaftar, anda setuju dengan syarat dan ketentuan aplikasi ",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 10
                  ),
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
