// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'apiconstants.dart';
// import 'package:http/http.dart' as http;
// import 'apiModal.dart';
//
//
// class ApiServices{
//   Future getUser() async{
//     try{
//       var url=Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
//       var response= await http.get(url);
//       if(response.statusCode==200){
//         List<Welcome> _model= welcomeFromJson(response.body);
//         return _model;
//       }
//     }catch(e){
//       log(e.toString());
//     }
//   }
// }


import 'dart:developer';


import 'dart:developer';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/sample_model%20%20class.dart';
import 'apiconstants.dart';
import 'package:http/http.dart' as http;
import 'apiModal.dart';

class ApiServices {
  Future<List<Welcome>> getUser() async {
    final response =
    await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      final List<dynamic> userJson = json.decode(response.body);
      final List<Welcome> userList =
      userJson.map((json) => Welcome.fromJson(json)).toList();
      return userList;
    } else {
      throw Exception('Failed to load data');
    }
  }
  
  Future <ModalLoginStatus>validateUser(String username,String password)async{
    final response= await http.get(Uri.parse('http://localhost:3000/api/login/$username/$password'));
    // print('http://localhost:3000/api/login/$username/$password');

   if(response.statusCode==200){
     return ModalLoginStatus.fromJson(jsonDecode(response.body));
     // print(response.body);
     // var data= json.decode(response.body.toString());
     // print(data["message"]);
     // return data;



     // print(response.body);
     //  final List<dynamic> validatorJson=json.decode(response.body);
     // final List<ModalLoginStatus> uservalidList=
     // validatorJson.map((json) =>ModalLoginStatus.fromJson(json)).toList();
     // print(response.body);
     // return uservalidList;

   }else{
     throw Exception('failed to load data');
   }
  }


}


