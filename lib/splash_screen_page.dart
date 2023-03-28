import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/forgot_password_page.dart';
import 'package:ge_bottomnavbar_drawer/loginpage.dart';
import 'package:ge_bottomnavbar_drawer/screen.dart';
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
      backgroundColor: Color(0xffE8F9FF),
      body: Center(
        child: Container(
            child: RichText(
          text: TextSpan(
              text: 'GE ',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: 'STOCKCOUNT',
                    style: TextStyle(
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                        fontSize: 30))
              ]),
        )),
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
