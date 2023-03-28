import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/sorting_listPage.dart';
import 'package:sqflite/sqflite.dart';

import 'model_StockCount.dart';

ValueNotifier<List<ModelStockCount>> stockListNotifier = ValueNotifier([]);

late Database _db;
Future<void> initializingDataBase() async {
  _db = await openDatabase('NewScanDetails.db', version: 1,
      onCreate: (Database db, int version) async {
    await db.execute(
        'CREATE TABLE newScannedItems (id INTEGER PRIMARY KEY, timeStamp TEXT, itemName TEXT, itemCount INTEGER,shelfId TEXT)');
  });
}

Future<void> addItem(ModelStockCount value) async {
  await _db.rawQuery(
      'INSERT INTO NewScannedItems (timeStamp,itemName,itemCount,shelfId) VALUES (?,?,?,?)',
      [value.timeStamp, value.itemName, value.itemCount, value.shelfId]);
  getAllItems(value.shelfId);
}

Future<void> getAllItems(shelfId) async {
  final _values = await _db.rawQuery(
      "Select * FROM NewScannedItems WHERE shelfId = '$shelfId' ORDER BY timeStamp DESC");
  print(_values);
  stockListNotifier.value.clear();
  _values.forEach((map) {
    final stock = ModelStockCount.fromMap(map);
    stockListNotifier.value.add(stock);
    stockListNotifier.notifyListeners();
  });
}

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
          title: Text('Do you want to remove these item?'),
          actions: <Widget>[
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                deleteScannedItem(itemName, shelfId);
                Navigator.of(context).pop();
              },
            ),
          ],
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
              borderRadius: BorderRadius.circular(30.0),
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
                      children: [Text("Quantity",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)],
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
                                            'Do you want to remove these item?'),
                                        actions: <Widget>[
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
                                            child: Text("No"),
                                          ),
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
                                              deleteScannedItem(
                                                  itemName, shelfID);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SortinList(shelfID)));
                                            },
                                            child: Text("Yes"),
                                          ),
                                        ],
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
                              MaterialStatePropertyAll<Color>(Colors.deepPurple),
                              shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: Colors.deepPurple, width: 2.0),
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
