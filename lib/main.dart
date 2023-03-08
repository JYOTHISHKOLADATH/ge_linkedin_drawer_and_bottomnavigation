import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/loginpage.dart';
import 'package:ge_bottomnavbar_drawer/screen.dart';
import 'package:ge_bottomnavbar_drawer/splash_screen_page.dart';
import 'package:flutter/services.dart';
import 'package:ge_bottomnavbar_drawer/sqfliteStockCount_services.dart';
import 'package:ge_bottomnavbar_drawer/sqlite_service.dart';
import 'package:provider/provider.dart';
import 'theme_constants.dart';

import 'dart:developer' as dev;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializingDataBase();
  runApp(const Basepage());
}

// ThemeManager _themeManager = ThemeManager();

class Basepage extends StatefulWidget {
  const Basepage({Key? key}) : super(key: key);

  @override
  State<Basepage> createState() => _BasepageState();
}

bool iconBool = false;
IconData iconLight = Icons.wb_sunny;
IconData iconDark = Icons.nights_stay;

class _BasepageState extends State<Basepage> {
//   @override
//   void dispose() {
//     _themeManager.removeListener(themeListener);
//     super.dispose();
//   }
//   @override
//   void initState() {
//     _themeManager.addListener( themeListener);
//     // TODO: implement initState
//     super.initState();
//   }
//   themeListener(){
//     if(mounted){
//       setState(() {
// print(_themeManager.themeMode);
//       });
//     }
//   }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ChangeNotifierProvider<ThemeChanger>(
      create: (BuildContext context) => ThemeChanger(lightTheme, false),
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      theme: theme.getTheme(),
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}
