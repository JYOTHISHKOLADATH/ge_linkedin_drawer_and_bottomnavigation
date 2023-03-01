import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/active_schedules_page.dart';
import 'package:ge_bottomnavbar_drawer/normalmode_screen.dart';
import 'package:ge_bottomnavbar_drawer/quickmode_screen.dart';
class ViewSchedule extends StatefulWidget {
  const ViewSchedule({Key? key}) : super(key: key);

  @override
  State<ViewSchedule> createState() => _ViewScheduleState();
}

class _ViewScheduleState extends State<ViewSchedule> {
  @override
  Widget build(BuildContext context) {
    bool modeButton=true;
    return  Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).backgroundColor,
        iconTheme: Theme.of(context).iconTheme,
        title: Text('VIEW SCHEDULE'),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 8,top: 40),
            child: Container(
              child: Column(
                children: [
                  Text('GE STOCK COUNT JAN 2023',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Container(
                    color: Color(0xffF5BB98),
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
                              child: Container(child: Text('01 Jan',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center,),)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    color: Color(0xffAAE3E0),
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
                              child: Container(child: Text('15 Jan',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center,),)),
                        ],
                      ),
                    ),
                  ),SizedBox(height: 10,),
                  Container(
                    color: Color(0xffF5BB98),
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
                              child: Container(child: Text('Dubai',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center,),)),
                        ],
                      ),
                    ),
                  ),SizedBox(height: 10,),
                  Container(
                    color: Color(0xffAAE3E0),
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
                              child: Container(child: Text('Active',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center,),)),
                        ],
                      ),
                    ),
                  ),
                ],
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
          // ),
          ,Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
                  ),
                  onPressed: (){setState(() {
                    modeButton=!modeButton;
                    print(modeButton);
              });}, child: Text('START')),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Visibility(
                visible: modeButton,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.red.shade300),
                      ),
                      onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> QuickModeDetailsScreen()));
                  }, child: Text('QUICK'))),
              Visibility(
                visible: modeButton,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.orange.shade400),
                      ),
                      onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> NormalStockCountPage()));
                  }, child: Text('NORMAL')))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.maxFinite,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.teal),
                  ),
                  onPressed: (){},
                  child: Text('COUNTING STATISTICS')),
            ),
          ),
          Spacer(),
          // Divider(height: 10,color: Colors.black,),
          Container(
            decoration: BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)), boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10.0, // soften the shadow
                spreadRadius: 5.0, //extend the shadow
                offset: Offset(
                  5.0, // Move to right 5  horizontally
                  -5.0, // Move to bottom 5 Vertically
                ),
              )
            ],),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 11.0),
                    child: Column(
                      children: [
                        Icon(Icons.home,size: 35,color: Color(0xffFD0909),),
                        Text("HOME",style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 11.0),
                    child: InkWell(
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> ActiveSchedulesPage()));},
                      child: Column(
                        children: [
                          Icon(Icons.close,size: 35,color: Color(0xffFD0909),),
                          Text("CLOSE",style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 22,child: Container(color: Colors.amber,),)
        ],
      ),
    );
  }
}
