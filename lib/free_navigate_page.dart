import 'package:flutter/material.dart';
class FreePage extends StatefulWidget {
  const FreePage({Key? key}) : super(key: key);

  @override
  State<FreePage> createState() => _FreePageState();
}

class _FreePageState extends State<FreePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: Theme.of(context).backgroundColor,
        iconTheme: Theme.of(context).iconTheme,title: Text('IN PROGRESS'),),
      body: Container(),
    );
  }
}
