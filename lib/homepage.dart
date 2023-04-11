import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/add_messageWidgets.dart';
import 'package:ge_bottomnavbar_drawer/free_navigate_page.dart';
import 'package:ge_bottomnavbar_drawer/home_bottomsheet.dart';
import 'package:ge_bottomnavbar_drawer/listmessage.dart';
import 'package:ge_bottomnavbar_drawer/sqfliteStockCount_services.dart';
import 'package:ge_bottomnavbar_drawer/sqlite_service.dart';
import 'active_schedules_page.dart';
import 'drawer.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var ScaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    List iconOfFunction=["image/clipboard.png","image/statistics.png"];
    List nameOfFunction=['SCHEDULES',"COUNTING STATISTICS"];
    List navigationPages=[ActiveSchedulesPage(),FreePage()];
    String enteredMail = widget.name;
    var mailsplit = enteredMail.split('@');
    String _username = mailsplit[0].toUpperCase();
    // getAllItems();
    return Scaffold(
        backgroundColor: Color(0xffE8F9FF),
        drawer: Drawerpage(drawerUserName: enteredMail),
        key: ScaffoldKey,
// floatingActionButton: FloatingActionButton(onPressed: (){}),
     body: Padding(
       padding: const EdgeInsets.all(8.0),
       child: SingleChildScrollView(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             SafeArea(
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,

                   children: [
                     InkWell(
                         onTap: () {
                           ScaffoldKey.currentState?.openDrawer();
                         },
                         child:
                         Container(
                           height: 39,
                             child: const Image(image: AssetImage('image/profileimage.png')))),
                     Text("GE STOCKCOUNT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                     SizedBox(width: 20,)
                   ],
                 )),
             RichText(text: TextSpan(
                 children: [
                   TextSpan(text: "Hi,",style: TextStyle(color: Colors.black,fontSize: 18),),
                   TextSpan(text: "\n${widget.name}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20))
                 ]
             )),
             Column(
               children: [
                 Image(image: NetworkImage("https://media.istockphoto.com/id/1264890031/vector/abstract-financial-chart-with-an-uptrend-line-graph.jpg?s=2048x2048&w=is&k=20&c=w-O7huxh2W3DP3rkAXtG0sxKm-OCfMOeV_GA9qFuXkY=")),
                 GridView.builder(
                   physics: ScrollPhysics(),
                     shrinkWrap: true,
                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                     itemCount: nameOfFunction.length,

                     itemBuilder: ((context,index){
                       return Padding(
                         padding: const EdgeInsets.all(5.0),
                         child: InkWell(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=> navigationPages[index]));
                           },
                           child: Padding(
                             padding: const EdgeInsets.all(11.0),
                             child: Container(
                               height: 200,
                               width: 100,
                               decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white,boxShadow: [
                                 // BoxShadow(
                                 //   color:  Colors.grey,
                                 //   blurRadius: 15.0, // soften the shadow
                                 //   spreadRadius: 5.0, //extend the shadow
                                 //   offset: Offset(
                                 //     5.0, // Move to right 5  horizontally
                                 //     5.0, // Move to bottom 5 Vertically
                                 //   ),
                                 // )
                               ],),
                               // color: Colors.red,
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   // Spacer(),
                                   Container(
                                       height: 80,
                                       child: Image(image: AssetImage(iconOfFunction[index]))),
                                   // Icon(iconOfFunction[index],size: 80,),
                                   SizedBox(height: 10,),
// Spacer(),
                                   Text(nameOfFunction[index],textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)

                                // ,Spacer()
                                 ],
                               ),
                             ),
                           ),
                         ),
                       );
                     })),
               ],
             ),
           ],
         ),
       ),
     )







      // body: Column(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.only(left: 8.0, top: 10),
      //       child: Row(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Align(
      //               alignment: Alignment.centerLeft,
      //               child: Text(
      //                 'Hai, ${_username}',
      //                 style: TextStyle(fontSize: 30),
      //               )),
      //
      //           // Text(widget.name),
      //         ],
      //       ),
      //     ),
      //     AddMessage(),
      //     Expanded(child: ListmessageWidget()),
      //     SizedBox(
      //       height: 30,
      //     ),
      //   ],
      // ),
    );
  }
}
