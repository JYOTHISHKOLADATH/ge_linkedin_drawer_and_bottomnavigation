import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/edit_stock_page.dart';
import 'package:ge_bottomnavbar_drawer/normalmode_screen.dart';
import 'package:ge_bottomnavbar_drawer/view_schedule_page.dart';

class QuickModeDetailsScreen extends StatefulWidget {
  const QuickModeDetailsScreen({Key? key}) : super(key: key);

  @override
  State<QuickModeDetailsScreen> createState() => _QuickModeDetailsScreenState();
}

class _QuickModeDetailsScreenState extends State<QuickModeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        iconTheme: Theme.of(context).iconTheme,
        title: Text('STOCK COUNT-QUICK'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.white70,
              elevation: 4,
              child: Container(
                child: Column(
                  children: [
                    Container(
                      // color: Color(0xffF5BB98),
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
                                    'Dubai',
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
                      // color: Color(0xffF5BB98),
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
                      // color: Color(0xffF5BB98),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Container(
                                  child: Text(
                                    'Barcode',
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
                                )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      // color: Color(0xffF5BB98),
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
                                      keyboardType: TextInputType.number,)
                                )),
                          ],
                        ),
                      ),
                    ),
                    // SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
          )
          // ListView(
          //   shrinkWrap: true,
          //   children: [
          //   Card(
          //     child: ListTile(
          //     leading: Text('Branch',style: TextStyle(fontSize: 18),),
          //     title: Text(":"),
          //     trailing: Text('Dubai',style: TextStyle(fontSize: 18),),
          // ),
          //   ),Card(
          //     child: ListTile(
          //     leading: Text('Company',style: TextStyle(fontSize: 18),),
          //     title: Text(":"),
          //     trailing: Text('GE parts',style: TextStyle(fontSize: 18),),
          // ),
          //   ),Card(
          //     child: ListTile(
          //         leading: Text('Barcode',style: TextStyle(fontSize: 18),),
          //         title: Text(":"),
          //       trailing: Container( width:180 ,child: TextField()),
          //       ),
          //   ),Card(
          //     child: ListTile(
          //         leading: Text('Item Name',style: TextStyle(fontSize: 18),),
          //         title: Text(":"),
          //       trailing: Container( width:180 ,child: TextField()),
          //       ),
          //   )
          //   ],
          // ),
          ,
          Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Colors.teal,
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
                  color: Color(0xffC3DAD7),
                      ),
                      Text(
                        'SAVE',
                        style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xffC3DAD7),),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NormalStockCountPage()));
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.developer_mode_outlined,
                          size: 35,
                        color: Color(0xffC3DAD7),
                        ),
                        Text(
                          'NORMAL',
                          style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xffC3DAD7),),
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
                        color: Color(0xffC3DAD7),
                        ),
                        Text(
                          'EDIT',
                          style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xffC3DAD7),),
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
                        color: Color(0xffC3DAD7),
                        ),
                        Text(
                          'CANCEL',
                          style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xffC3DAD7),),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // SizedBox(height: 10,child: Container(color: Colors.amber,),)
        ],
      ),
    );
  }
}
