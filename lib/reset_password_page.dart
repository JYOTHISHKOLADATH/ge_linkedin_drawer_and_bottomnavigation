import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/loginpage.dart';

class Resetpassword extends StatefulWidget {
  const Resetpassword({Key? key}) : super(key: key);

  @override
  State<Resetpassword> createState() => _ResetpasswordState();
}

class _ResetpasswordState extends State<Resetpassword> {
  final _newpasswordcontroller = TextEditingController();
  final _renewpasswordcontroller = TextEditingController();

  final SnackBar resetpasswordsnackbar = SnackBar(
    backgroundColor: Colors.red,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(10),
    content: Text("Passsword doesn't match"),
    duration: Duration(seconds: 3),
  );

  final SnackBar resetpasswordcountsnackbar = SnackBar(
    backgroundColor: Colors.red,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(10),
    content: Text("Password should contain atleast 7 characters"),
    duration: Duration(seconds: 3),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff2F4247),
      ),
      body: Container(
        color: Color(0xff2F4247),
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //         begin: Alignment.topCenter,
        //         end: Alignment.bottomLeft,
        //         colors: [Color(0xffBD59F3), Color(0xff8AD2F4)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Reset Password',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.white),
            ),
            // SizedBox(
            //   height: 30,
            // ),
            Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: RichText(
                    text: TextSpan(
                        text: 'Set the new password ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                        children: [
                      TextSpan(
                          text: 'For your account',
                          style: TextStyle(color: Colors.white))
                    ])),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                  child: Column(
                children: [
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //     child: Text('Password',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.deepPurpleAccent),)),
                  Container(
                    // color: Colors.white60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      controller: _newpasswordcontroller,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Enter New Password',
                          hintStyle: TextStyle(fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  // child: Text('Re-enter Password',style: TextStyle(color: Colors.deepPurpleAccent,fontWeight: FontWeight.bold,fontSize: 15),)),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: _renewpasswordcontroller,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'Re-Enter your Password',
                            hintStyle: TextStyle(fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ))
                ],
              )),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: 150,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    checkPassword(context);
                  },
                  child: Text(
                    'RESET',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }

  void checkPassword(BuildContext) {
    final _newpassword = _newpasswordcontroller.text;
    final _renewpassword = _renewpasswordcontroller.text;

    if (_newpassword == _renewpassword && _renewpassword.length >= 7) {
      print(_renewpassword);
      print(_newpassword);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Secondlogin()));
    } else if (_renewpassword.length <= 7) {
      ScaffoldMessenger.of(context).showSnackBar(resetpasswordcountsnackbar);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(resetpasswordsnackbar);
    }
  }
}
