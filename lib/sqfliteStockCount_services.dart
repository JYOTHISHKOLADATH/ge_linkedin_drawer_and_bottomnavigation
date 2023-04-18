import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/sorting_listPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqflite/sqflite.dart';

import 'model_StockCount.dart';

ValueNotifier<List<ModelStockCount>> stockListNotifier = ValueNotifier([]);
// ValueNotifier<List<ModelStockCount>> itemcountnotifier = ValueNotifier([]);

late Database _db;
List<String> itemCodes = [];
Future<void> initializingDataBase() async {
  _db = await openDatabase('NewScanDetails.db', version: 1,
      onCreate: (Database db, int version) async {
    await db.execute(
        'CREATE TABLE newScannedItems (id INTEGER PRIMARY KEY, timeStamp TEXT, itemName TEXT, itemCount INTEGER,shelfId TEXT,barCode TEXT,itemCode TEXT)');
  });

}
Future getItemcodeList()async{
  // Retrieve a list of itemCode values from the newScannedItems table
  List<Map<String, dynamic>> rows = await _db.query('newScannedItems', columns: ['itemCode']);
  itemCodes = rows.map((row) => row['itemCode'] as String).toList();
  print('itemCode values: $itemCodes');
}

Future<void> addItem(ModelStockCount value) async {
  await _db.rawQuery(
      'INSERT INTO NewScannedItems (timeStamp,itemName,itemCount,shelfId,barCode,itemCode) VALUES (?,?,?,?,?,?)',
      [value.timeStamp, value.itemName, value.itemCount, value.shelfId,value.barCode,value.itemCode]);
  getAllItems(value.shelfId);
}

Future<void> getAllItems(shelfId) async {
  final _values = await _db.rawQuery(
      "Select * FROM NewScannedItems WHERE shelfId = '$shelfId' ORDER BY timeStamp DESC");
  print(_values);
  final stockList = <ModelStockCount>[];
  stockListNotifier.value.clear();
  _values.forEach((map) {
    final stock = ModelStockCount.fromMap(map);
    stockListNotifier.value.add(stock);
    stockListNotifier.notifyListeners();
  });
  print(stockList); // prints the list of stock items
}

// Future<void> getAllItemCode(shelfId) async {
//   final _values = await _db.rawQuery(
//       "Select itemCode FROM NewScannedItems WHERE shelfId = '$shelfId' ORDER BY timeStamp DESC");
//   print(_values);
//   // final stockList = <ModelStockCount>[];
//   itemcountnotifier.value.clear();
//   _values.forEach((map) {
//     final stock = ModelStockCount.fromMap(map);
//     itemcountnotifier.notifyListeners();
//   });
//   // print(stockList); // prints the list of stock items
// }

Future<void> deleteScannedItem(String itemName, String shelfId) async {
  await _db.delete(
    'NewScannedItems',
    where: 'itemName = ? AND shelfId = ?',
    whereArgs: [itemName, shelfId],
  );
  getAllItems(shelfId);
}

Future<void> updateStockCountAdd(
    String timeStamp, String itemName, int itemCount, String shelfId) async {
  await _db.update(
    'NewScannedItems',
    {'itemCount': itemCount + 1, 'timeStamp': timeStamp},
    where: 'itemName = ? AND shelfId = ?',
    whereArgs: [itemName, shelfId],
  );
  getAllItems(shelfId);
}


Future<void> updateStockCountSub(BuildContext context, String timeStamp,
    String itemName, int itemCount, String shelfId) async {
  if (itemCount > 1) {
    await _db.update(
      'NewScannedItems',
      {'itemCount': itemCount - 1, 'timeStamp': timeStamp},
      where: 'itemName = ? AND shelfId = ?',
      whereArgs: [itemName, shelfId],
    );
  } else {
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
                Text('Are you sure you want to Delete these item?',style: GoogleFonts.glory(
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
                        deleteScannedItem(itemName, shelfId);
                        Navigator.of(context).pop(true);
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
                        Navigator.of(context).pop(false);
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
  }

  getAllItems(shelfId);
}
// Future<void> updateStockCount(String itemName, int itemCount) async {
//   await _db
//       .rawUpdate('UPDATE scannedItems SET  itemCount = ? WHERE itemName = $itemName', [
//     '${itemCount+1}',
//   ]);
//   getAllItems();
//
// }

Future<int?> stockExists(itemName, shelfId) async {
  var count = Sqflite.firstIntValue(await _db.rawQuery(
    'SELECT EXISTS(SELECT * FROM NewScannedItems WHERE itemName="$itemName" AND shelfId="$shelfId")',
  ));
  return count;
}
Future<int?> shelfExist(itemName, shelfId) async {
  var count = Sqflite.firstIntValue(await _db.rawQuery(
    'SELECT EXISTS(SELECT * FROM NewScannedItems WHERE  shelfId="$shelfId")',
  ));
  return count;
}
// Future<int?> shelfExists(shelfId) async {
//   var result = Sqflite.firstIntValue(await _db.rawQuery(
//     'SELECT EXISTS(SELECT * FROM scannedItems WHERE shelfId="$shelfId")',
//   ));
//   return result;
// }

// Future<void> getCount(String itemName) async {
//   final _count = await _db.rawQuery('Select * FROM scannedItems WHERE itemName="$itemName');
//   _count.forEach((map) {
//     final stock = ModelStockCount.fromMap(map);
//     int presentCount=stock.itemCount;
//     return presentCount;
//    });
// }

Future<void> updateScannedItem(
    String itemName, int newCount, String timeStamp, String shelfId) async {
  await _db.update(
    'NewScannedItems',
    {'itemCount': newCount + 1, 'timeStamp': timeStamp},
    where: 'itemName = ? AND shelfId = ?',
    whereArgs: [itemName, shelfId],
  );
  getAllItems(shelfId);
}

Future<int> getItemCount(String itemName, String shelfId) async {
  final result = await _db.query(
    'NewScannedItems',
    columns: ['itemCount'],
    where: 'itemName = ? AND shelfId = ?',
    whereArgs: [itemName, shelfId],
  );

  if (result.isNotEmpty) {
    return result.first['itemCount'] as int;
  } else {
    // Handle the case where the item name is not found in the database
    // Here, we're returning a value of -1 to indicate an error
    return 0;
  }
}

Future<List<Map<String, dynamic>>> getReversedDataFromDatabase() async {
  final List<Map<String, dynamic>> data =
      await _db.query('NewScannedItems', orderBy: 'timeStamp DESC');
  return data;
}

Future<void> updateStockCountEasy(BuildContext context, String timeStamp,
    String itemName, int itemCount, String shelfID) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          final now = DateTime.now();
          TextEditingController textFieldValue = TextEditingController();
          textFieldValue.text = itemCount.toString();
          textFieldValue.selection = TextSelection.fromPosition(
              TextPosition(offset: textFieldValue.text.length));
          print(textFieldValue.text);
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            title: Container(
                alignment: Alignment.topRight,
                child: IconButton(onPressed: (){
                  Navigator.of(context).pop();
                }, icon: Icon(Icons.close_rounded))),
            content: Container(
                height: 200,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [Text("Quantity",style: GoogleFonts.glory(
                          fontWeight: FontWeight.bold,fontSize: 18),)],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            itemCount == 1
                                ? showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                            'Do you want to remove these item?',style: GoogleFonts.glory(
                                            fontWeight: FontWeight.bold,fontSize: 18),),
                                        content: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor: MaterialStatePropertyAll<Color>(
                                                    Colors.black),
                                                shape:
                                                MaterialStatePropertyAll<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10.0),
                                                  ),
                                                ),
                                              ),
                                              onPressed: () {
                                                deleteScannedItem(
                                                    itemName, shelfID);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SortinList(shelfID.toString())));
                                              },
                                              child: Text("Yes",style: GoogleFonts.glory(
                                                  fontWeight: FontWeight.bold,fontSize: 18)),
                                            ),
                                            ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor: MaterialStatePropertyAll<Color>(
                                                    Colors.white),
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
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("No",style: GoogleFonts.glory(
                                                  fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black)),
                                            ),

                                          ],
                                        ),

                                      );
                                    },
                                  )
                                : itemCount = itemCount - 1;
                            setState(() {});
                          },
                          icon: Icon(Icons.remove_circle_outline,size: 40,),
                        ),
                        Container(
                          width: 80,
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Color(0xffE8F9FF),),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Color(0xffE8F9FF),),
                              ),
                              border: OutlineInputBorder(
                              // set border color here
                              ),
                            ),
                            textAlign: TextAlign.center,
                            controller: textFieldValue,
                            autofocus: true,
                            onChanged: (newValue) {
                              print(newValue);
                              itemCount = int.tryParse(newValue) ?? 1;
                            },
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                        ),

                        IconButton(
                          onPressed: () {
                            setState(() {
                              itemCount = itemCount + 1;
                            });
                          },
                            icon: Icon(Icons.add_circle,color: Colors.green,size: 40,)),
                      ],
                    ),
                    SizedBox(height: 40,),
                    Container(
                      width: double.maxFinite,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.black),
                              shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: Colors.black, width: 2.0),
                                ),
                              ),
                            ),
                            onPressed: (){
                          int newCount = itemCount - 1;
                          updateScannedItem(
                              itemName, newCount, now.toString(), shelfID);
                          Navigator.of(context).pop();
                        }, child: Text("Save")))
                  ],
                )),
          );
        },
      );
    },
  );
  getAllItems(shelfID);
}
