import 'package:flutter/material.dart';
import 'package:syn_laundry/themes/themes.dart';

class SuksesPage extends StatelessWidget {
  const SuksesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/img-sukses.png", width: 177, height: 177,),
          Column(
            children: [
              Text("Hore! Pesanan Telah", style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w500
              ),),
              Text("Terkonfirmasi", style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w500
              ),),
              SizedBox(height: 30,),
              Text("Tim kami akan segera menjemput ", style: secondaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500
              ),),
              Text("cucianmu mohon ditunggu ya! ", style: secondaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500
              ),),
              SizedBox(height: 30,),
              Container(
                  height: 50,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: TextButton(
                    onPressed: null,
                    style: TextButton.styleFrom(
                        backgroundColor: Color(0xFF4ABF92),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Text(
                      "Cek Pesanan",
                      style: 
                      TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
          ),
          ],
      ),
      
    ),
    );
  }
}