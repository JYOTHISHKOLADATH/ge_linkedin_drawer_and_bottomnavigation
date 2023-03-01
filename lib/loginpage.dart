import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/apiservices.dart';
import 'package:ge_bottomnavbar_drawer/forgot_password_page.dart';
import 'package:ge_bottomnavbar_drawer/otp_page.dart';
import 'package:ge_bottomnavbar_drawer/sample_model%20%20class.dart';
import 'package:ge_bottomnavbar_drawer/screen.dart';
import 'package:ge_bottomnavbar_drawer/splash_screen_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Secondlogin extends StatefulWidget {
  const Secondlogin({Key? key}) : super(key: key);

  @override
  State<Secondlogin> createState() => _SecondloginState();
}

class _SecondloginState extends State<Secondlogin> {
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
  late Future<ModalLoginStatus> futurealbum;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   futurealbum=  ApiServices().validateUser(_useremail.text, _userpassword.text);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Container(
          color: Color(0xff2F4247),
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: 'GE ',
                            style: TextStyle(
                                fontSize: 38, fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                  text: 'STOCKCOUNT',
                                  style: TextStyle(color: Colors.indigo))
                            ]),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                Form(
                    key: validationkey,
                    child: Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[200]),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              controller: _useremail,
                              decoration: InputDecoration(
                                suffixIcon: Visibility(
                                    visible: vis,
                                    child: Icon(
                                      Icons.error_outline,
                                      color: Colors.red,
                                    )),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: 'Email Adress',
                                hintStyle: TextStyle(color: Colors.black),
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
                                  'Enter a valid e- mail',
                                  style: TextStyle(color: Colors.red),
                                ))),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[200]),
                            child: TextFormField(
                              controller: _userpassword,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(color: Colors.black),
                                  suffixIcon: IconButton(
                                    icon: isPasswordvisible
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        isPasswordvisible = !isPasswordvisible;
                                      });
                                    },
                                  )),
                              obscureText: isPasswordvisible,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length <= 7) {
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
                  height: 30,
                ),
                Container(
                  width: 250,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () async {
                      // if successfully logged in
                      saveLogincrd();
                      var sharedPref = await SharedPreferences.getInstance();
                      sharedPref.setBool(SplashscreenState.KEYLOGIN, true);
                      if (validationkey.currentState!.validate()) {
                        if (_isvalidpassowd && _isvalidemail) {


                          Navigator.of(context).pushReplacement(
                                       MaterialPageRoute(
                                           builder: (context) =>
                                               Mainpage(useremail: _useremail.text)));
                          // validation using API ---start

                          // void didChangeDependencies() {
                          //   ApiServices().validateUser(_useremail.text, _userpassword.text);
                          // }



                      // ---------------------    // ApiCalled here-----------------------------
                      //    loginApiRun = true;
                          //     ApiServices().validateUser(
                      //         _useremail.text, _userpassword.text);
// ____-------------------------------Finish--------------------------------


                          print('jyothish');
                          //
                          // FutureBuilder (future:ApiServices().validateUser(_useremail.text, _userpassword.text),
                          // builder: (context, content){
                          //    if (content.connectionState == ConnectionState.waiting){
                          //     return Center(child: CircularProgressIndicator());
                          //   }else if (content.hasError){
                          //     return Center(
                          //       child: Text('Error: ${content.error}'),
                          //     );
                          //   }else if(content.hasData){
                          //     // final List<ModalLoginStatus>? alertmessage=content.data;
                          //    if(content.data![0].message=="$_useremail is Already Logged In!"){
                          //      Navigator.of(context).pushReplacement(
                          //          MaterialPageRoute(
                          //              builder: (context) =>
                          //                  Mainpage(useremail: _useremail.text)));
                          //    }else{
                          //      showDialog(context: context, builder: (BuildContext context){
                          //        return AlertDialog(content: Text('${content.data![0].message}'),);
                          //      });
                          //        // AlertDialog(content: Text('${content.data![0].message}'),);
                          //    }
                          //   }
                          //    return Container();
                          // },);

                          // validation using API ---end

                          // Navigator.of(context).pushReplacement(
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             Mainpage(useremail: _useremail.text)));
                        }
                      }
                    },
                    child: Text('Login',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    // style: ElevatedButton.styleFrom(
                    //   backgroundColor: Colors.white,
                    //   foregroundColor: Colors.black,
                    // )
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white),
                  ),
                ),
    //             FutureBuilder<ModalLoginStatus>(
    //                 future: ApiServices()
    //                     .validateUser(_useremail.text, _userpassword.text),
    //                 builder: (context, content) {
    //                   if (loginApiRun) {
    //                     if (content.hasData) {
    //                       print("hello world");
    //                       if (content.data!.message ==
    //                           "$_useremail is Already Logged In!") {
    //                         Navigator.of(context).pushReplacement(
    //                             MaterialPageRoute(
    //                                 builder: (context) =>
    //                                     Mainpage(useremail: _useremail.text)));
    //                       } else {
    // showDialog(context: context, builder: (BuildContext context){
    //        return AlertDialog(content: Text('${content.data!.message}'),actions: [
    //          TextButton(onPressed: (){
    //            Navigator.of(context).pushReplacement(
    //                MaterialPageRoute(
    //                    builder: (context) =>
    //                        Mainpage(useremail: _useremail.text)));
    //          }, child: Text("ok"))
    //        ],);});
    //                       }
    //                     } else if (content.hasError) {
    //                       print(content.error);
    //                     } else if (content.connectionState ==
    //                         ConnectionState.waiting) {
    //                       return CircularProgressIndicator();
    //                     }
    //                     return SizedBox();
    //                     loginApiRun = false;
    //                   } else {
    //                     return SizedBox();
    //                     loginApiRun = false;
    //                   }
    //                 }),
                SizedBox(
                  height: 20,
                ),
                // Spacer(),
                // SizedBox(height: 30,),
                InkWell(
                  child: Text(
                    'forgot password?',
                    style: TextStyle(
                        color: Colors.white70, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Forgotpassword(),
                        ));
                  },
                ),
                Spacer()
              ],
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
}
