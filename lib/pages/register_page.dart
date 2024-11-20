import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syn_laundry/controllers/auth_controllers.dart';
import 'package:syn_laundry/pages/beranda_page.dart';
import 'package:syn_laundry/themes/themes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final authC = Get.put(AuthController());

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, //umtuk menempatkan title di tengah
        title: Text(
          "Persiapkan Akunmu",
          style: primaryTextStyle.copyWith(
              fontSize: 24, fontWeight: FontWeight.w500),
        ),
        leading: Container(
            margin: EdgeInsets.only(left: 10),
            child: Image.asset('assets/ic-back.png')),
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
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Nama tidak boleh kosong";
                      }
                      return null;
                    },
                    controller: authC.name,
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Nomor tidak boleh kosong";
                      }
                       return null;
                    },
                    controller: authC.telepon,
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
                  SizedBox(
                    height: 35,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email tidak boleh kosong";
                      }
                       return null;
                    },
                    controller: authC.email,
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password tidak boleh kosong";
                      }
                       return null;
                    },
                    controller: authC.password,
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
                  SizedBox(
                    height: 170,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: (){
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          authC.register();
                        }
                      },
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
                    child: Text(
                      "dengan mendaftar, anda setuju dengan syarat dan ketentuan aplikasi ",
                      style: secondaryTextStyle.copyWith(fontSize: 10),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
