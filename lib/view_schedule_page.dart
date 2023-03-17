import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/active_schedules_page.dart';
import 'package:ge_bottomnavbar_drawer/normalmode_screen.dart';
import 'package:ge_bottomnavbar_drawer/quickmode_screen.dart';
import 'package:ge_bottomnavbar_drawer/sorting_listPage.dart';
class ViewSchedule extends StatefulWidget {

  ViewSchedule(
      this.schedule_id,
      this.schedulename,
      this.startdate,
      this.enddate,
      this.countingstatus,
      this.role_id,
      this.branch_id,
      this.cmp_id,
      this.created_at,
      this.created_by,
      this.modified_at,
      this.modified_by,
      this.status,
      this.cmp_name,
      this.branch_name);

  int schedule_id;
  String schedulename;
  String startdate;
  String enddate;
  int countingstatus;
  int role_id;
  int branch_id;
  int cmp_id;
  String created_at;
  int created_by;
  String modified_at;
  int modified_by;
  int status;
  String cmp_name;
  String branch_name;


  @override
  State<ViewSchedule> createState() => _ViewScheduleState();
}

class _ViewScheduleState extends State<ViewSchedule> {
  @override
  Widget build(BuildContext context) {
    bool modeButton=true;
    TextEditingController shelfId= TextEditingController();
    return  Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).backgroundColor,
        iconTheme: Theme.of(context).iconTheme,
        title: Text('VIEW SCHEDULE'),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 8,top: 40),
            child: Card(
              color: Colors.white70,
              elevation: 4,
              child: Container(
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Text(widget.schedulename,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Container(
                      // color: Color(0xffF5BB98),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                                child: Container(child: Text('START DATE',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),)),
                            Expanded(
                                flex: 1,
                                child: Container(child: Text(':',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center,),)),
                            Expanded(
                                flex: 3,
                                child: Container(child: Text(widget.startdate.split("T").first,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center,),)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      // color: Color(0xffF5BB98),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Container(child: Text('END DATE',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),)),
                            Expanded(
                                flex: 1,
                                child: Container(child: Text(':',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center,),)),
                            Expanded(
                                flex: 3,
                                child: Container(child: Text(widget.enddate.split("T").first,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center,),)),
                          ],
                        ),
                      ),
                    ),SizedBox(height: 10,),
                    Container(
                      // color: Color(0xffF5BB98),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Container(child: Text('BRANCH',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),)),
                            Expanded(
                                flex: 1,
                                child: Container(child: Text(':',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center,),)),
                            Expanded(
                                flex: 3,
                                child: Container(child: Text(widget.branch_name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center,),)),
                          ],
                        ),
                      ),
                    ),SizedBox(height: 10,),
                    Container(
                      // color: Color(0xffF5BB98),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Container(child: Text('COUNTING STATUS',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),)),
                            Expanded(
                                flex: 1,
                                child: Container(child: Text(':',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center,),)),
                            Expanded(
                                flex: 3,
                                child: Container(child:widget.status==1 ? Text('Active',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center,) : Text("Inactive"),)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          // Container(
          //   child: Column(
          //     children: [
          //       ListTile(
          //         title: Text("GE STOCK COUNT scheduled date",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          //       ),ListTile(
          //         leading: Text('START DATE',style: TextStyle(fontSize: 18),),
          //         title: Text(":"),
          //         trailing: Text('01 Jan',style: TextStyle(fontSize: 18),),
          //       ),ListTile(
          //         leading: Text('END DATE',style: TextStyle(fontSize: 18),),
          //         title: Text(":"),
          //         trailing: Text('15 Jan',style: TextStyle(fontSize: 18),),
          //       ),ListTile(
          //         leading: Text('BRANCH',style: TextStyle(fontSize: 18),),
          //         title: Text(":"),
          //         trailing: Text('Dubai',style: TextStyle(fontSize: 18),),
          //       ),ListTile(
          //         leading: Text('COUNTING STATUS',style: TextStyle(fontSize: 18),),
          //         title: Text(":"),
          //         trailing: Text('Active',style: TextStyle(fontSize: 18),),
          //       )
          //     ],
          //   ),
          // )
          ,Spacer(),
          TextField(controller: shelfId,),
    ElevatedButton(
    style: ButtonStyle(
    backgroundColor: MaterialStatePropertyAll<Color>(Colors.teal),
    ),
    onPressed: (){
      if(shelfId.text!=""){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SortinList(shelfId.text)));
      }else{
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Enter a valid Shelf ID'),
                actions: <Widget>[
                  TextButton(
                    child: Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
      }
    }, child: Text('add shelf'))
          ,Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(Colors.teal),
                        ),
                        onPressed: (){setState(() {
                          modeButton=!modeButton;
                          print(modeButton);
                    });}, child: Text('START')),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(Colors.teal),
                        ),
                        onPressed: (){},
                        child: Text('COUNTING STATISTICS')),
                  ),
                ),
              ),
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Visibility(
          //       visible: modeButton,
          //         child: Expanded(
          //           child: Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Container(
          //               child: ElevatedButton(
          //                   style: ButtonStyle(
          //                     backgroundColor: MaterialStatePropertyAll<Color>(Colors.teal),
          //                   ),
          //                   onPressed: (){
          //                 Navigator.push(context, MaterialPageRoute(builder: (context)=> QuickModeDetailsScreen()));
          //               }, child: Text('QUICK')),
          //             ),
          //           ),
          //         )),
          //     Visibility(
          //       visible: modeButton,
          //         child: Expanded(
          //           child: Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Container(
          //               child: ElevatedButton(
          //                   style: ButtonStyle(
          //                     backgroundColor: MaterialStatePropertyAll<Color>(Colors.teal),
          //                   ),
          //                   onPressed: (){
          //                 Navigator.push(context, MaterialPageRoute(builder: (context)=> NormalStockCountPage()));
          //               }, child: Text('NORMAL')),
          //             ),
          //           ),
          //         ))
          //   ],
          // ),
          Spacer(),
          // Divider(height: 10,color: Colors.black,),
          // Container(
          //   decoration: BoxDecoration(color: Colors.teal,borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)), boxShadow: [
          //     BoxShadow(
          //       color: Colors.grey,
          //       blurRadius: 10.0, // soften the shadow
          //       spreadRadius: 1.0, //extend the shadow
          //       offset: Offset(
          //         5.0, // Move to right 5  horizontally
          //         -5.0, // Move to bottom 5 Vertically
          //       ),
          //     )
          //   ],),
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.only(left: 11.0),
          //           child: Column(
          //             children: [
          //               Icon(Icons.home,size: 35,color: Color(0xffC3DAD7),),
          //               Text("HOME",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xffC3DAD7),),)
          //             ],
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.only(right: 11.0),
          //           child: InkWell(
          //             onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> ActiveSchedulesPage()));},
          //             child: Column(
          //               children: [
          //                 Icon(Icons.close,size: 35,color: Color(0xffC3DAD7),),
          //                 Text("CLOSE",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xffC3DAD7),),)
          //               ],
          //             ),
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          // SizedBox(height: 22,child: Container(color: Colors.amber,),)
        ],
      ),
    );
  }
}
