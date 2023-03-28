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
    // List stockSchedule = ["GE STOCK COUNT JAN'23", "GE STOCK COUNT JUNE'23"];

    return Scaffold(
      backgroundColor: Color(0xffE8F9FF),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Icon(
                                      Icons.arrow_back_ios_new,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Text("Schedules",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                SizedBox(width: 20,)
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              color: Colors.white,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Text(
                                          //   "Branch (${snapshot.data![0].branch_id.toString()})",
                                          //   style: TextStyle(
                                          //       fontWeight: FontWeight.bold,
                                          //       fontSize: 30),
                                          // ),
                                          Text(
                                            snapshot.data![0].cmp_name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22),
                                          ),
                                          Text(
                                            snapshot.data![0].branch_name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image(
                                            image: NetworkImage(
                                                "https://pr0.nicelocal.ae/o3fbTpnWT5dXEZfcfm0O8Q/1500x1500,q75/4px-BW84_n0QJGVPszge3NRBsKw-2VcOifrJIjPYFYkOtaCZxxXQ2Wy6OOtl3bYu10IRAjQffzpCyffW8uoxRD6tsSFV1gHJMODXUtR4HWYCvS3ID_8lug")),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Text(
                            "Active schedules(${snapshot.data!.length})",
                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: ListView.builder(
                            padding: EdgeInsets.only(top: 10),
                              shrinkWrap: true,
                              // physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20, bottom: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListTile(
                                        title: Text(
                                          snapshot.data![index].schedulename,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        trailing: snapshot.data![index].status == 1
                                            ? Icon(Icons.circle,color: Colors.green,size: 13,)
                                            : Text("Inactive"),
                                        // subtitle: Text(
                                        //     "End date: ${snapshot.data![index].startdate.split('T').first}"),
                                        // subtitle: Column(
                                        //   crossAxisAlignment: CrossAxisAlignment.start,
                                        //   children: [
                                        //     Row(
                                        //       children: [
                                        //         Icon(Icons.business_sharp),
                                        //         Text(
                                        //             "${snapshot.data![index].cmp_name} "),
                                        //       ],
                                        //     ),
                                        //     Row(
                                        //       children: [
                                        //         Icon(Icons.location_on_outlined),
                                        //         Text(" ${snapshot.data![index].branch_name}"),
                                        //       ],
                                        //     )
                                        //   ],
                                        // ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ViewSchedule(
                                                        snapshot.data![index]
                                                            .schedule_id,
                                                        //   snapshot.data![index].schedulename,
                                                        //   snapshot.data![index].startdate,
                                                        //   snapshot.data![index].enddate,
                                                        //   snapshot
                                                        //       .data![index].countingstatus,
                                                        //   snapshot.data![index].role_id,
                                                        //   snapshot.data![index].branch_id,
                                                        //   snapshot.data![index].cmp_id,
                                                        //   snapshot.data![index].created_at,
                                                        //   snapshot.data![index].created_by,
                                                        //   snapshot.data![index].modified_at,
                                                        //   snapshot.data![index].modified_by,
                                                        //   snapshot.data![index].status,
                                                        // snapshot.data![index].cmp_name,
                                                        // snapshot.data![index].branch_name,
                                                      )));
                                        },
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
