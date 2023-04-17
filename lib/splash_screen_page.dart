import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/forgot_password_page.dart';
import 'package:ge_bottomnavbar_drawer/loginpage.dart';
import 'package:ge_bottomnavbar_drawer/screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => SplashscreenState();
}

class SplashscreenState extends State<Splashscreen> {
  static const String KEYLOGIN = "Login";
  static const String KEYUSERNAME = "User_Cred";
  @override
  void initState() {
    super.initState();

    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Center(
        child: Container(
            child:  RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                  text: 'GE ',
                  style: GoogleFonts.glory(
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                      color: Color(0xff191B26)),
                  children: [
                    TextSpan(
                      text: 'STOCKCOUNT',
                      style: GoogleFonts.glory(
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                          color: Color(0xff191B26)),)
                  ]
              ),
            ),),
      ),
    );
  }

  void whereToGo() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    var userName = sharedPrefs.getString('nameofuser');

    var sharedpref = await SharedPreferences.getInstance();
    var loginstatus = sharedpref.getBool(KEYLOGIN);
    Timer(Duration(seconds: 5), () {
      if (loginstatus != null) {
        if (loginstatus) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Mainpage(useremail: userName! ?? ""),
              ));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Secondlogin(),
              ));
        }
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Secondlogin(),
            ));
      }
    });
  }
}
