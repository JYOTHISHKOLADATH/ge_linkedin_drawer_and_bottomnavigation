// import 'package:flutter/material.dart';
// import 'package:ge_bottomnavbar_drawer/add_messageWidgets.dart';
// import 'package:sqflite/sqflite.dart';
// import 'modelMessage.dart';
//
// ValueNotifier<List<MessageModal>> messageListNotifier = ValueNotifier([]);
//
// late Database _db;
// Future<void> initializingDataBase() async {
//   _db = await openDatabase('enteredmessages.db', version: 1,
//       onCreate: (Database db, int version) async {
//     await db.execute(
//         'CREATE TABLE messages (id INTEGER PRIMARY KEY, title TEXT, message TEXT)');
//   });
// }
//
// Future<void> addMessage(MessageModal value) async {
//   await _db.rawQuery('INSERT INTO messages (title,message) VALUES (?,?)',
//       [value.title, value.message]);
//   getAllMessages();
// }
//
// Future<void> getAllMessages() async {
//   final _values = await _db.rawQuery('Select * FROM messages ');
//   print(_values);
//   messageListNotifier.value.clear();
//   _values.forEach((map) {
//     final message = MessageModal.fromMap(map);
//     messageListNotifier.value.add(message);
//     messageListNotifier.notifyListeners();
//   });
// }
//
// Future<void> deleteMessage(int id) async {
//   await _db.rawDelete('DELETE FROM messages WHERE id=$id');
//   messageListNotifier.notifyListeners();
//   getAllMessages();
// }
//
// Future<void> updateMessage(int? id, String title, String message) async {
//   await _db
//       .rawUpdate('UPDATE messages SET title = ?, message = ? WHERE id = $id', [
//     '$title',
//     '$message',
//   ]);
//   getAllMessages();
// }
//
