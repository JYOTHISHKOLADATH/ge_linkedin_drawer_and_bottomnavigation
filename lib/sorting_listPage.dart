import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/apiactivities/syncing%20data/syncingdata_api_service.dart';
import 'package:ge_bottomnavbar_drawer/liststockpage.dart';
import 'package:ge_bottomnavbar_drawer/model_StockCount.dart';
import 'package:ge_bottomnavbar_drawer/sqfliteStockCount_services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SortinList extends StatefulWidget {
  final String shelfId;
  @override
  State<SortinList> createState() => _SortinListState();

  SortinList(this.shelfId);
}

class _SortinListState extends State<SortinList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllItems(widget.shelfId);
  }

  int i = 0;
  int j = 0;
  int k = 0;
  List items = [];
  List scanedItems = [];
  List countOfItems = [];
  @override
  Widget build(BuildContext context) {

    // print('$now is.....');

    // checkingQuantity() {
    //   if (items.contains(_enteredItem.text)) {
    //     scanedItems.add(_enteredItem.text);
    //   } else {
    //     items.add(_enteredItem.text);
    //     scanedItems.add(_enteredItem.text);
    //   }
    //   countOfItems.clear();
    //   for (i = 0; i < items.length; i++) {
    //     for (j = 0; j < scanedItems.length; j++) {
    //       if (items[i] == scanedItems[j]) {
    //         k = k + 1;
    //       }
    //     }
    //     countOfItems.add(k);
    //     k = 0;
    //     print(countOfItems);
    //   }
    // }
    //
    // int count = 0;
    // Future<void> onSubmitButtonClicked() async {
    //   final _itemName = _enteredItem.text.trim();
    //   if (_itemName.isEmpty) {
    //     return;
    //   }
    //   print('$_itemName');
    //   final _addedItem = ModelStockCount(
    //       itemName: _itemName, itemCount: count, shelfId: widget.shelfId);
    //   addItem(_addedItem);
    // }

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Confirmation',style: GoogleFonts.glory(
                    fontSize: 18,fontWeight: FontWeight.bold),),
                content: Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Do you want  to sync the Counted items Now?',style: GoogleFonts.glory(
                          fontSize: 18),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Color(0xff191B26)),
                              shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),

                            ),
                            child: Text('Yes',style: GoogleFonts.glory(
                                fontSize: 18,fontWeight: FontWeight.bold),),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Color(0xffffffff)),
                              shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(
                                  color: Colors.black, // Set border color here
                                  width: 2.0, // Set border width here
                                ),
                              ),
                            ),
                            child: Text('No',style: GoogleFonts.glory(
                                fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
                            onPressed: () {
                              // Perform some action
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        label: Text('Stop'),
        backgroundColor: Colors.red,
      ),
      // appBar: AppBar(),
      body: ListStock(shelfId: widget.shelfId,)
    );
  }
}
