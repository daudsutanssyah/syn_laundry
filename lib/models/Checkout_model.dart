// ignore_for_file: file_names

class CheckoutModel {
    int id;
    String kodeTransaksi;
    String userId;
    String nama;
    String nohp;
    dynamic kotaKecamatan;
    String alamat;
    dynamic catatan;
    String jenisPembayaran;
    String jenisPengiriman;
    String ongkir;
    String grandTotal;
    dynamic buktibayar;
    String status;
    DateTime createdAt;
    DateTime updatedAt;
    Item item;

    CheckoutModel({
        required this.id,
        required this.kodeTransaksi,
        required this.userId,
        required this.nama,
        required this.nohp,
        required this.kotaKecamatan,
        required this.alamat,
        required this.catatan,
        required this.jenisPembayaran,
        required this.jenisPengiriman,
        required this.ongkir,
        required this.grandTotal,
        required this.buktibayar,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.item,
    });

    factory CheckoutModel.fromJson(Map<String, dynamic> json) => CheckoutModel(
        id: json["id"],
        kodeTransaksi: json["kode_transaksi"],
        userId: json["user_id"],
        nama: json["nama"],
        nohp: json["nohp"],
        kotaKecamatan: json["kota_kecamatan"],
        alamat: json["alamat"],
        catatan: json["catatan"],
        jenisPembayaran: json["jenis_pembayaran"],
        jenisPengiriman: json["jenis_pengiriman"],
        ongkir: json["ongkir"],
        grandTotal: json["grand_total"],
        buktibayar: json["buktibayar"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        item: Item.fromJson(json["item"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "kode_transaksi": kodeTransaksi,
        "user_id": userId,
        "nama": nama,
        "nohp": nohp,
        "kota_kecamatan": kotaKecamatan,
        "alamat": alamat,
        "catatan": catatan,
        "jenis_pembayaran": jenisPembayaran,
        "jenis_pengiriman": jenisPengiriman,
        "ongkir": ongkir,
        "grand_total": grandTotal,
        "buktibayar": buktibayar,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "item": item.toJson(),
    };
}

class Item {
    String id;
    String userId;
    String productId;
    String checkoutId;
    String jumlah;
    String totalharga;
    String status;
    DateTime createdAt;
    DateTime updatedAt;
    String namaProduct;
    String gambar;
    String hargaSatuan;
    String merkProduct;

    Item({
        required this.id,
        required this.userId,
        required this.productId,
        required this.checkoutId,
        required this.jumlah,
        required this.totalharga,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.namaProduct,
        required this.gambar,
        required this.hargaSatuan,
        required this.merkProduct,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        userId: json["user_id"],
        productId: json["product_id"],
        checkoutId: json["checkout_id"],
        jumlah: json["jumlah"],
        totalharga: json["totalharga"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        namaProduct: json["nama_product"],
        gambar: json["gambar"],
        hargaSatuan: json["harga_satuan"],
        merkProduct: json["merk_product"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "product_id": productId,
        "checkout_id": checkoutId,
        "jumlah": jumlah,
        "totalharga": totalharga,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "nama_product": namaProduct,
        "gambar": gambar,
        "harga_satuan": hargaSatuan,
        "merk_product": merkProduct,
    };
}