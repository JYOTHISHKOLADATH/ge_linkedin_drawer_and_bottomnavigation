import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'model_StockCount.dart';

ValueNotifier<List<ModelStockCount>> stockListNotifier = ValueNotifier([]);

late Database _db;
Future<void> initializingDataBase() async {
  _db = await openDatabase('ScanDetails.db', version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE scannedItems (id INTEGER PRIMARY KEY, timeStamp TEXT, itemName TEXT, itemCount INTEGER)');
      });
}

Future<void> addItem(ModelStockCount value) async {
  await _db.rawQuery('INSERT INTO scannedItems (timeStamp,itemName,itemCount) VALUES (?,?,?)',
      [value.timeStamp,value.itemName, value.itemCount]);
  getAllItems();
}

Future<void> getAllItems() async {
  final _values = await _db.rawQuery('Select * FROM scannedItems ORDER BY timeStamp DESC');
  print(_values);
  stockListNotifier.value.clear();
  _values.forEach((map) {
    final stock = ModelStockCount.fromMap(map);
    stockListNotifier.value.add(stock);
    stockListNotifier.notifyListeners();
  });
}

Future<void> deleteScannedItem(String itemName) async {

  await _db.delete(
    'scannedItems',
    where: 'itemName = ?',
    whereArgs: [itemName],
  );
  getAllItems();
}

Future<void> updateStockCountAdd(String timeStamp,String itemName, int itemCount) async {
  await _db.update(
    'scannedItems',
    {'itemCount': itemCount+1,'timeStamp': timeStamp},
    where: 'itemName = ?',
    whereArgs: [itemName],
  );
  getAllItems();

}
Future<void> updateStockCountSub(BuildContext context, String timeStamp,String itemName, int itemCount) async {

  if(itemCount>1){
    await _db.update(
      'scannedItems',
      {'itemCount': itemCount-1,'timeStamp': timeStamp},
      where: 'itemName = ?',
      whereArgs: [itemName],
    );
  }else{
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
                deleteScannedItem(itemName);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  getAllItems();

}
// Future<void> updateStockCount(String itemName, int itemCount) async {
//   await _db
//       .rawUpdate('UPDATE scannedItems SET  itemCount = ? WHERE itemName = $itemName', [
//     '${itemCount+1}',
//   ]);
//   getAllItems();
//
// }

Future<int?> stockExists(itemName) async {
  var count = Sqflite.firstIntValue(await _db.rawQuery(
    'SELECT EXISTS(SELECT * FROM scannedItems WHERE itemName="$itemName")',
  ));
  return count;
}

// Future<void> getCount(String itemName) async {
//   final _count = await _db.rawQuery('Select * FROM scannedItems WHERE itemName="$itemName');
//   _count.forEach((map) {
//     final stock = ModelStockCount.fromMap(map);
//     int presentCount=stock.itemCount;
//     return presentCount;
//    });
// }

Future<void> updateScannedItem(String itemName, int newCount,String timeStamp) async {

  await _db.update(
    'scannedItems',
    {'itemCount': newCount+1,'timeStamp': timeStamp},
    where: 'itemName = ?',
    whereArgs: [itemName],
  );
  getAllItems();
}

Future<int> getItemCount(String itemName) async {

  final result = await _db.query(
    'scannedItems',
    columns: ['itemCount'],
    where: 'itemName = ?',
    whereArgs: [itemName],
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

  final List<Map<String, dynamic>> data = await _db.query('scannedItems', orderBy: 'timeStamp DESC');
  return data;
}

