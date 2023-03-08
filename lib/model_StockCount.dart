import 'package:flutter/material.dart';



class ModelStockCount{
  final int? id;
  final String? timeStamp;
  final String itemName;
  final int itemCount;

  ModelStockCount({this.id,this.timeStamp,required this.itemName,required this.itemCount});

  // Map<String, dynamic> toMap() {
  //   var map = <String, dynamic>{};
  //   map["id"] = id;
  //   map["itemName"] = itemName;
  //   map["itemCount"] = itemCount;
  //   return map;
  // }

  static ModelStockCount fromMap(Map<String, Object?> map) {
    final id = map['id'] as int;
    final itemName = map['itemName'] as String;
    final timeStamp = map['timeStamp'] as String;
    final itemCount = map['itemCount'] as int;
    return ModelStockCount(id: id,timeStamp: timeStamp,itemName: itemName, itemCount: itemCount);
    // return ModelStockCount(id: id, itemName: itemName, itemCount: itemCount);
  }
}

// class ModelStockCount{
//   final int? id;
//   final String itemName;
//   final int itemCount;
//
//   ModelStockCount({this.id,required this.itemName,required this.itemCount});
//
//   // Map<String, dynamic> toMap() {
//   //   var map = <String, dynamic>{};
//   //   map["id"] = id;
//   //   map["itemName"] = itemName;
//   //   map["itemCount"] = itemCount;
//   //   return map;
//   // }
//
//   static ModelStockCount fromMap(Map<String, Object?> map) {
//     final id = map['id'] as int;
//     final itemName = map['itemName'] as String;
//     final itemCount = map['itemCount'] as int;
//     return ModelStockCount(id: id, itemName: itemName, itemCount: itemCount);
//   }
// }