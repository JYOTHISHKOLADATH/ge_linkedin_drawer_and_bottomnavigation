import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ge_bottomnavbar_drawer/reset_password_page.dart';

class Otppage extends StatefulWidget {
  final String emailname;

  Otppage({required this.emailname});

  @override
  State<Otppage> createState() => _OtppageState();
}

class _OtppageState extends State<Otppage> {
  final formkey = GlobalKey<FormState>();
  final SnackBar otpsnack = SnackBar(
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(10),
    backgroundColor: Colors.red,
    content: Text('Enter a valid OTP'),
    duration: Duration(seconds: 3),
  );

  bool _isvalid1 = false;
  bool _isvalid2 = false;
  bool _isvalid3 = false;
  bool _isvalid4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2F4247),
        elevation: 0,
      ),
      body: Container(
          color: Color(0xff2F4247),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Enter 4 DigitCode',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  // SizedBox(height: 10,),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                        text: TextSpan(
                            text:
                                'Enter the 4 digit code that you recived on your email - ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            children: [
                          TextSpan(
                              text: '${widget.emailname}',
                              style: TextStyle(
                                  color: Colors.redAccent, fontSize: 20))
                        ])),
                  ),
                  // Spacer(),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                      key: formkey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 64,
                            width: 64,
                            child: Container(
                              color: Color(0XFF4B4B4B),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    // ScaffoldMessenger.of(context).showSnackBar(otpsnack);
                                    _isvalid1 = false;
                                    return null;
                                  } else {
                                    _isvalid1 = true;
                                    return null;
                                  }
                                },
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder()),
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 64,
                            width: 64,
                            child: Container(
                              color: Color(0XFF4B4B4B),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    // ScaffoldMessenger.of(context).showSnackBar(otpsnack);
                                    _isvalid2 = false;
                                    return null;
                                  } else {
                                    _isvalid2 = true;
                                    return null;
                                  }
                                },
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  } else {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder()),
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 64,
                            width: 64,
                            child: Container(
                              color: Color(0XFF4B4B4B),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    // ScaffoldMessenger.of(context).showSnackBar(otpsnack);
                                    _isvalid3 = false;
                                    return null;
                                  } else {
                                    _isvalid3 = true;
                                    return null;
                                  }
                                },
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  } else {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder()),
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 64,
                            width: 64,
                            child: Container(
                              color: Color(0XFF4B4B4B),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    // ScaffoldMessenger.of(context).showSnackBar(otpsnack);
                                    _isvalid4 = false;
                                    return null;
                                  } else {
                                    _isvalid4 = true;
                                  }
                                },
                                onChanged: (value) {
                                  setState(() {
                                    if (value.length == 0) {
                                      FocusScope.of(context).previousFocus();
                                    }
                                  });
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder()),
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        if (_isvalid4 && _isvalid3 && _isvalid2 && _isvalid1) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Resetpassword()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(otpsnack);
                        }
                      }
                    },
                    child: Text('CONTINUE'),
                  ),
                  Spacer(),
                ],
              ),
            ),
          )),
    );
  }
}
