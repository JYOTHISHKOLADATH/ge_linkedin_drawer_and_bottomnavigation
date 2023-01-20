import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/screen.dart';

void main() {
  runApp(const Basepage());
}
class Basepage extends StatefulWidget {
  const Basepage({Key? key}) : super(key: key);

  @override
  State<Basepage> createState() => _BasepageState();
}

class _BasepageState extends State<Basepage> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      home: Mainpage(),
    );
  }
}
