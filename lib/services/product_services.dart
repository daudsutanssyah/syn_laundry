import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:syn_laundry/config/config.dart';
import 'package:syn_laundry/models/Product_model.dart';

class ProductServices {
  // function utk request data ke API (end point : /product-list)
  static Future<List<ProductModel>> getProductList() async {
  List<ProductModel> listProduct = [];

  try {
    print("🔄 Fetching product list...");
    var response = await http.get(Uri.parse(Config().productList));
    
    print("📡 Response Status Code: ${response.statusCode}");
    print("📦 Response Body: ${response.body}");

    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);

      print("✅ API response decoded successfully");

      if (responseBody["data"] != null && responseBody["data"] is List) {
        List listAllProductResponse = responseBody["data"];
        
        print("📊 Total Products in JSON: ${listAllProductResponse.length}");
        
        listAllProductResponse.forEach((data) {
          try {
            ProductModel product = ProductModel.fromJson(data);
            listProduct.add(product);
            print("🛍️ Product Added: ${product.namaProduct}");
          } catch (e) {
            print("❌ Error parsing product: $e");
          }
        });
      } else {
        print("⚠️ Warning: 'data' key is missing or not a list.");
      }
    } else {
      print("❌ Error: API returned status ${response.statusCode}");
    }
  } catch (e) {
    print("❌ Exception occurred: $e");
  }

  print("📜 Final Product List Length: ${listProduct.length}");
  return listProduct;
}

}
