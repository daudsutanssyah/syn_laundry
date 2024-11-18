import 'package:flutter/material.dart';
import 'package:syn_laundry/pages/edit_profil_page.dart';
import 'package:syn_laundry/pages/reset_password_page.dart';
import 'package:syn_laundry/pages/splash_page.dart';
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
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilPage() ));
                },
                child: Text(
                  "Edit Profil",
                  style: greenTextStyle,
                ),
              ),
            ),
            SizedBox(
              height: 41,
            ),
            Text(
              "Username",
              style: primaryTextStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              "Prabowo",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              "Email",
              style: primaryTextStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              "bowo@gmail.com",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              "Nomer Telepon",
              style: primaryTextStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              "081234567890",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 39,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPasswordPage() ));
              },
              child: Row(
                children: [
                  Text(
                    "Reset Password",
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 24,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 39,
            ),
            GestureDetector(
                onTap: () {
                  // memnunculkan Alert
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Expanded(
                        child: AlertDialog(
                          //title: const Text('Button Clicked!'),
                          content: Text(
                            'Yakin ingin keluar akun?',
                            style: primaryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          actions: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      bottom: 24, left: 20, right: 20),
                                  width: double.infinity,
                                  height: 50,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Color(0xFF4ABF92),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Batalkan",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SplashPage() ));
                              },
                              child: Center(
                                child: Text("Yakin, keluar", style: redTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ), ),
                              ),
                            ),
                            
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  "Log Out →",
                  style: redTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                )),
          ],
        ),
      ),
    );
  }
}