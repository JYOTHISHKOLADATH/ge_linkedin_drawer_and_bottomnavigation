import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/apiservices.dart';
import 'package:ge_bottomnavbar_drawer/forgot_password_page.dart';
import 'package:ge_bottomnavbar_drawer/new_api_model.dart';
import 'package:ge_bottomnavbar_drawer/newapiservices.dart';
import 'package:ge_bottomnavbar_drawer/otp_page.dart';
import 'package:ge_bottomnavbar_drawer/screen.dart';
import 'package:ge_bottomnavbar_drawer/splash_screen_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginapimodel.dart';

class Secondlogin extends StatefulWidget {
  const Secondlogin({Key? key}) : super(key: key);

  @override
  State<Secondlogin> createState() => _SecondloginState();
}

class _SecondloginState extends State<Secondlogin> {
  bool futureVisible = false;
  bool loginApiRun = false;
  TextEditingController _useremail = new TextEditingController();
  TextEditingController _userpassword = new TextEditingController();
  bool _isvalidpassowd = false;
  bool _isvalidemail = false;
  bool vis = false;
  bool mailerror = false;
  bool passerror = false;
  final validationkey = GlobalKey<FormState>();
  String Password = '';
  bool isPasswordvisible = true;
  // List<ApiModel> listMessage=[];
  UserApiServices client = UserApiServices();

  // late Future<ModalLoginStatus> futurealbum;
  // late  Future<ApiModel> albamfuture ;
  // =UserApiServices().validationOfUser(_useremail.text, _userpassword.text);
  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SingleChildScrollView(
        child: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage("image/WhatsApp Image 2023-03-30 at 10.14.39 AM.jpeg"),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: Center(
            child: Container(
              // color: Color(0xff2F4247),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 180,),
                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Spacer(),
                        // Container(
                        //   height: 100,
                        //     child: Image(image: AssetImage("image/logo.jpg"))),
                        RichText(
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
                        ),
                        SizedBox(height: 100,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Center(
                              child: RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                  text: 'Login ',
                                  style: GoogleFonts.glory(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35,
                                      color: Color(0xff191B26)),
                                  // children: [
                                  //   TextSpan(
                                  //       text: 'STOCKCOUNT',
                                  //       style: TextStyle(color: Colors.yellow.shade200))
                                  // ]
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                            key: validationkey,
                            child: Column(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white),
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.black),
                                      controller: _useremail,
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffA7ADA8)),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffA7ADA8)),
                                        ),
                                        suffixIcon: Visibility(
                                            visible: vis,
                                            child: Icon(
                                              Icons.error_outline,
                                              color: Colors.red,
                                            )),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        hintText: 'User Id',
                                        hintStyle: GoogleFonts.glory(
                                            // fontWeight: FontWeight.bold,
                                            color: Color(0xff191B26)),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          setState(() {
                                            vis = true;
                                            mailerror = true;
                                            _isvalidemail = false;
                                          });
                                          return null;
                                        }
                                        if (!RegExp(
                                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                            .hasMatch(value)) {
                                          setState(() {
                                            vis = false;
                                            mailerror = false;
                                            _isvalidemail = true;
                                          });
                                          return null;
                                        }
                                        setState(() {
                                          vis = false;
                                          mailerror = false;
                                          _isvalidemail = true;
                                        });
                                        return null;
                                      },
                                    )),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Visibility(
                                        visible: mailerror,
                                        child: Text(
                                          'Enter a valid UserId',
                                          style: TextStyle(color: Colors.red),
                                        ))),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white),
                                    child: TextFormField(
                                      controller: _userpassword,
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffA7ADA8)),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffA7ADA8)),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: Colors
                                                    .yellow), // set border color here
                                          ),
                                          hintText: 'Password',
                                          hintStyle:
                                          GoogleFonts.glory(
                                              // fontWeight: FontWeight.bold,
                                              color: Color(0xff191B26)),
                                          suffixIcon: IconButton(
                                            icon: isPasswordvisible
                                                ? Icon(Icons.visibility_off,color: Colors.grey,)
                                                : Icon(Icons.visibility,color: Colors.grey,),
                                            onPressed: () {
                                              setState(() {
                                                isPasswordvisible =
                                                    !isPasswordvisible;
                                              });
                                            },
                                          )),
                                      obscureText: isPasswordvisible,
                                      validator: (value) {
                                        if (value == null ||
                                            value.isEmpty ||
                                            value.length <= 2) {
                                          setState(() {
                                            _isvalidpassowd = false;
                                            passerror = true;
                                          });
                                        } else {
                                          setState(() {
                                            _isvalidpassowd = true;
                                            passerror = false;
                                          });
                                        }
                                      },
                                    )),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Visibility(
                                        visible: passerror,
                                        child: Text(
                                          'Enter a valid password',
                                          style: TextStyle(color: Colors.red),
                                        ))),
                              ],
                            )),
                        SizedBox(height: 30),
                        SizedBox(
                          height: 35,
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () async {
                              // if successfully logged in
                              if (validationkey.currentState!.validate()) {
                                if (_isvalidpassowd && _isvalidemail) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Mainpage(useremail: _useremail.text),
                                      ));
                                  // var   data =       UserApiServices().validationOfUser(_useremail.text, _userpassword.text);
                                  // someFunction();
                                  // print(apiModel);
                                }
                              }
                            },
                            child: Text(
                              'Login',
                              style: GoogleFonts.glory(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            // style: ElevatedButton.styleFrom(
                            //   backgroundColor: Colors.white,
                            //   foregroundColor: Colors.black,
                            // )
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor: Color(0xff191B26),
                                foregroundColor: Colors.white),
                          ),
                        ),
                        // Visibility(
                        //   visible: futureVisible,
                        //   child: FutureBuilder<ApiModel>(
                        //     future: albamfuture,
                        //       builder: (context,snapshot){
                        //     if(snapshot.hasData){
                        //       print(snapshot.data!.message);
                        //       // return Text(snapshot.data!.message.toString());
                        //        if(snapshot.data!.message=="${_useremail.text} is Already Logged In!"){
                        //          // Navigator.push(
                        //          //     context,
                        //          //     MaterialPageRoute(
                        //          //       builder: (context) => Forgotpassword(),
                        //          //     ));
                        //          return AlertDialog(
                        //            title: Text('User Already loged in!!'),
                        //            actions: <Widget>[
                        //              TextButton(
                        //                child: Text('Ok'),
                        //                onPressed: () {
                        //                  Navigator.of(context).pop();
                        //                },
                        //              ),
                        //            ],
                        //          );
                        //        }else{
                        //          // print("${_useremail.text} is Already Logged In!");
                        //          // print(snapshot.data!.message.toString());
                        //          return Text("${snapshot.data!.message.toString()} !!!",style: TextStyle(fontSize: 20,color: Colors.red),);
                        //        }
                        //     }else if(snapshot.hasError){
                        //       print("${snapshot.error}");
                        //       return Text("${snapshot.error}");
                        //     }else if(snapshot.connectionState==ConnectionState.waiting){
                        //       return Text("waiting.....");
                        //     }
                        //     print(snapshot);
                        //    return CircularProgressIndicator();
                        //   }),
                        // ),
                        // SizedBox(
                        //   height: 50,
                        // ),
                        // Spacer(),
                        // SizedBox(height: 30,),
                        // InkWell(
                        //   child: Text(
                        //     'forgot password?',
                        //     style: TextStyle(
                        //         color: Colors.white70, fontWeight: FontWeight.bold),
                        //   ),
                        //   onTap: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) => Forgotpassword(),
                        //         ));
                        //   },
                        // ),
                        // Spacer()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> saveLogincrd() async {
    final userID = await SharedPreferences.getInstance();
    await userID.setString('nameofuser', _useremail.text);
  }

  void someFunction() async {
    UserApiServices userApiServices = UserApiServices();
    ApiModel apiModel; // Declare the variable here
    try {
      ApiModel apiModel = await userApiServices.validationOfUser(
          _useremail.text, _userpassword.text);
      // Use the returned value of apiModel here
      if (apiModel.message == "${_useremail.text} is Already Logged In!") {
        saveLogincrd();
        var sharedPref = await SharedPreferences.getInstance();
        sharedPref.setBool(SplashscreenState.KEYLOGIN, true);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Mainpage(useremail: _useremail.text),
            ));
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Invalid UserID/Password  '),
                actions: <Widget>[
                  TextButton(
                    child: Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
      }
      print(apiModel.message);
    } catch (e) {
      // Handle the error if any
    }
  }
}
