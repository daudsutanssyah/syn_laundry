import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:syn_laundry/config/config.dart';
import 'package:syn_laundry/pages/landing_page.dart';

class AuthControllers  extends GetxController{
 // buat variabel  inputan
 TextEditingController name = TextEditingController();
 TextEditingController email = TextEditingController();
 TextEditingController telepon = TextEditingController();
 TextEditingController password = TextEditingController();

 // buat fungsi login
 Future login() async {
  // variabel link end point
  var url = Uri.parse(Config().urlLogin);
  try {
    // response
    final response = await http.post(url, body: {
      "email" : email.text,
      "password" : password.text
    });
    
    // ambil response body dari json yg didapatkan
    var responseDecode = json.decode(response.body);

    // jika berhasil
    if (response.statusCode == 200) {
      Get.offAll(LandingPage());
    } else {
      // jika gagal 
      Get.snackbar("Error", responseDecode["message"]);
    }
  } catch (e) {
    Get.snackbar("Error", e.toString());
  }
 }
}