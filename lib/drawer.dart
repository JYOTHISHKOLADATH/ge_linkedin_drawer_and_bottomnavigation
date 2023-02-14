import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/loginpage.dart';
import 'package:ge_bottomnavbar_drawer/main.dart';
import 'package:ge_bottomnavbar_drawer/splash_screen_page.dart';
import 'package:ge_bottomnavbar_drawer/theme_constants.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Drawerpage extends StatefulWidget {
  final String drawerUserName;


  Drawerpage({required this.drawerUserName});

  @override
  State<Drawerpage> createState() => _DrawerpageState();
}

class _DrawerpageState extends State<Drawerpage> {
  @override
  Widget build(BuildContext context) {
ThemeChanger _themechanger= Provider.of<ThemeChanger>(context);
    String _resivedid=widget.drawerUserName;
    var userName=_resivedid.split('@');
    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight:Radius.circular(30),bottomRight:Radius.circular(30) )),
      width: 230,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(
                      width: 20,
                    ),
                    CircleAvatar(
                        radius: 50,
                        child: Image(
                            image: AssetImage('image/profileimage.png')
                        )),
                    SizedBox(height: 30,)
                  ],

                ),
                ListTile(
                  leading: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Text(userName[0].toUpperCase(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // fontSize: 20,
                                )),
                      ),
                      Text('View profile',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Colors.grey))
                    ],
                  ),
                ),
                ListTile(
                  leading: RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                            text: '986 ',
                            style: TextStyle(fontWeight: FontWeight.bold,)),
                        TextSpan(
                            text: 'profile views',
                            style: TextStyle(fontWeight: FontWeight.normal,))
                      ])),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                const ListTile(
                  leading: Text('Groups',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          )),
                ),
                const ListTile(
                  leading: Text('Events',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          )),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  leading:  IconButton(onPressed: () {

    iconBool = !iconBool;
    if(iconBool){
      _themechanger.setTheme(ThemeData.dark());
      _themechanger.isDark=false;
    }else{
      _themechanger.setTheme(ThemeData.light());
      _themechanger.isDark=true;
    }
    },
    icon: Icon(iconBool ? iconDark : iconLight)),
                  title:
                  Text('Theme', style: TextStyle()),
                  onTap: (){
                      iconBool = !iconBool;
                      if(iconBool){
                        _themechanger.setTheme(ThemeData.light());
                        _themechanger.isDark=true;
                      }else{
                        _themechanger.setTheme(ThemeData.light());
                        _themechanger.isDark=false;
                      }
                  },
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  leading: Icon(Icons.logout, ),
                  title:
                  Text('Log out', style: TextStyle()),
                  onTap: () async{
                    var sharedpref= await SharedPreferences.getInstance();
                    sharedpref.setBool(SplashscreenState.KEYLOGIN, false);
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Secondlogin()), (route) => false);
                  },
                ),


                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  leading: Icon(Icons.settings, ),
                  title:
                  Text('Settings', style: TextStyle()),
                ),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(height: 30,)
              ],
            ),
          ),

        ],
      ),
    );
  }
}
















































// import 'package:flutter/material.dart';
// class Drawerpage extends StatefulWidget {
//   const Drawerpage({Key? key}) : super(key: key);
//
//   @override
//   State<Drawerpage> createState() => _DrawerpageState();
// }
//
// class _DrawerpageState extends State<Drawerpage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       drawer: Drawer(
//         child: ListView(
//           children: [
//             ListTile(
//               title: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   CircleAvatar(
//                     child: Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/512/3135/3135715.png')),radius: 50,
//                   ),
//                 ],
//               ),
//             ),
//             ListTile(
//               title: Text('JYOTHISH K',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25)),
//             ),
//             ListTile(
//               title:  Text('View profile',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold)),
//             ),
//             SizedBox(height: 40,),
//             SizedBox(
//               height: 30,
//             ),
//             Divider(height: 10,color: Colors.grey),
//           ],
//         ),
//       ),
//     );
//   }
// }
