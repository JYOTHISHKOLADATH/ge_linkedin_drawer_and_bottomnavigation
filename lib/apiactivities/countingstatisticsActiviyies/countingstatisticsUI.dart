import 'package:flutter/material.dart';

import 'countingStatisticsModel.dart';
import 'countingstatisticsAPIservice.dart';
import 'package:ge_bottomnavbar_drawer/liststockpage.dart';
import 'package:ge_bottomnavbar_drawer/model_StockCount.dart';
import 'package:ge_bottomnavbar_drawer/sqfliteStockCount_services.dart';
import 'package:ge_bottomnavbar_drawer/model_StockCount.dart';

List<String> items = [];
// List<dynamic> differentElements = [];
// List<dynamic> sameElements = [];
List<String> similarItemsList = [];
List<String> differentItemsList = [];

class MyWidget extends StatefulWidget {
  final int id;
  const MyWidget({super.key, required this.id});

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  // List counteditems = [1,2];
  // List newitems = [1,];
  List nameof = [
    "SCHEDULED",
    "COUNTED",
    "NEW",
    "PENDING"
  ];
  List counted = [
    items.length,
    itemCodes.length,
    differentItemsList.length,
    items.length-similarItemsList.length
  ];
  List imagelist = [
    "https://cdn-icons-png.flaticon.com/512/2979/2979677.png",
    "https://cdn-icons-png.flaticon.com/512/685/685388.png",
    "https://cdn-icons-png.flaticon.com/512/3638/3638933.png",
    "https://cdn-icons-png.flaticon.com/512/3638/3638933.png"
  ];
  @override
  void initState() {
    super.initState();
    getItemcodeList();
    fetchItems(widget.id.toString()).then((fetchedItems) {
      setState(() {
        items = fetchedItems;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          SafeArea(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                "Counting statistics",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                width: 20,
              )
            ],
          )),
          ValueListenableBuilder(
              valueListenable: stockListNotifier,
              builder: (BuildContext context, stockList,
                  Widget? child) {
                function();
                print("these is stock list $stockList");
                return Container();
              }),
          Center(
            child: ListView.builder(
                padding: EdgeInsets.only(top: 10),
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 0.0, right: 80, bottom: 10),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        color: Colors.black,
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             SizedBox(width: 25,),
                              Expanded(child: Image(image: NetworkImage(imagelist[index]))),
                              Expanded(
                                flex: 3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          counted[index].toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 40,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          nameof[index],
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),

                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Stack(
                              //   children: [
                              //     Positioned(
                              //       top: 1.0,
                              //       left: 1.0,
                              //       child: FloatingActionButton(
                              //         backgroundColor: Colors.white,
                              //         child: Icon(Icons.fast_forward_outlined, color: Colors.black),
                              //         onPressed: () {
                              //           // Add your code here
                              //         },
                              //       ),
                              //     ),
                              //   ],
                              // )

                            ],
                          )),
                    ),
                  );
                }),
          ),

        ],
      ),
    );
  }
  // 7C5219917K
  function(){
    similarItemsList.clear();
    differentItemsList.clear();
    for (String itemCode in itemCodes) {
      if (items.contains(itemCode)) {
        similarItemsList.add(itemCode);
      } else {
        differentItemsList.add(itemCode);
      }
    }

    print('Similar items: $similarItemsList');
    print('Different items: $differentItemsList');

//     // Find same elements in both lists
//     differentElements.clear();
// items.forEach((item) {
// itemCodes.forEach((stockitem) {
// if (isSame(item, stockitem)) {
// sameElements.add(item);
// }
// });
// });
// print("Same elements: $sameElements");
//
// // Find different elements in both lists
//
// items.forEach((item) {
// if (!stockList
// .any((stockitem) => isSame(item, stockitem))) {
// differentElements.add(item);
// }
// });
// stockList.forEach((stockitem) {
// if (!items.any((item) => isSame(item, stockitem))) {
// differentElements.add(stockitem);
// }
// });
// // differentscount = differentElements.length;
// // print("Different : $differentscount");
// print("Different elements: $differentElements");
// return Container();
  }
  // Compare two objects and determine if they are the same
  bool isSame(dynamic object1, dynamic object2) {
    print(object1 == object2);
    return object1 == object2;
    // if (object1 is item && object2 is item) {
    //   return object1.name == object2.name && object1.age == object2.age;
    // } else if (object1 is stockitem && object2 is stockitem) {
    //   return object1.name == object2.name && object1.salary == object2.salary;
    // } else {
    //   return false;
    // }
  }
}








// ListView.builder(
// itemCount: items.length,
// itemBuilder: (context, index) {
// return ListTile(
// title: Text(items[index].itemname),
// subtitle: Text(items[index].itemcode),
// leading: Icon(Icons.inventory),
// );
// },
// ),

// Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text("Items to be Counted : ${items.length}"),
// Text("Items Counted : ${fromlistitem.length + newitemlist.length}"),
// Text("New Items  added: ${newitemlist.length}"),
// Text("difference: ${items.length - (fromlistitem.length)}")
// ],)

// ListTile(
// title:
// trailing:
// ),
