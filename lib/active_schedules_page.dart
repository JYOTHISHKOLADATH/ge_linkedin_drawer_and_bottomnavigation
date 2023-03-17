import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/view_schedule_page.dart';

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
    List stockSchedule = ["GE STOCK COUNT JAN'23", "GE STOCK COUNT JUNE'23"];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        iconTheme: Theme.of(context).iconTheme,
        title: Text("ACTIVE SCHEDULE"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'SELECT SCHEDULES',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
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
                  return ListView.builder(
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: Card(
                            elevation: 4,
                            // color: Color(0xffDEBE95),
                            child: ListTile(
                              title: Text(
                                snapshot.data![index].schedulename,
                                // textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              trailing: snapshot.data![index].status == 1
                                  ? Text(
                                      "Active",
                                      style: TextStyle(color: Colors.green),
                                    )
                                  : Text("Inactive"),
                              // subtitle: Text(
                              //     "End date: ${snapshot.data![index].startdate.split('T').first}"),
                              subtitle: Text("${snapshot.data![index].cmp_name}  ${snapshot.data![index].branch_name}"),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ViewSchedule(
                                            snapshot.data![index].schedule_id,
                                            snapshot.data![index].schedulename,
                                            snapshot.data![index].startdate,
                                            snapshot.data![index].enddate,
                                            snapshot
                                                .data![index].countingstatus,
                                            snapshot.data![index].role_id,
                                            snapshot.data![index].branch_id,
                                            snapshot.data![index].cmp_id,
                                            snapshot.data![index].created_at,
                                            snapshot.data![index].created_by,
                                            snapshot.data![index].modified_at,
                                            snapshot.data![index].modified_by,
                                            snapshot.data![index].status,
                                          snapshot.data![index].cmp_name,
                                          snapshot.data![index].branch_name,)));
                              },
                            ),
                          ),
                        );
                      });
                }
                return CircularProgressIndicator();
              })

          // Spacer(),
          // Divider(height: 10,color: Colors.black,),
          // Container(
          //   decoration: BoxDecoration(
          //     color: Colors.teal,
          //     borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.grey,
          //         blurRadius: 10.0, // soften the shadow
          //         spreadRadius: 5.0, //extend the shadow
          //         offset: Offset(
          //           5.0, // Move to right 5  horizontally
          //           -5.0, // Move to bottom 5 Vertically
          //         ),
          //       )
          //     ],
          //   ),
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.only(left: 8.0),
          //           child: Column(
          //             children: [
          //               Icon(
          //                 Icons.home,
          //                 size: 35,
          //                 color: Color(0xffC3DAD7),
          //               ),
          //               Text(
          //                 "HOME",
          //                 style: TextStyle(
          //                   fontWeight: FontWeight.bold,
          //                   color: Color(0xffC3DAD7),
          //                 ),
          //               )
          //             ],
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.only(right: 8.0),
          //           child: InkWell(
          //             child: Column(
          //               children: [
          //                 Icon(
          //                   Icons.close,
          //                   size: 35,
          //                   color: Color(0xffC3DAD7),
          //                 ),
          //                 Text(
          //                   "CLOSE",
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.bold,
          //                     color: Color(0xffC3DAD7),
          //                   ),
          //                 )
          //               ],
          //             ),
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          // SizedBox(height: 20,child: Container(color: Colors.teal,),)
        ],
      ),
    );
  }
}
