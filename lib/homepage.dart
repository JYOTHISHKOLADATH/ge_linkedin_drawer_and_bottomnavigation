import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/add_messageWidgets.dart';
import 'package:ge_bottomnavbar_drawer/free_navigate_page.dart';
import 'package:ge_bottomnavbar_drawer/home_bottomsheet.dart';
import 'package:ge_bottomnavbar_drawer/listmessage.dart';
import 'package:ge_bottomnavbar_drawer/sqlite_service.dart';
import 'active_schedules_page.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    List iconOfFunction=["image/trolley (1).png","image/sync.png","image/settings.png"];
    List nameOfFunction=['ACTIVE \n SCHEDULES','SYNC','SETTINGS'];
    List navigationPages=[ActiveSchedulesPage(),FreePage(),FreePage()];
    String enteredMail = widget.name;
    var mailsplit = enteredMail.split('@');
    String _username = mailsplit[0].toUpperCase();
    getAllMessages();
    return Scaffold(

     body: Padding(
       padding: const EdgeInsets.all(8.0),
       child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
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
                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xffECE8D9),boxShadow: [
                       BoxShadow(
                         color: Colors.grey,
                         blurRadius: 15.0, // soften the shadow
                         spreadRadius: 5.0, //extend the shadow
                         offset: Offset(
                           5.0, // Move to right 5  horizontally
                           5.0, // Move to bottom 5 Vertically
                         ),
                       )
                     ],),
                     // color: Colors.red,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Spacer(),
                         Expanded(
                             flex: 3,
                             child: Image(image: AssetImage(iconOfFunction[index]))),
                         // Icon(iconOfFunction[index],size: 80,),
Spacer(),
                         Expanded(
                             flex: 3,
                             child: Text(nameOfFunction[index],textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),))

                      ,Spacer() ],
                     ),
                   ),
                 ),
               ),
             );
           })),
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
