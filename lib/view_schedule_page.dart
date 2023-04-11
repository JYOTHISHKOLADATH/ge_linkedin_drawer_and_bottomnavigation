import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/active_schedules_page.dart';
import 'package:ge_bottomnavbar_drawer/apiactivities/countingstatisticsActiviyies/countingstatisticsUI.dart';
import 'package:ge_bottomnavbar_drawer/normalmode_screen.dart';
import 'package:ge_bottomnavbar_drawer/quickmode_screen.dart';
import 'package:ge_bottomnavbar_drawer/sorting_listPage.dart';

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
      backgroundColor: Color(0xffE8F9FF),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.arrow_back_ios_sharp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text("View Schdules",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      SizedBox(width: 20,)
                    ],
                  )),
            ),
            FutureBuilder(
                future: futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    print(snapshot.error);
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height *
                            .4,
                        decoration: BoxDecoration(
                            color: Color(0XFFFFFFFF),
                            borderRadius: BorderRadius.circular(
                               20.0
                            // topLeft: Radius.circular(10),
                            // topRight: Radius.circular(10)
                            )),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              snapshot.data!.schedulename,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Container(
                              // color: Color(0xffF5BB98),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0,right: 8),
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
                                                Icon(Icons.insert_drive_file_rounded),
                                                SizedBox(width: 20,),
                                                Text(
                                                  'START DATE',textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                          child: Text(
                                            ':',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child: Container(
                                          child: Text(
                                            snapshot.data!.startdate
                                                .split("T")
                                                .first,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                            textAlign: TextAlign.start,
                                          ),
                                        )),
                                  ],
                                ),
                              ),
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
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Row(
                                            // mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Icon(Icons.file_open),
                                              SizedBox(width: 20,),
                                              Text(
                                                'END DATE',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        child: Text(
                                          ':',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                        child: Text(
                                          snapshot.data!.enddate
                                              .split("T")
                                              .first,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                          textAlign: TextAlign.start,
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
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0,right: 8),
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
                                                SizedBox(width: 20,),
                                                Text(
                                                  'BRANCH',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                          child: Text(
                                            ':',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child: Container(
                                          child: Text(
                                            snapshot.data!.branch_name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                            textAlign: TextAlign.start,
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0,right: 8),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            'COUNTING STATUS',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        child: Text(
                                          ':',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                        child: snapshot.data!.status == 1
                                            ? Text(
                                                'Active',
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    fontSize: 15),
                                                textAlign: TextAlign.left,
                                              )
                                            : Text("Inactive"),
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
                    color: Colors.white),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Color(0xffE8F9FF),),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Color(0xffE8F9FF),),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.yellow), // set border color here
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll<Color>(
                                      Colors.teal),
                            ),
                            onPressed: () {},
                            child: Text('RESUME')),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isScanningAlreadyStarted,
                  child: Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll<Color>(
                                      Colors.teal),
                            ),
                            onPressed: () {},
                            child: Text('SCAN NEW SHELF')),
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 28.0,right: 28,top: 8),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(Colors.teal),
                          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
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
                                  return AlertDialog(
                                    title: Text('Enter a valid Shelf ID'),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStatePropertyAll<Color>(
                                              Colors.deepPurple),
                                          shape:
                                          MaterialStatePropertyAll<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Ok"),
                                      ),
                                    ],
                                  );
                                });
                          }

                        },
                        child: Text('START',style: TextStyle(fontSize: 15),)),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 28.0,right: 28),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.deepPurple),
                          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
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
                        child: Text('COUNTING STATISTICS',style: TextStyle(fontSize: 15),)
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
