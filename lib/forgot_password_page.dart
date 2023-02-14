import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/otp_page.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({Key? key}) : super(key: key);

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

TextEditingController _enteredemail = new TextEditingController();

class _ForgotpasswordState extends State<Forgotpassword> {
  bool mailisvalid = false;
  bool formailvalid = false;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2F4247),
        shadowColor: Color(0xff2F4247),
        elevation: 0,
      ),
      body: Container(
        color: Color(0xff2F4247),
        // width: double.maxFinite,
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //         begin: Alignment.topCenter,
        //         end: Alignment.bottomLeft,
        //         colors: [Color(0xffBD59F3), Color(0xff8AD2F4)])),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Forgot Password',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              // SizedBox(height: 40,),
              Spacer(),
              RichText(
                text: TextSpan(
                    text: 'Enter your Email ',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: 'We will send 4 digits code',
                          style: TextStyle(color: Colors.white70, fontSize: 15))
                    ]),
              ),
              SizedBox(
                height: 30,
              ),
              // Align(alignment: Alignment.centerLeft
              // ,child: Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text('Email',style: TextStyle(fontSize: 20,color: Colors.indigo,fontWeight: FontWeight.bold),),
              // )),
              Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          // height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            controller: _enteredemail,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                                hintText: 'Enter your email id',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                // label: Text('Enter your email id',style: TextStyle(color: Colors.deepPurpleAccent,fontWeight: FontWeight.bold),),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                formailvalid = true;
                                mailisvalid = false;
                                return null;
                              }

                              if (!RegExp(
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                  .hasMatch(value)) {
                                formailvalid = true;
                                mailisvalid = false;
                                return null;
                              }
                              mailisvalid = true;
                              return null;
                            },
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 23.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Visibility(
                                visible: formailvalid,
                                child: Text(
                                  'Enter a valid e- mail',
                                  style: TextStyle(color: Colors.red),
                                ))),
                      ),
                    ],
                  )),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      if (mailisvalid) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                Otppage(emailname: _enteredemail.text)));
                      } else {
                        setState(() {
                          formailvalid = true;
                        });
                      }
                    }
                  },
                  child: Text('CONTINUE')),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
