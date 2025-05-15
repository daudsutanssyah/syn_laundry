import 'dart:convert';

import 'package:syn_laundry/config/config.dart';
import 'package:syn_laundry/models/Checkout_model.dart';
import 'package:http/http.dart' as http;

class CheckoutServices {
  // baru
  // function menampilkan list checkout
  Future<List<CheckoutModel>> listCheckoutBaru(String userId) async {
    // siapkan variabel utk menampung/menyimpan list checkout
    List<CheckoutModel> listCheckoutBaru = [];

    try {
      // variabel utk menampung url endpoint
      var url = Config().checkoutListBaru;
      // buat variabel untuk request ke web service
      var response = await http.get(Uri.parse(url + userId));

      // jika status codenya 200
      if (response.statusCode == 200) {
        // ambil isi body dari output json dan decde jsonnya
        var responseBody = json.decode(response.body);

        // simpan hasil response body ke dalam variabel
        List listCheckoutBaruResponse = responseBody["data"];

        // masukkan hasil response body yg telah didapat ke dalam variabel istCheckoutBaru
        listCheckoutBaruResponse.forEach((data) {
          listCheckoutBaru.add(CheckoutModel.fromJson(data));
        });
      } else {
        listCheckoutBaru = [];
      }
    } catch (e) {
      print(e);
    }
    return listCheckoutBaru;
  }

  // proses
  // function menampilkan list checkout
  Future<List<CheckoutModel>> listCheckoutProses(String userId) async {
    // siapkan variabel utk menampung/menyimpan list checkout
    List<CheckoutModel> listCheckoutProses = [];

    try {
      // variabel utk menampung url endpoint
      var url = Config().checkoutListProses;
      // buat variabel untuk request ke web service
      var response = await http.get(Uri.parse(url + userId));

      // jika status codenya 200
      if (response.statusCode == 200) {
        // ambil isi body dari output json dan decde jsonnya
        var responseBody = json.decode(response.body);

        // simpan hasil response body ke dalam variabel
        List listCheckoutProsesResponse = responseBody["data"];

        // masukkan hasil response body yg telah didapat ke dalam variabel istCheckoutProses
        listCheckoutProsesResponse.forEach((data) {
          listCheckoutProses.add(CheckoutModel.fromJson(data));
        });
      } else {
        listCheckoutProses = [];
      }
    } catch (e) {
      print(e);
    }
    return listCheckoutProses;
  }

  // selesai
  // function menampilkan list checkout
  Future<List<CheckoutModel>> listCheckoutSelesai(String userId) async {
    // siapkan variabel utk menampung/menyimpan list checkout
    List<CheckoutModel> listCheckoutSelesai = [];

    try {
      // variabel utk menampung url endpoint
      var url = Config().checkoutListSelesai;
      // buat variabel untuk request ke web service
      var response = await http.get(Uri.parse(url + userId));

      // jika status codenya 200
      if (response.statusCode == 200) {
        // ambil isi body dari output json dan decde jsonnya
        var responseBody = json.decode(response.body);

        // simpan hasil response body ke dalam variabel
        List listCheckoutSelesaiResponse = responseBody["data"];

        // masukkan hasil response body yg telah didapat ke dalam variabel istCheckoutSelesai
        listCheckoutSelesaiResponse.forEach((data) {
          listCheckoutSelesai.add(CheckoutModel.fromJson(data));
        });
      } else {
        listCheckoutSelesai = [];
      }
    } catch (e) {
      print(e);
    }
    return listCheckoutSelesai;
  }
}
