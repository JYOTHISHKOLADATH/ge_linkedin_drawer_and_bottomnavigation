import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/add_messageWidgets.dart';
import 'package:sqflite/sqflite.dart';
import 'modelMessage.dart';

ValueNotifier<List<MessageModal>> messageListNotifier = ValueNotifier([]);

late Database _db;
Future<void> initializingDataBase() async {
  _db = await openDatabase('enteredmessages.db', version: 1,
      onCreate: (Database db, int version) async {
    await db.execute(
        'CREATE TABLE messages (id INTEGER PRIMARY KEY, title TEXT, message TEXT)');
  });
}

Future<void> addMessage(MessageModal value) async {
  await _db.rawQuery('INSERT INTO messages (title,message) VALUES (?,?)', [value.title, value.message]);
  getAllMessages();
  // messageListNotifier.value.add(value);
  // messageListNotifier.notifyListeners();
}

Future<void> getAllMessages() async {
  final _values = await _db.rawQuery('Select * FROM messages ');
  print(_values);
  messageListNotifier.value.clear();
  _values.forEach((map) {
    final message = MessageModal.fromMap(map);
    messageListNotifier.value.add(message);
    messageListNotifier.notifyListeners();
  });
}

Future<void> deleteMessage(int id) async {
  await _db.rawDelete('DELETE FROM messages WHERE id=$id',['id']);
  messageListNotifier.notifyListeners();
  getAllMessages();
}

Future<void> updateMessage(int? id,String title ,String message)async{

  await _db.rawUpdate(
      'UPDATE messages SET title = ?, message = ? WHERE id = $id',
      ['$title', '$message',]);
  getAllMessages();
  // await _db.update(message,messageModal.toMap(), where: '$id',whereArgs: ['$id']);

  // await _db.rawUpdate(
  //     'UPDATE messages SET name = $title, value = $message WHERE name = $id',
  //     ['updated name', '9876', 'some name']);

}

// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'modelMessage.dart';
// class SqliteService {
//   Future<Database> initializeDB() async {
//     String path = await getDatabasesPath();
//
//     return openDatabase(
//       join(path, 'database.db'),
//       onCreate: (database, version) async {
//         await database.execute(
//             'CREATE TABLE Messages(title TEXT NOT NULL,message TEXT NOT NULL)',
//         );
//       },
//       version: 1,
//     );
//   }
//   Future<int> createItem(Note note) async {
//     int result = 0;
//     final Database db = await initializeDB();
//     final id = await db.insert(
//         'Notes', note.toMap(),
//         conflictAlgorithm: ConflictAlgorithm.replace);
//   }Future<List<Note>> getItems() async {
//     final db = await SqliteService.initizateDb();
//     final List<Map<String, Object?>> queryResult =
//     await db.query('Notes', orderBy: NoteColumn.createdAt);
//     return queryResult.map((e) => Note.fromMap(e)).toList();
//   }
//
// }
