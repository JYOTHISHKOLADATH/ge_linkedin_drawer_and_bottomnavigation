import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/view_schedule_page.dart';
import 'package:google_fonts/google_fonts.dart';


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
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).backgroundColor,
      //   iconTheme: Theme.of(context).iconTheme,
      //   title: Text("ACTIVE SCHEDULE"),
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FutureBuilder(
              future: _futureSchedule.showingSchedule(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  print(schedulelist);
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  print(schedulelist);
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  print(schedulelist);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                Text("Schedules",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                              ],
                            )),
                        // Padding(
                        //   padding: const EdgeInsets.all(18.0),
                        //   child: ClipRRect(
                        //     borderRadius: BorderRadius.circular(15),
                        //     child: Container(
                        //       color: Colors.white,
                        //       child: Row(
                        //         children: [
                        //           Expanded(
                        //             flex: 3,
                        //             child: Padding(
                        //               padding: const EdgeInsets.all(8.0),
                        //               child: Column(
                        //                 crossAxisAlignment:
                        //                     CrossAxisAlignment.start,
                        //                 children: [
                        //                   // Text(
                        //                   //   "Branch (${snapshot.data![0].branch_id.toString()})",
                        //                   //   style: TextStyle(
                        //                   //       fontWeight: FontWeight.bold,
                        //                   //       fontSize: 30),
                        //                   // ),
                        //                   Text(
                        //                     snapshot.data![0].cmp_name,
                        //                     style: TextStyle(
                        //                         fontWeight: FontWeight.bold,
                        //                         fontSize: 22),
                        //                   ),
                        //                   Text(
                        //                     snapshot.data![0].branch_name,
                        //                     style: TextStyle(
                        //                         fontWeight: FontWeight.bold),
                        //                   )
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //           Expanded(
                        //               flex: 2,
                        //               child: ClipRRect(
                        //                 borderRadius: BorderRadius.circular(15),
                        //                 child: Image(
                        //                     image: NetworkImage(
                        //                         "https://pr0.nicelocal.ae/o3fbTpnWT5dXEZfcfm0O8Q/1500x1500,q75/4px-BW84_n0QJGVPszge3NRBsKw-2VcOifrJIjPYFYkOtaCZxxXQ2Wy6OOtl3bYu10IRAjQffzpCyffW8uoxRD6tsSFV1gHJMODXUtR4HWYCvS3ID_8lug")),
                        //               ))
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child:
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
                        ),
                        SizedBox(height: 20,),
                        Container(
                          child: ListView.builder(
                            padding: EdgeInsets.only(top: 10),
                              shrinkWrap: true,
                              // physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, index) {
                                return InkWell(
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
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20, bottom: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Color(0xffF7FAFA),
                                        // color: Colors.green,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 8.0,top: 0,bottom: 0),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 5,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                color: Color(0xffFFB300),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  bottomLeft: Radius.circular(10),
                                                ),
                                              ),
                                            ),

                                            SizedBox(width: 30,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(snapshot.data![index].schedulename,style: GoogleFonts.glory(
                                                    fontWeight: FontWeight.bold,fontSize: 15),),
                                              Row(
                                                children: [
                                                  Text("Company     ",style: GoogleFonts.glory(
                                                      color: Color(0xff666666),fontSize: 15),),
                                        Text(": ",style: GoogleFonts.glory(
                                            fontSize: 15),),Text(snapshot.data![index].cmp_name,style: GoogleFonts.glory(
                                                      color: Color(0xff666666),fontSize: 15),),
                                                ],
                                              ),
                                                Row(
                                                  children: [
                                                    Text("Branch       ",style: GoogleFonts.glory(
                                                        color: Color(0xff666666),fontSize: 15),),
                                                    Text(": ",style: GoogleFonts.glory(
                                                        color: Color(0xff666666),fontSize: 15),),
                                                    Text(snapshot.data![index].branch_name,style: GoogleFonts.glory(
                                                        color: Color(0xff666666),fontSize: 15),),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  snapshot.data![index].status == 1
                                                      ? Text("Active",style: GoogleFonts.glory(
                                                      color: Colors.green,fontSize: 15),)
                                                      : Text("Inactive",style: GoogleFonts.glory(
                                                      color: Colors.red,fontSize: 15),),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  );
                }
                return CircularProgressIndicator();
              })
        ],
      ),
    );
  }
}
