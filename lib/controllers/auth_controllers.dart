
import 'package:flutter/material.dart';
// get package untuk state management, widget dan fungsi
import 'package:get/get.dart';
// http untuk mengoneksikan flutter ke API
import 'package:http/http.dart' as http;
import 'package:syn_laundry/config/config.dart';
import 'dart:convert';

import 'package:syn_laundry/pages/landing_page.dart';
import 'package:syn_laundry/pages/splash_page.dart';
import 'package:syn_laundry/themes/themes.dart';
import 'package:sp_util/sp_util.dart';

class AuthController extends GetxController {
  // buat variabel inputan
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController telepon = TextEditingController();
  TextEditingController password = TextEditingController();

  // variabel utk menampung nilai loading
  RxBool loading = false.obs;

  // variabel obsecure
  RxBool secure = false.obs;

  void isObsecure() {
    secure.value = !secure.value;
  }

  // buat fungsi login
  Future login() async {
    // variabel link end point
    var url = Uri.parse(Config().urlLogin);
    try {
      loading.value = true;
      // response
      final response = await http
          .post(url, body: {"email": email.text, "password": password.text});

      // cetak hasil response
      print(response.body);

      // ambil response body dari json yg didapatkan
      var responseDecode = json.decode(response.body);

      // print(responseDecode['data']['name']);
      // print(responseDecode['data']['email']);

      // jika berhasil
      if (response.statusCode == 200) {
        // simpan data user menggunakan package SpUtil
        SpUtil.putInt("id_user", responseDecode["data"]["id"]);
        SpUtil.putString("name", responseDecode["data"]["name"]);
        SpUtil.putString("email", responseDecode["data"]["email"]);
        SpUtil.putString("telepon", responseDecode["data"]["telepon"]);
        loading.value = false;
        // arahkan ke halaman LandingPage
        Get.offAll(LandingPage());
      } else {
        loading.value = false;
        // jika gagal
        Get.snackbar(
          "Error",
          "Username / Pass Salah, silahkan coba lagi",
          backgroundColor: redColor,
          colorText: whiteColor,
          showProgressIndicator: true,
        );
      }
    } catch (e) {
      loading.value = false;
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: redColor,
        colorText: whiteColor,
        showProgressIndicator: true,
      );
    }
  }

  // buat fungsi login
  Future register() async {
    // variabel link end point
    var url = Uri.parse(Config().urlRegister);
    try {
      // response
      final response = await http.post(url, body: {
        "name": name.text,
        "email": email.text,
        "password": password.text,
        "telepon": telepon.text
      });

      // ambil response body dari json yg didapatkan
      var responseDecode = json.decode(response.body);

      // buat variabel untuk menampung data error validation
      Map<String, dynamic> errorValidation = responseDecode["data"];
      // jika berhasil
      if (response.statusCode == 200) {
        Get.offAll(LandingPage());
      } else {
        // jika gagal
        Get.snackbar(
          "Error",
          responseDecode["message"] == "Error Validation"
              ? errorValidation.toString()
              : responseDecode["message"],
          backgroundColor: redColor,
          colorText: whiteColor,
          showProgressIndicator: true,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: redColor,
        colorText: whiteColor,
        showProgressIndicator: true,
      );
    }
  }

  // fungsi logout
  Future logout() async {
    // variabel link end point
    var url = Uri.parse(Config().urlLogout);
    try {
      // response
      final response = await http.get(url);

      // ambil response body dari json yg didapatkan
      var responseDecode = json.decode(response.body);

      // jika berhasil
      if (response.statusCode == 200) {
        // hapus data user yg tersimpan di local storage device menggunakan package SpUtil
        SpUtil.remove("id_user");
        SpUtil.remove("name");
        SpUtil.remove("email");
        SpUtil.remove("telepon");
        // arahkan ke halaman SplashPage
        Get.offAll(SplashPage());
      } else {
        // jika gagal
        Get.snackbar(
          "Error",
          responseDecode["message"],
          backgroundColor: redColor,
          colorText: whiteColor,
          showProgressIndicator: true,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: redColor,
        colorText: whiteColor,
        showProgressIndicator: true,
      );
    }
  }
}
