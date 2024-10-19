import 'package:flutter/material.dart';
import 'package:syn_laundry/pages/beranda_page.dart';
import 'package:syn_laundry/pages/register_page.dart';
import 'package:syn_laundry/themes/themes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          //baris 1
          Image.asset('assets/img-login.png'),
          SizedBox(
            height: 37,
          ),
          // baris 2
          Center(
            child: Text(
              "Laundry lebih Mudah!",
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // baris 3 : kolom input
          Container(
            margin: EdgeInsets.only(top: 60, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: greyColor,
                      )
                    ),
                    
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: greyColor,
                      )
                    ),
                    hintText: "Masukkan Username",
                    hintStyle: secondaryTextStyle,
                  ),
                ),
                SizedBox(
                  height: 37,
                ),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    suffix: Image.asset('assets/ic-eye.png', width: 16,),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: greyColor,
                      )
                    ),
                    
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: greyColor,
                      )
                    ),
                    hintText: "Masukkan Password",
                    hintStyle: secondaryTextStyle,
                  ),
                ),
                SizedBox(
                  height: 37,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text("Lupa Password?", style: greenTextStyle.copyWith(
                    fontSize: 16,
                  ),)),
                SizedBox(
                  height: 37,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BerandaPage()));
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: null,
                      style: TextButton.styleFrom(
                          backgroundColor: Color(0xFF4ABF92),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Text(
                        "Masuk",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //baris ke 4
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Belum punya akun?", style: secondaryTextStyle.copyWith(fontSize: 16)),
              SizedBox(width: 2,),
              InkWell(
                onTap: () {
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: Text("Daftar", style: greenTextStyle.copyWith(fontSize: 16)
                ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
