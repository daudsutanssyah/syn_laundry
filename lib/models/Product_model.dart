import 'package:syn_laundry/config/config.dart';

class ProductModel {
    int id;
    String merkId;
    String namaProduct;
    String harga;
    String gambar;
    String spesifikasi;
    String rating;
    String status;
    String rekomendasi;
    DateTime createdAt;
    DateTime updatedAt;
    Merk merk;

    ProductModel({
        required this.id,
        required this.merkId,
        required this.namaProduct,
        required this.harga,
        required this.gambar,
        required this.spesifikasi,
        required this.rating,
        required this.status,
        required this.rekomendasi,
        required this.createdAt,
        required this.updatedAt,
        required this.merk,
    });

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        merkId: json["merk_id"],
        namaProduct: json["nama_product"],
        harga: json["harga"],
        gambar: Config.urlMain + 'storage/' + json["gambar"],
        spesifikasi: json["spesifikasi"],
        rating: json["rating"],
        status: json["status"],
        rekomendasi: json["rekomendasi"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        merk: Merk.fromJson(json["merk"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "merk_id": merkId,
        "nama_product": namaProduct,
        "harga": harga,
        "gambar": gambar,
        "spesifikasi": spesifikasi,
        "rating": rating,
        "status": status,
        "rekomendasi": rekomendasi,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "merk": merk.toJson(),
    };
}

class Merk {
    int id;
    String merkProduct;
    String status;
    DateTime createdAt;
    DateTime updatedAt;

    Merk({
        required this.id,
        required this.merkProduct,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Merk.fromJson(Map<String, dynamic> json) => Merk(
        id: json["id"],
        merkProduct: json["merk_product"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "merk_product": merkProduct,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}