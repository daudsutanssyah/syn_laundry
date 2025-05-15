import 'package:flutter/material.dart';
import 'package:syn_laundry/themes/themes.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reset Pasword",
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
        margin: const EdgeInsets.only(top: 24, left: 20, right: 20),
        child: ListView(
          children: [
            TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    suffix: Image.asset(
                      'assets/ic-eye.png',
                      width: 24,
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
                    hintText: "Masukkan Password Lama",
                    hintStyle: secondaryTextStyle,
                  ),
                ),
                const SizedBox(height: 24,),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    suffix: Image.asset(
                      'assets/ic-eye.png',
                      width: 24,
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
                    hintText: "Masukkan Password Baru",
                    hintStyle: secondaryTextStyle,
                  ),
                ),
                const SizedBox(height: 24,),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    suffix: Image.asset(
                      'assets/ic-eye.png',
                      width: 24,
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
                    hintText: "Konfirmasi Password Baru",
                    hintStyle: secondaryTextStyle,
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
            "Simpan Perubahan",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}