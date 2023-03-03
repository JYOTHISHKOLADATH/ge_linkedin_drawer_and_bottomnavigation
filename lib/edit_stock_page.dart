import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/view_schedule_page.dart';

class EditStock extends StatefulWidget {
  const EditStock({Key? key}) : super(key: key);

  @override
  State<EditStock> createState() => _EditStockState();
}

class _EditStockState extends State<EditStock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        iconTheme: Theme.of(context).iconTheme,
        title: Text('EDIT STOCKS'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.white70,
              elevation: 4,
              child: Container(
                child: Column(
                  children: [
                    Container(
                      // color: Color(0xffAAE3E0),
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
                                  //   '-----',
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
                                      keyboardType: TextInputType.text,)
                                  // child: Text(
                                  //   '-------',
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
                      // color: Color(0xffAAE3E0),
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
                                )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(Colors.teal),
                        ),
                        onPressed: () {},
                        child: Text('Save')),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Container(
          //     decoration: BoxDecoration(border: Border.all()),
          //     child: Column(
          //       children: [
          //         ListView(
          //           shrinkWrap: true,
          //           children: [
          //             ListTile(
          //               leading: Text('Item Code',style: TextStyle(fontSize: 18),),
          //               title: Text(":"),
          //               trailing: Container( width:180 ,child: TextField()),
          //             ),
          //             Divider(color: Colors.grey,),
          //             ListTile(
          //               leading: Text('Item Name',style: TextStyle(fontSize: 18),),
          //               title: Text(":"),
          //               trailing: Container( width:180 ,child: TextField()),
          //             ),  Divider(color: Colors.grey,),ListTile(
          //               leading: Text('Quantity',style: TextStyle(fontSize: 18),),
          //               title: Text(":"),
          //               trailing: Container( width:180 ,child: TextField()),
          //             ), Divider(color: Colors.grey,),
          //           ],
          //         ),
          //         ElevatedButton(onPressed: (){}, child: Text('SAVE'))
          //       ],
          //     ),
          //   ),
          // ),
          Spacer(),
          // Divider(height: 10,color: Colors.black,),
          Container(
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10.0, // soften the shadow
                  spreadRadius: 2.0, //extend the shadow
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 11.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewSchedule()));
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.home,
                            size: 35,
                            color: Color(0xffC3DAD7),
                          ),
                          Text(
                            "HOME",
                            style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xffC3DAD7),),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 11.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewSchedule()));
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.close,
                            size: 35,
                            color: Color(0xffC3DAD7),
                          ),
                          Text(
                            "CLOSE",
                            style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xffC3DAD7),),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          // SizedBox(
          //   height: 22,
          //   child: Container(
          //     color: Colors.amber,
          //   ),
          // )
        ],
      ),
    );
  }
}
