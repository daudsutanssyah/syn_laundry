
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syn_laundry/models/Product_model.dart';
import '../themes/themes.dart';

class InfoCucianPage extends StatefulWidget {
  const InfoCucianPage({super.key,  this.dataProduct});

  final ProductModel? dataProduct;

  @override
  State<InfoCucianPage> createState() => _InfoCucianPageState();
}

class _InfoCucianPageState extends State<InfoCucianPage> {
  // variabel untuk menampung inputan pd kolom
  TextEditingController dateInput = TextEditingController();

  // siapkan variabel utk menampung nilai default pada pilihan dropdown (untuk DropDown)
  String metodeBayar = "Tunai";
  int productId= 0;

  @override
    void initState() {
    
    super.initState();                 
    dateInput.text = ""; //set the initial value of text field
    // saat pertama kali halaman terakses, ubah nilai variabel productId.nya
    productId = widget.dataProduct!.id;
  }

  @override
  Widget build(BuildContext context) {

    print("Product ID : " + productId.toString());


    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Informasi Cucian",
          style: primaryTextStyle.copyWith(fontWeight: FontWeight.w500),
        ),
        leading: Container(
          margin: const EdgeInsets.only(left: 10),
          child: Image.asset(
            'assets/ic-back.png',
            width: 36,
            height: 36,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 57),
        child: ListView(
          children: [
            Text(
              "Perkiraan berat Cucian",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                suffixIcon: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("Kg"),
                ),
                hintText: "Masukkan Berat",
                hintStyle: secondaryTextStyle,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: greyColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: greyColor,
                  ),
                ),
              ),
            ),
            Text(
              "*Tim kami akan menimbang kembali berat cucian",
              style: secondaryTextStyle.copyWith(
                fontStyle: FontStyle.italic,
              ),
            ),
            Text(
              "Waktu Pengambilan",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextFormField(
              controller: dateInput,
              //editing controller of this TextField
              decoration: InputDecoration(
                hintText: 'dd/mm/yyy',
                hintStyle: primaryTextStyle,
                suffixIcon: const Icon(Icons.date_range),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: greyColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: greyColor,
                  ),
                ),
              ),
              readOnly: true,
              //set it true, so that user will not able to edit text
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2100));

                if (pickedDate != null) {
                  // print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('dd-MM-yyyy').format(pickedDate);
                  // print(formattedDate); //formatted date output using intl package =>  2021-03-16
                  setState(() {
                    dateInput.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {}
              },
            ),
            Text(
              "Pilih Paket",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              height: 73,
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment
                          .center, //agar posisinya rata tengah secara vertical (atas ke bawah)
                      crossAxisAlignment:
                          CrossAxisAlignment.start, //agar aligmentny rata kiri
                      children: [
                        Text(
                          "Reguler",
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "(Lebih Hemat)",
                          style: secondaryTextStyle.copyWith(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Text("IDR 5K"),
                  Checkbox(
                      value: false,
                      onChanged: (value) {
                        setState(() {});
                      }),
                ],
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: blackColor,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              height: 73,
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment
                          .center, //agar posisinya rata tengah secara vertical (atas ke bawah)
                      crossAxisAlignment:
                          CrossAxisAlignment.start, //agar aligmentny rata kiri
                      children: [
                        Text(
                          "Ekspres",
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "(Langsung jemput tanpa antri)",
                          style: secondaryTextStyle.copyWith(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Text("IDR 10K"),
                  Checkbox(
                      value: false,
                      onChanged: (value) {
                        setState(() {});
                      }),
                ],
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            Text(
              "Metode Pembayaran",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: greyColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: greyColor,
                  ),
                ),
              ),
              value: metodeBayar,
              items: <String>['Tunai', 'Transfer']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: primaryTextStyle,
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  metodeBayar = newValue!;
                });
              },
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                "*Bayar setelah beres",
                style: secondaryTextStyle.copyWith(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 24, left: 20, right: 20),
        width: double.infinity,
        height: 50,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {
            null;
          },
          child: const Text(
            "Lanjut",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
