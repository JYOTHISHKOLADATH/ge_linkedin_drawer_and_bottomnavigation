import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/apiactivities/syncing%20data/syncingdata_api_service.dart';
import 'package:ge_bottomnavbar_drawer/liststockpage.dart';
import 'package:ge_bottomnavbar_drawer/model_StockCount.dart';
import 'package:ge_bottomnavbar_drawer/sqfliteStockCount_services.dart';
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
      backgroundColor: Color(0xffE8F9FF),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                content: Container(
                  height: 150,
                  child: Column(
                    children: [
                      Text("Do you want to sync Now?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      SizedBox(height: 30,),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              Colors.deepPurple),
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Sync Now"),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              Colors.white),
                          shape:
                          MaterialStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.black, width: 2),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Later",style: TextStyle(color: Colors.black),),
                      ),
                    ],
                  ),
                ),
                // title: Text('Do you want to sync data now?'),
                // actions: <Widget>[
                //   TextButton(
                //     child: Text('No'),
                //     onPressed: () {
                //       Navigator.of(context).pop();
                //     },
                //   ),
                //   TextButton(
                //     child: Text('Yes'),
                //     onPressed: () {
                //       Navigator.of(context).pop();
                //     },
                //   ),
                // ],
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
