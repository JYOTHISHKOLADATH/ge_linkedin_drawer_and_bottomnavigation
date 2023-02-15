import 'package:flutter/material.dart';

class MessageModal{
   final id;
  final String title;
  final String message;

  MessageModal({required this.title,required this.message,this.id});

   Map<String,dynamic> toMap(){
    var map = <String,dynamic>{};
    map["id"]=id;
    map["title"]=title;
    map["message"]=message;
    return map;
  }




  static MessageModal fromMap(Map<String, Object?>map){
    final id=map['id'] as int ;
    final title=map['title'] as String;
    final message=map['message'] as String;
    return MessageModal(id: id ,title: title, message: message);
  }
}
