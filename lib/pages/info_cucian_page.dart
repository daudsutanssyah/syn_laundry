import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syn_laundry/themes/themes.dart';

class InfoCucianPage extends StatefulWidget {
  const InfoCucianPage({super.key});

  @override
  State<InfoCucianPage> createState() => _InfoCucianPageState();
}

class _InfoCucianPageState extends State<InfoCucianPage> {
  TextEditingController dateInput = TextEditingController();

  String metodeBayar = "Tunai";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dateInput.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Informasi Cucian",
          style: primaryTextStyle.copyWith(fontWeight: FontWeight.w500),
        ),
        leading: Container(
          margin: EdgeInsets.only(left: 10),
          child: Image.asset(
            'assets/ic-back.png',
            width: 36,
            height: 36,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 54, left: 20, right: 20),
        child: ListView(
          children: [
            Text(
              "Perkiraan Berat Cucian",
              style: primaryTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 6,
            ),
            TextFormField(
              obscureText: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Masukkan Berat",
                hintStyle: primaryTextStyle,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("kg"),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: greyColor,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: greyColor,
                    )),
              ),
            ),
            Text(
              "*Tim kami akan menimbang kembali berat cucian",
              style: secondaryTextStyle,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "Waktu Pengambilan",
              style: primaryTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 6,
            ),
            TextFormField(
              obscureText: true,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                hintText: "dd/mm/yyyy",
                hintStyle: primaryTextStyle,
                suffixIcon: Icon(Icons.date_range),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: greyColor,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: greyColor,
                    )),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2100));
                if (pickedDate != null) {
                  String formattedDate =
                      DateFormat('dd-mm-yyyy').format(pickedDate);
                  setState(() {
                    dateInput.text = formattedDate;
                  });
                } else {}
              },
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "Pilih Paket",
              style: primaryTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w500),
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
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                              fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Text("IDR 5k"),
                  Checkbox(
                      value: false,
                      onChanged: (value) {
                        setState(() {});
                      }),
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: blackColor),
                borderRadius: BorderRadius.circular(15),
              ),
              height: 73,
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Express",
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "(langsung jemput tanpa antri)",
                          style: secondaryTextStyle.copyWith(
                              fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Text("IDR 10k"),
                  Checkbox(
                      value: false,
                      onChanged: (value) {
                        setState(() {});
                      }),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Metode Pembayaran ",
              style: primaryTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
            DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: greyColor,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: greyColor,
                      )),
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
                }),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                "*Bayar setelah beres",
                style: secondaryTextStyle.copyWith(
                    fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 24),
        width: double.infinity,
        height: 50,
        child: TextButton(
          onPressed: null,
          style: TextButton.styleFrom(
              backgroundColor: Color(0xFF4ABF92),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          child: Text(
            "Lanjut",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
