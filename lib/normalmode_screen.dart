import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/quickmode_screen.dart';
import 'package:ge_bottomnavbar_drawer/view_schedule_page.dart';

import 'edit_stock_page.dart';

class NormalStockCountPage extends StatefulWidget {
  const NormalStockCountPage({Key? key}) : super(key: key);

  @override
  State<NormalStockCountPage> createState() => _NormalStockCountPageState();
}

class _NormalStockCountPageState extends State<NormalStockCountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        iconTheme: Theme.of(context).iconTheme,
        title: Text('STOCK COUNT-NORMAL'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: [
                  Container(
                    color: Color(0xffAAE3E0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Container(
                                child: Text(
                                  'Branch',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: Text(
                                  ':',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                          Expanded(
                              flex: 3,
                              child: Container(
                                child: Text(
                                  'Abudhabi',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Color(0xffF5BB98),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Container(
                                child: Text(
                                  'Company',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: Text(
                                  ':',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                          Expanded(
                              flex: 3,
                              child: Container(
                                child: Text(
                                  'GE Parts',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Color(0xffAAE3E0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Container(
                                child: Text(
                                  'Item Code',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: Text(
                                  ':',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                          Expanded(
                              flex: 3,
                              child: Container(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none
                                    ),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.text,)
                                // child: Text(
                                //   '------',
                                //   style: TextStyle(
                                //       fontWeight: FontWeight.bold,
                                //       fontSize: 18),
                                //   textAlign: TextAlign.center,
                                // ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Color(0xffF5BB98),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Container(
                                child: Text(
                                  'Item Name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: Text(
                                  ':',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                          Expanded(
                              flex: 3,
                              child: Container(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none
                                    ),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.text,)
                                // child: Text(
                                //   '------',
                                //   style: TextStyle(
                                //       fontWeight: FontWeight.bold,
                                //       fontSize: 18),
                                //   textAlign: TextAlign.center,
                                // ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Color(0xffAAE3E0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Container(
                                child: Text(
                                  'Quantity',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: Text(
                                  ':',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                          Expanded(
                              flex: 3,
                              child: Container(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none
                                    ),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,)
                                // child: Text(
                                //   '------',
                                //   style: TextStyle(
                                //       fontWeight: FontWeight.bold,
                                //       fontSize: 18),
                                //   textAlign: TextAlign.center,
                                // ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // ListView(
          //   shrinkWrap: true,
          //   children: [
          //     Card(
          //       child: ListTile(
          //         leading: Text('Branch',style: TextStyle(fontSize: 18),),
          //         title: Text(":"),
          //         trailing: Text('Abudhabi',style: TextStyle(fontSize: 18),),
          //       ),
          //     ),Card(
          //       child: ListTile(
          //         leading: Text('Company',style: TextStyle(fontSize: 18),),
          //         title: Text(":"),
          //         trailing: Text('GE parts',style: TextStyle(fontSize: 18),),
          //       ),
          //     ),Card(
          //       child: ListTile(
          //         leading: Text('ItemCode',style: TextStyle(fontSize: 18),),
          //         title: Text(":"),
          //         trailing: Container( width:180 ,child: TextField()),
          //       ),
          //     ),Card(
          //       child: ListTile(
          //         leading: Text('Item Name',style: TextStyle(fontSize: 18),),
          //         title: Text(":"),
          //         trailing: Container( width:180 ,child: TextField()),
          //       ),
          //     ),Card(
          //       child: ListTile(
          //         leading: Text('Quantity',style: TextStyle(fontSize: 18),),
          //         title: Text(":"),
          //         trailing: Container( width:180 ,child: TextField()),
          //       ),
          //     )
          //   ],
          // ),
          Spacer(),
          // Divider(color: Colors.black,),
          Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10.0, // soften the shadow
                  spreadRadius: 5.0, //extend the shadow
                  offset: Offset(
                    5.0, // Move to right 5  horizontally
                    -5.0, // Move to bottom 5 Vertically
                  ),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.save,
                        size: 35,
                        color: Color(0xffFD0909),
                      ),
                      Text(
                        'SAVE',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuickModeDetailsScreen()));
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.developer_mode_outlined,
                          size: 35,
                          color: Color(0xffFD0909),
                        ),
                        Text(
                          'QUICK',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => EditStock()));
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.mode,
                          size: 35,
                          color: Color(0xffFD0909),
                        ),
                        Text(
                          'EDIT',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewSchedule()));
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.cancel,
                          size: 35,
                          color: Color(0xffFD0909),
                        ),
                        Text(
                          'CANCEL',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
            child: Container(
              color: Colors.amber,
            ),
          )
        ],
      ),
    );
  }
}
