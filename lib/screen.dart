// import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/active_schedules_page.dart';
import 'package:ge_bottomnavbar_drawer/api_demopage.dart';
import 'package:ge_bottomnavbar_drawer/drawer.dart';
import 'package:ge_bottomnavbar_drawer/post_methord.dart';
import 'package:ge_bottomnavbar_drawer/second_apiDesignl.dart';
import 'package:ge_bottomnavbar_drawer/sorting_listPage.dart';
import 'theme_constants.dart';
import 'main.dart';

import 'homepage.dart';
import 'jobs.dart';
import 'newscreen.dart';

// ThemeManager _themeManager = ThemeManager();

class Mainpage extends StatefulWidget {
  final String useremail;

  Mainpage({required this.useremail});

  @override
  State<Mainpage> createState() => _MainpageState();
}

bool isvisible = false;

class _MainpageState extends State<Mainpage> {
  // String username=widget.useremail;

  var ScaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      Homescreen(
        name: widget.useremail,
      ),
      // Center(child: Text('My Networks', style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold,fontSize: 50),)),
      Center(
          child: Container(
              height: 240,
              child: Image(
                  image: NetworkImage(
                      'https://cdn-icons-png.flaticon.com/512/685/685391.png')))),
      // Center(child: Text('Notification', style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold,fontSize: 50),)),
      Jobs()
    ];

    return Scaffold(
      // floatingActionButton: FloatingActionButton.extended(onPressed: (){
      //   Navigator.push(context, MaterialPageRoute(builder: (context)=>SortinList()));
      // },label: Text('Api test'),),
        key: ScaffoldKey,
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          iconTheme: Theme.of(context).iconTheme,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  ScaffoldKey.currentState?.openDrawer();
                },
                child:
                    const Image(image: AssetImage('image/profileimage.png'))),
          ),
          // backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'GE STOCKCOUNT',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          // SizedBox(
          //   height: 40,
          //   child: TextField(
          //     cursorColor: Colors.black,
          //     style:
          //         TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          //     decoration: InputDecoration(
          //       fillColor: Color(0xffe8e8e8),
          //       hintText: 'search',
          //       hintStyle: TextStyle(color: Color(0xff283134)),
          //       prefixIcon: const Icon(
          //         Icons.search,
          //         color: Colors.black,
          //       ),
          //       border: const OutlineInputBorder(),
          //       isDense: true,
          //       contentPadding: const EdgeInsets.all(8),
          //       filled: true,
          //       focusedBorder:
          //           OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
          //     ),
          //   ),
          // ),
          actions: [
            // IconButton(onPressed: (){}, icon: Icon(Icons.location_on_outlined,color: Colors.white,)),
            Visibility(
              visible: isvisible,
              child: IconButton(
                icon: Icon(
                  Icons.more_vert_sharp,
                  color: Theme.of(context).unselectedWidgetColor,
                ),
                onPressed: () {
                  bottom(context);
                },
              ),
            ),

          ],
        ),
        body:
        screens[currentIndex],
        // bottomNavigationBar: CustomLineIndicatorBottomNavbar(
        //     unSelectedColor: Theme.of(context).unselectedWidgetColor,
        //     selectedColor: Theme.of(context).primaryColor,
        //     backgroundColor: Theme.of(context).bottomAppBarColor,
        //     // type: BottomNavigationBarType.fixed,
        //     currentIndex: currentIndex,
        //     // unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        //     // selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        //     onTap: (index) {
        //       setState(() {
        //         currentIndex = index;
        //         if (currentIndex == 2) {
        //           isvisible = true;
        //         } else {
        //           isvisible = false;
        //         }
        //       });
        //     },
        //     enableLineIndicator: true,
        //     lineIndicatorWidth: 3,
        //     indicatorType: IndicatorType.Top,
        //     selectedFontSize: 18,
        //     unselectedFontSize: 18,
        //     unselectedIconSize: 35,
        //     selectedIconSize: 35,
        //     customBottomBarItems: [
        //       CustomBottomBarItems(
        //         icon: Icons.home,
        //         label: 'Home',
        //       ),
        //       // CustomBottomBarItems(
        //       //   icon: Icons.people_sharp,
        //       //   label: 'My Network',
        //       // ),
        //       CustomBottomBarItems(
        //         icon: Icons.qr_code_scanner_outlined,
        //         label: 'Scan',
        //       ),
        //       // CustomBottomBarItems(
        //       //   icon: Icons.notifications_sharp,
        //       //   label: 'Notification',
        //       // ),
        //       CustomBottomBarItems(
        //         icon: Icons.support_agent,
        //         label: 'Help',
        //       ),
        //     ]),
        drawer: Drawerpage(drawerUserName: widget.useremail));
  }
}

// import 'package:flutter/material.dart';
// import 'package:ge_bottomnavbar_drawer/loginpage.dart';
//
// class Mainpage extends StatefulWidget {
//   const Mainpage({Key? key}) : super(key: key);
//
//   @override
//   State<Mainpage> createState() => _MainpageState();
// }
//
// class _MainpageState extends State<Mainpage> {
//   var ScaffoldKey = GlobalKey<ScaffoldState>();
//   int currentIndex = 1;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xff283134),
//       key: ScaffoldKey,
//       appBar: AppBar(
//         leading: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: InkWell(
//               onTap: () {
//                 ScaffoldKey.currentState?.openDrawer();
//               },
//               child: const Image(
//                   image: NetworkImage(
//                       'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'))),
//         ),
//         backgroundColor: Color(0xff1D282B),
//         title: SizedBox(
//           height: 40,
//           child: TextField(
//             cursorColor: Colors.white,
//             style: TextStyle(color: Colors.white),
//             decoration: InputDecoration(
//               fillColor: Color(0xff3F4B4F),
//               hintText: 'search',
//               hintStyle: TextStyle(color: Color(0xff283134)),
//               prefixIcon: const Icon(
//                 Icons.search,
//                 color: Colors.white,
//               ),
//               border: const OutlineInputBorder(),
//               isDense: true,
//               contentPadding: const EdgeInsets.all(8),
//               filled: true,
//               focusedBorder:
//                   OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
//             ),
//           ),
//         ),
//         actions: const [
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Icon(Icons.chat_sharp, size: 30),
//           )
//         ],
//       ),
//       body: const Center(
//           child: Text(
//         'Screen',
//         style: TextStyle(color: Colors.orange),
//       )),
//       bottomNavigationBar: BottomNavigationBar(
//           unselectedItemColor: Colors.white70,
//           selectedItemColor: Colors.white70,
//           backgroundColor: const Color(0xff1D282B),
//           type: BottomNavigationBarType.fixed,
//           currentIndex: currentIndex,
//           unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
//           selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
//           onTap: (index) {
//             setState(() {
//               currentIndex = index;
//             });
//           },
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.people_sharp),
//               label: 'My Network',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.add_box_sharp),
//               label: 'Post',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.notifications_sharp),
//               label: 'Notification',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.work_outlined),
//               label: 'Jobs',
//             ),
//           ]),
//       drawer: Drawer(
//         backgroundColor: const Color(0xff1D282B),
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: const [
//                       SizedBox(
//                         width: 20,
//                       ),
//                       CircleAvatar(
//                           radius: 50,
//                           child: Image(
//                             image: NetworkImage(
//                                 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
//                           )),
//                     ],
//                   ),
//                   ListTile(
//                     leading: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text('JYOTHISH K',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20,
//                                 color: Colors.white)),
//                         Text('View profile',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 10,
//                                 color: Colors.grey))
//                       ],
//                     ),
//                   ),
//                   ListTile(
//                     leading: RichText(
//                         text: const TextSpan(children: [
//                       TextSpan(
//                           text: '986 ',
//                           style: TextStyle(fontWeight: FontWeight.bold)),
//                       TextSpan(
//                           text: 'profile views',
//                           style: TextStyle(fontWeight: FontWeight.normal))
//                     ])),
//                   ),
//                   const Divider(
//                     color: Colors.grey,
//                   ),
//                   const ListTile(
//                     leading: Text('Groups',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                             color: Colors.white)),
//                   ),
//                   const ListTile(
//                     leading: Text('Events',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                             color: Colors.white)),
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               child: Column(
//                 children:  [
//                   Divider(
//                     color: Colors.grey,
//                   ),
//                   ListTile(
//                   onTap: () {
//                     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Secondlogin()), (route) => false);
//     },
//                     leading: Icon(Icons.logout, color: Colors.white),
//                     title: Text('Logout', style: TextStyle(color: Colors.white)),
//                   ),
//                   Divider(
//                     color: Colors.grey,
//                   ),
//                   ListTile(
//                     leading: Icon(Icons.settings, color: Colors.white),
//                     title:
//                         Text('Settings', style: TextStyle(color: Colors.white)),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
