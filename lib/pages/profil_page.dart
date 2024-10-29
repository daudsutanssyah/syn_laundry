import 'package:flutter/material.dart';
import 'package:syn_laundry/pages/edit_profil_page.dart';
import 'package:syn_laundry/pages/reset_password_page.dart';
import 'package:syn_laundry/themes/themes.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profil Saya",
          style: primaryTextStyle.copyWith(
              fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilPage()));
                },
                child: Text(
                  "Edit Profil",
                  style: greenTextStyle.copyWith(),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text(
              "Username",
              style: primaryTextStyle.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              "AhmadFulan123",
              style: primaryTextStyle.copyWith(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Email",
              style: primaryTextStyle.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              "ahmadfulan@email.com",
              style: primaryTextStyle.copyWith(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Nomor Telepon",
              style: primaryTextStyle.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              "08123456789",
              style: primaryTextStyle.copyWith(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            SizedBox(
              height: 39,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPasswordPage()));
                  },
                  child: Text(
                    "Reset Password",
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                )
              ],
            ),
            SizedBox(
              height: 39,
            ),
            Text(
              "Log Out →",
              style: redTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
