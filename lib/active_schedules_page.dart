import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/view_schedule_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';


import 'apiactivities/activescheduleapi/activescheduleapiservice.dart';
import 'apiactivities/activescheduleapi/apimodel.dart';

class ActiveSchedulesPage extends StatefulWidget {
  const ActiveSchedulesPage({Key? key}) : super(key: key);

  @override
  State<ActiveSchedulesPage> createState() => _ActiveSchedulesPageState();
}

class _ActiveSchedulesPageState extends State<ActiveSchedulesPage> {
  @override
  Widget build(BuildContext context) {
    ScheduleAPIService _futureSchedule = ScheduleAPIService();

    // ScheduleAPIService client= ScheduleAPIService();
    // List stockSchedule = ["GE STOCK COUNT JAN'23", "GE STOCK COUNT JUNE'23"];

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
// backgroundColor: Colors.red,
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).backgroundColor,
      //   iconTheme: Theme.of(context).iconTheme,
      //   title: Text("ACTIVE SCHEDULE"),
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SafeArea(
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
                    SizedBox(width: 20,),
                    Text("Schedules",style: GoogleFonts.glory(
                        fontWeight: FontWeight.bold,fontSize: 18),),
                  ],
                )),
            FutureBuilder(
                future: _futureSchedule.showingSchedule(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    print(schedulelist);
                    return  Container(
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
                          //         SizedBox(width: 20,),
                          //         Text("Schedules",style: GoogleFonts.glory(
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
                    print(schedulelist);
                    return Container(
                      height: MediaQuery.of(context).size.height *
                          1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      // SafeArea(
                      // child: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      //
                      //   children: [
                      //     InkWell(
                      //       onTap: (){
                      //         Navigator.pop(context);
                      //       },
                      //       child: Padding(
                      //         padding: const EdgeInsets.only(left: 8.0),
                      //         child: Icon(
                      //           Icons.arrow_back,
                      //           color: Colors.black,
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(width: 20,),
                      //     Text("Schedules",style: GoogleFonts.glory(
                      //         fontWeight: FontWeight.bold,fontSize: 18),),
                      //   ],
                      // )),
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
                    print(schedulelist);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(Icons.arrow_drop_down_circle_outlined,size: 20,),
                              Text(
                                "Active schedules(${snapshot.data!.length})",
                  style: GoogleFonts.glory(
                  color: Color(0xff666666),fontSize: 20,fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 30),
                              child: ListView.builder(
                                padding: EdgeInsets.only(top: 10),
                                  shrinkWrap: true,
                                  // physics: ScrollPhysics(),
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (BuildContext context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 15.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ViewSchedule(
                                                        snapshot.data![index]
                                                            .schedule_id,
                                                      )));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Color(0xffF7FAFA),
                                            // color: Colors.green,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(right: 8.0,top: 0,bottom: 0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  // child: Expanded(child: Column()),
                                                  width: 5,
                                                  height: MediaQuery.of(context).size.height *
                                                      .15,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xffFFB300),
                                                    borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(20),
                                                      bottomLeft: Radius.circular(20),
                                                    ),
                                                  ),
                                                ),

                                                SizedBox(width: 20,),
                                                Expanded(
                                                  flex: 3,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(right: 8.0),
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.end,
                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                          children: [
                                                            snapshot.data![index].countingstatus == 1
                                                                ? Text("Pending",style: GoogleFonts.glory(
                                                                color: Colors.red,fontSize: 15),)
                                                                : Text("In Progress",style: GoogleFonts.glory(
                                                                color: Colors.orange,fontSize: 15),),
                                                          ],
                                                        ),
                                                      ),

                                                      Text(snapshot.data![index].schedulename.toUpperCase(),style: GoogleFonts.glory(
                                                          fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width * 0.05,),),
                                                    SizedBox(height: 6,),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex:1,
                                                          child: Text("Company",style: GoogleFonts.glory(
                                                              color: Color(0xff666666),fontSize: MediaQuery.of(context).size.width * 0.04,fontWeight: FontWeight.bold),),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Text(":",style: GoogleFonts.glory(
                                                  fontSize: MediaQuery.of(context).size.width * 0.04,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Text(snapshot.data![index].cmp_name.toUpperCase(),style: GoogleFonts.glory(
                                                              color: Color(0xff666666),fontSize: MediaQuery.of(context).size.width * 0.04,fontWeight: FontWeight.bold),),
                                                        ),
                                                      ],
                                                    ),
                                                      SizedBox(height: 5,),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            flex:1,
                                                            child: Text("Branch",style: GoogleFonts.glory(
                                                                color: Color(0xff666666),fontSize: MediaQuery.of(context).size.width * 0.04,fontWeight: FontWeight.bold),),
                                                          ),
                                                          Expanded(
                                                            flex: 1,
                                                            child: Text(":",style: GoogleFonts.glory(
                                                                color: Color(0xff666666),fontSize: MediaQuery.of(context).size.width * 0.04,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: Text(snapshot.data![index].branch_name.toUpperCase(),style: GoogleFonts.glory(
                                                                color: Color(0xff666666),fontSize: MediaQuery.of(context).size.width * 0.04,fontWeight: FontWeight.bold),),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 30,),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),

                        ],
                      ),
                    );
                  }
                  return CircularProgressIndicator();
                })
          ],
        ),
      ),
    );
  }
}
