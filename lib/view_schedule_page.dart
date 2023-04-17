import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/active_schedules_page.dart';
import 'package:ge_bottomnavbar_drawer/apiactivities/countingstatisticsActiviyies/countingstatisticsUI.dart';
import 'package:ge_bottomnavbar_drawer/normalmode_screen.dart';
import 'package:ge_bottomnavbar_drawer/quickmode_screen.dart';
import 'package:ge_bottomnavbar_drawer/sorting_listPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'apiactivities/viewschedule_api/viewschedule_api_model.dart';
import 'apiactivities/viewschedule_api/viewschedule_api_service.dart';

class ViewSchedule extends StatefulWidget {
  ViewSchedule(
    this.schedule_id,
    // this.schedulename,
    // this.startdate,
    // this.enddate,
    // this.countingstatus,
    // this.role_id,
    // this.branch_id,
    // this.cmp_id,
    // this.created_at,
    // this.created_by,
    // this.modified_at,
    // this.modified_by,
    // this.status,
    // this.cmp_name,
    // this.branch_name
  );

  int schedule_id;
  // String schedulename;
  // String startdate;
  // String enddate;
  // int countingstatus;
  // int role_id;
  // int branch_id;
  // int cmp_id;
  // String created_at;
  // int created_by;
  // String modified_at;
  // int modified_by;
  // int status;
  // String cmp_name;
  // String branch_name;
  int contgap=5;

  @override
  State<ViewSchedule> createState() => _ViewScheduleState();
}

class _ViewScheduleState extends State<ViewSchedule> {
  late Future<ViewScheduleApiModel> futureAlbum;
  @override
  void initState() {
    // TODO: implement initState
    futureAlbum = viewSchedule(widget.schedule_id);
  }

  @override
  Widget build(BuildContext context) {
    bool isButtonEnabled = false;
    bool isScanShelfVisible = false;
    bool isScanningAlreadyStarted = false;
    TextEditingController shelfId = TextEditingController();

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      // backgroundColor: Colors.orangeAccent,
      // appBar: AppBar(backgroundColor: Theme.of(context).backgroundColor,
      //   iconTheme: Theme.of(context).iconTheme,
      //   title: Text('VIEW SCHEDULE'),),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0,bottom: 10),
              child: SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(width: 30,),
                      Text("View Schdules",style: GoogleFonts.glory(
                          fontWeight: FontWeight.bold,fontSize: 18),),
                      SizedBox(width: 20,)
                    ],
                  )),
            ),
            FutureBuilder(
                future: futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      height: MediaQuery.of(context).size.height *
                          1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SafeArea(
                          //     child: Row(
                          //       mainAxisAlignment: MainAxisAlignment.start,
                          //
                          //       children: [
                          //         InkWell(
                          //           onTap: (){
                          //             Navigator.pop(context);
                          //           },
                          //           child: Padding(
                          //             padding: const EdgeInsets.only(left: 8.0),
                          //             child: Icon(
                          //               Icons.arrow_back,
                          //               color: Colors.black,
                          //             ),
                          //           ),
                          //         ),
                          //         SizedBox(width: 20,),
                          //         Text("View Schdules",style: GoogleFonts.glory(
                          //             fontWeight: FontWeight.bold,fontSize: 18),),
                          //       ],
                          //     )),

                          Lottie.network(
                            'https://assets7.lottiefiles.com/packages/lf20_v25de198.json',
                            // width: 200,
                            // height: 400,
                          ),

                          Container(
                              child: SizedBox(height: 12,))
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    print(snapshot.error);
                    return Container(
                      height: MediaQuery.of(context).size.height *
                          1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // SafeArea(
                          //     child: Row(
                          //       mainAxisAlignment: MainAxisAlignment.start,
                          //
                          //       children: [
                          //         InkWell(
                          //           onTap: (){
                          //             Navigator.pop(context);
                          //           },
                          //           child: Padding(
                          //             padding: const EdgeInsets.only(left: 8.0),
                          //             child: Icon(
                          //               Icons.arrow_back,
                          //               color: Colors.black,
                          //             ),
                          //           ),
                          //         ),
                          //         // SizedBox(width: 20,),
                          //         // Text("View Schdules",style: GoogleFonts.glory(
                          //         //     fontWeight: FontWeight.bold,fontSize: 18),),
                          //       ],
                          //     )),
                          Column(
                            children: [
                              Lottie.network(
                                'https://assets1.lottiefiles.com/packages/lf20_debgr4jk.json',
                                // width: 200,
                                // height: 400,
                              ),
                              Text('Error: ${snapshot.error}',style: GoogleFonts.glory(
                                  fontWeight: FontWeight.bold,fontSize: 18),),
                            ],
                          ),
                          SizedBox(height: 1,)
                        ],
                      ),
                    );
                  } else if (snapshot.hasData) {

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // height: MediaQuery.of(context).size.height *
                        //     .4,
                        decoration: BoxDecoration(
                            color: Color(0xffF7FAFA),
                            borderRadius: BorderRadius.circular(
                               10.0
                            // topLeft: Radius.circular(10),
                            // topRight: Radius.circular(10)
                            )),
                        child: Row(
                          children: [
                            Container(
                              width: 5,
                              height: 230,
                              decoration: BoxDecoration(
                                color: Color(0xffFFB300),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    snapshot.data!.schedulename,
                                      style: GoogleFonts.glory(
                                  fontWeight: FontWeight.bold,fontSize: 25)
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),

                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 3,
                                          child: Container(
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 8.0),
                                              child: Row(
                                                // mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Icon(Icons.calendar_month_sharp),
                                                  // SizedBox(width: 10,),
                                                  SizedBox(
                                                    width: 100,
                                                    child: Text(
                                                      'START DATE',textAlign: TextAlign.center,
                                                        style: GoogleFonts.glory(
                                                            fontWeight: FontWeight.bold,fontSize: 17)
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )),
                                      Expanded(
                                          flex: 0,
                                          child: Container(
                                            child: Text(
                                              ': ',
                                              style: GoogleFonts.glory(
                                                  fontWeight: FontWeight.bold,fontSize: 17),
                                              textAlign: TextAlign.center,
                                            ),
                                          )),
                                      Expanded(
                                          flex: 4,
                                          child: Container(
                                            child: Text(
                                              snapshot.data!.startdate
                                                  .split("T")
                                                  .first,
                                              style: GoogleFonts.glory(
                                                  fontWeight: FontWeight.bold,fontSize: 17),
                                              textAlign: TextAlign.center,
                                            ),
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0,right: 8),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 3,
                                            child: Container(
                                              child: Row(
                                                // mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Icon(Icons.calendar_month),
                                                  SizedBox(width: 10,),
                                                  SizedBox(
                                                    width: 130,
                                                    child: Text(
                                                      'END DATE',
                                                        style: GoogleFonts.glory(
                                                            fontWeight: FontWeight.bold,fontSize: 17)
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )),
                                        Expanded(
                                            flex: 0,
                                            child: Container(
                                              child: Text(
                                                ':',
                                                style: GoogleFonts.glory(
                                                    fontWeight: FontWeight.bold,fontSize: 17),
                                                textAlign: TextAlign.center,
                                              ),
                                            )),
                                        Expanded(
                                            flex: 4,
                                            child: Container(
                                              child: Text(
                                                snapshot.data!.enddate
                                                    .split("T")
                                                    .first,
                                                style: GoogleFonts.glory(
                                                    fontWeight: FontWeight.bold,fontSize: 17),
                                                textAlign: TextAlign.center,
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    // color: Color(0xffF5BB98),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 3,
                                            child: Container(
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 8.0),
                                                child: Row(
                                                  // mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Icon(Icons.business_sharp),
                                                    SizedBox(width: 10,),
                                                    SizedBox(
                                                      width: 100,
                                                      child: Text(
                                                        'BRANCH',
                                                        style: GoogleFonts.glory(
                                                            fontWeight: FontWeight.bold,fontSize: 17),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )),
                                        Expanded(
                                            flex: 0,
                                            child: Container(
                                              child: Text(
                                                ': ',
                                                style: GoogleFonts.glory(
                                                    fontWeight: FontWeight.bold,fontSize: 17),
                                                textAlign: TextAlign.center,
                                              ),
                                            )),
                                        Expanded(
                                            flex: 4,
                                            child: Container(
                                              child: Text(
                                                snapshot.data!.branch_name.toUpperCase(),
                                                style: GoogleFonts.glory(
                                                    fontWeight: FontWeight.bold,fontSize: 17),
                                                textAlign: TextAlign.center,
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0,right: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                            flex: 3,
                                            child: Container(
                                              constraints: BoxConstraints(maxWidth: 200),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.run_circle),
                                                  SizedBox(width: 10,),
                                                  SizedBox(
                                                    width: 100,
                                                    child: Text(
                                                      'COUNTING STATUS',
                                                        maxLines: null,
                                                        overflow: TextOverflow.visible,
                                                        style: GoogleFonts.glory(
                                                            fontWeight: FontWeight.bold,fontSize:17)
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )),
                                        Expanded(
                                            flex: 0,
                                            child: Container(
                                              child: Text(
                                                ': ',
                                                style: GoogleFonts.glory(
                                                    fontWeight: FontWeight.bold,fontSize: 17),
                                                textAlign: TextAlign.left,
                                              ),
                                            )),
                                        Expanded(
                                            flex: 4,
                                            child: Container(
                                              child: snapshot.data!.status == 1
                                                  ? Text(
                                                      'Active',
                                                style: GoogleFonts.glory(
                                                    fontWeight: FontWeight.bold,fontSize: 17,color: Colors.green),
                                                      textAlign: TextAlign.center,
                                                    )
                                                  : Text("Inactive",style: GoogleFonts.glory(
                                                  fontWeight: FontWeight.bold,fontSize: 17,color: Colors.red)),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return Text("Something wrong!");
                }),
            SizedBox(height: 50,),
            Icon(Icons.qr_code_scanner_sharp),
            // Visibility(
            //     child: Text(
            //   "PLEASE SCAN A SHELF",
            //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            // )),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 28.0,right: 28),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xffF7FAFA)),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Color(0xffF7FAFA),),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color:Color(0xffF7FAFA),),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Color(0xffF7FAFA)), // set border color here
                    ),
                    contentPadding: EdgeInsets.all(10.0),
                  ),
                  controller: shelfId,
                  onChanged: (value) {
                  },
                ),
              ),
            ),
            // SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Visibility(
                  visible: isScanningAlreadyStarted,
                  child: Expanded(
                    child: Container(
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll<Color>(
                                      Color(0xff191B26)),
                              shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: Text('RESUME',style: GoogleFonts.glory(
                                fontSize: 18),)),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isScanningAlreadyStarted,
                  child: Expanded(
                    child: Container(
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll<Color>(
                                      Color(0xff191B26)),
                              shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: Text('SCAN NEW SHELF',style: GoogleFonts.glory(
                              fontSize: 18),)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 20,),
                Container(
                  width: double.maxFinite,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 28.0,right: 28,top: 8),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(Color(0xff191B26)),
                          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          print("Before pressing $isScanningAlreadyStarted");
                          setState(() {
                            isScanningAlreadyStarted = true;
                          });
                          print("After pressing $isScanningAlreadyStarted");
                          if (shelfId.text != "") {

    Navigator.push(context, new MaterialPageRoute(
    builder: (context) => SortinList(shelfId.text)
    )).then((value) {
    //This makes sure the textfield is cleared after page is pushed.
    shelfId.clear();});

                            // shelfId.clear();
                          } else {

                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return
                                    AlertDialog(
                                      // contentPadding: EdgeInsets.symmetric(vertical: 118.0, horizontal: 12.0),
                                    title: Text('Enter a valid Shelf ID',style: GoogleFonts.glory(
                                        fontSize: 28,fontWeight: FontWeight.bold),),
                                    content: Container(
                                      height: 100,
                                      color: Color(0xffFFFFFF),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Spacer(),
                                            ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor: MaterialStatePropertyAll<Color>(
                                                    Color(0xff191B26)),
                                                shape:
                                                MaterialStatePropertyAll<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(0.0),
                                                  ),
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("Ok",style: GoogleFonts.glory(
                                                  fontSize: 18,fontWeight: FontWeight.bold),),
                                            ),
                                        ],
                                      ),
                                    ),
                                    // actions: <Widget>[

                                    // ],
                                  );
                                });
                          }

                        },
                        child: Text('START',style: GoogleFonts.glory(
                            fontSize: 18),)),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: double.maxFinite,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 28.0,right: 28),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStatePropertyAll<Color>(Color(0xff191B26)),
                          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyWidget(id: widget.schedule_id,)
                                      ));
                        },
                        child: Text('COUNTING STATISTICS',style: GoogleFonts.glory(
                            fontSize: 18),)
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(
              height: 50,
            ),
            // Image(image: AssetImage("image/zebraicon.png"))
          ],
        ),
      ),
    );
  }
}
