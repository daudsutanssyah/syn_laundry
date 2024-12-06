import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:syn_laundry/config/config.dart';
import 'package:syn_laundry/models/product_model.dart';

class ProductServices {
  
  // function utk req data ke API (end point : product-list)
  static Future<List<ProductModel>> getProductList() async {
  // siapkan variabel utk menyimpan list product
  List<ProductModel> listProduct = [];
   
  try {
    // buat variabel utk req web services
    var response = await http.get(Uri.parse(Config().productList));
    
    // jika berhasil mendapatkan data
    if (response.statusCode == 200) {
      // ambil isi body dari response postman
    var responseBody = json.decode(response.body);
    
    // buat variabel utk menampung isi dari response body
    List listAllProductResponse = responseBody["data"];

    // isikan variabel listproduct yabg tadinya kosong [] dengan isian yang didapatkan dari variabel allproductresponse
    listAllProductResponse.forEach((data) {
      listProduct.add(ProductModel.fromJson(data));
    });
    } else {
      listProduct = [];
    }
    
  } catch (e) {
    print(e);
  } 
   
   return listProduct;
  }
}
