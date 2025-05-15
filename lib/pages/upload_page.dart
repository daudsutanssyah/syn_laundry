import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syn_laundry/config/config.dart';
import 'package:syn_laundry/controllers/cart_controller.dart';
import 'package:syn_laundry/models/Checkout_model.dart';
import 'package:syn_laundry/themes/themes.dart';
import 'package:get/get.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key, required this.dataCheckout});

  final CheckoutModel dataCheckout;

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final cartC = Get.put(CartController());

  // function pilih source untuk gambar
  takeImage(mContext) {
    return showDialog(
      context: mContext,
      builder: (context) {
        return SimpleDialog(
          title: const Text(
            'Pilih',
            style: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
            ),
          ),
          children: [
            SimpleDialogOption(
              child: const Row(
                children: [
                  Icon(Icons.camera_alt),
                  Text(
                    'Kamera',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.pop(context);
                cartC.getImage(ImageSource.camera);
              },
            ),
            SimpleDialogOption(
              child: const Row(
                children: [
                  Icon(Icons.image),
                  Text(
                    'Galeri ',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                Get.back();
                cartC.getImage(ImageSource.gallery);
              },
            ),
            SimpleDialogOption(
              child: Container(
                alignment: Alignment.bottomRight,
                child: const Text(
                  'Batal',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.dataCheckout.buktibayar);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Bukti Bayar"),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Mandiri Virtual Account",
                    textAlign: TextAlign.center,
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "900100200300",
                    style: primaryTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "a.n.Synlaundry Indo",
                    style: primaryTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
                padding: const EdgeInsets.all(35),
                decoration: BoxDecoration(
                    color: whiteColor, borderRadius: BorderRadius.circular(5)),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Obx(
                      () => cartC.selectedImagePath.value == ''
                          ? Image.asset(
                              'assets/ic_photo.png',
                              width: 250,
                              height: 250,
                              fit: BoxFit.contain,
                            )
                          : Image.file(
                              File(cartC.selectedImagePath.value),
                              fit: BoxFit.contain,
                              height: 250,
                              width: 250,
                            ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        takeImage(context);
                      },
                      child: Container(
                        width: 150,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: primaryColor),
                        child: Center(
                          child: Text(
                            "Upload Bukti Bayar",
                            style: whiteTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                widget.dataCheckout.buktibayar == null
                    ? Container()
                    : Text(
                        "Lampiran\n Bukti Bayar",
                        textAlign: TextAlign.center,
                        style: primaryTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                Container(
                  child: widget.dataCheckout.buktibayar == null
                      ? Text(
                          "Belum Upload\n bukti bayar",
                          textAlign: TextAlign.center,
                          style: primaryTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Image.network(
                          Config.urlMain +
                              'storage/' +
                              widget.dataCheckout.buktibayar,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          color: primaryColor,
          child: Center(
            child: GestureDetector(
              onTap: () {
                if (cartC.selectedImagePath.value == '') {
                  Get.snackbar(
                    "Error",
                    "Harap upload bukti bayar!",
                    backgroundColor: primaryColor,
                    colorText: whiteColor,
                  );
                } else {
                  cartC.sendData(widget.dataCheckout.id.toString());
                }
              },
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: primaryColor,
                      width: 2,
                    ),
                    color: whiteColor),
                child: Center(
                  child: Obx(() => cartC.isLoading.value == true
                      ? CircularProgressIndicator(
                          color: primaryColor,
                        )
                      : Text(
                          "Kirim Bukti Bayar",
                          style: primaryTextStyle,
                        )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
