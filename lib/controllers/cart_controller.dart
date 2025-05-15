import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syn_laundry/config/config.dart';
import 'package:syn_laundry/models/Product_model.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import 'package:syn_laundry/pages/landing_page.dart';
import '../themes/themes.dart';

class CartController extends GetxController {
  // variabel inputan dari form
  TextEditingController namaLengkap =
      TextEditingController(text: SpUtil.getString("name"));
  TextEditingController noHP =
      TextEditingController(text: SpUtil.getString("telepon"));
  TextEditingController alamat = TextEditingController();
  TextEditingController jumlah = TextEditingController();

  RxBool isLoading = false.obs;

  // function post Cart
  Future postCartNow(ProductModel dataProduct) async {
    
    // url keranjang
    var url = Uri.parse(Config().keranjangPost);

    // url checkout
    var url2 = Uri.parse(Config().checkoutPostById);

    try {

      //1. proses input keranjang
      final response = await http.post(url, body: {
        'product_id': dataProduct.id.toString(),
        'user_id': SpUtil.getInt("id_user").toString(),
        'jumlah': jumlah.text,
      });

      var responseDecode = json.decode(response.body);

      if (response.statusCode == 200) {
        // tampung bbrp data hasil dri json
        // ambil id saat proses input keranjang berhasil
        var idCart = responseDecode["data"]["id"];
        // var jumlahBeli = responseDecode["data"]["jumlah"];
        // var totalharga = responseDecode["data"]["totalharga"];

        //2. proses input checkout
        final response2 = await http.post(url2, body: {
          'keranjang_id': idCart.toString(),
          'user_id': SpUtil.getInt("id_user").toString(),
          'nama': namaLengkap.text,
          'nohp': noHP.text,
          'alamat': alamat.text,
          'jenis_pembayaran': "TF",
        });

        var responseDecode2 = json.decode(response2.body);

        if (response2.statusCode == 200) {
          // tampilkan snackbar
          Get.snackbar("Success", responseDecode2["message"], duration: const Duration(seconds: 5));
          // arahkan ke beranda
          Get.offAll(const LandingPage());
        } else {
          Get.snackbar("Failed", responseDecode2["message"], duration: const Duration(seconds: 5) );
        }
      } else {
        Get.snackbar("Failed", responseDecode["message"], duration: const Duration(seconds: 5));
      }
    } catch (e) {
      Get.snackbar("Failed", e.toString(), duration: const Duration(seconds: 5));
    }
  }

  // upload bukti bayar
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  void getImage(ImageSource imageSource) async {
    final _picker = ImagePicker();
    final pickedFile = await _picker.pickImage(
      source: imageSource,
      maxHeight: 720,
      maxWidth: 1280,
    );

    if (pickedFile != null) {
       // mengisikan nilai pada variabel selectedImagePath dengan pickedFile.path
      selectedImagePath.value = pickedFile.path;

      // resize image
      selectedImageSize.value =
          "${((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2)}Mb ";
     
      // selectedImagePath.value = pickedFile.path;
    } else {
      // jika cancel pengambilan gambar
      Get.snackbar('Warning!', 'Tidak ada gambar yang dipilih',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color.fromARGB(255, 218, 113, 28),
          margin: const EdgeInsets.only(bottom: 6, right: 6, left: 6),
          colorText: whiteColor);
    }
  }

  // post upload bukti bayar
  Future<void> sendData(String checkoutId) async {
    var url = Uri.parse(Config().urlUploadBuktiBayar);
    try {
      isLoading.value = true;
      var request = http.MultipartRequest('POST', url);
      request.files.add(await http.MultipartFile.fromPath(
          'buktibayar', selectedImagePath.value));
      request.fields['checkout_id'] = checkoutId;

      http.Response response =
          await http.Response.fromStream(await request.send());
      var responseDecode = jsonDecode(response.body);

      if (responseDecode['success'] == true) {
        Get.snackbar(
          "Success",
          responseDecode['message'],
          colorText: Colors.white,
          backgroundColor: Colors.green,
          margin: const EdgeInsets.only(
            top: 8,
            left: 6,
            right: 6,
          ),
        );
        isLoading.value = false;
        Get.offAll(const LandingPage());
      } else {
        isLoading.value = false;
        Get.snackbar(
          "Error",
          responseDecode['message'] + ", Silahkan Coba Lagi",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          margin: const EdgeInsets.only(
            top: 8,
            left: 6,
            right: 6,
          ),
        );
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        "Error",
        "$e, Silahkan Coba Lagi",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        margin: const EdgeInsets.only(
          top: 8,
          left: 6,
          right: 6,
        ),
      );
    }
  }
}