import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;














// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class Postpage extends StatefulWidget {
//   const Postpage({Key? key}) : super(key: key);
//
//   @override
//   State<Postpage> createState() => _PostpageState();
// }
//
// class _PostpageState extends State<Postpage> {
//   void _showDialog(String title, String message) {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text(title),
//             content: Text(message),
//             actions: <Widget>[
//               TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop(context);
//                   },
//                   child: Text('Ok'))
//             ],
//           );
//         });
//   }
//   Future<void> postData() async {
//     var url = Uri.parse('http://localhost:3000/api/logincreate');
//     var response = await http.post(url, body: {
//       "username": "me",
//       "userpassword": "me@123",
//       "emailid": "meeee@ge.ae",
//       "isforcefulllogin": ""
//     });
//     if (response.statusCode == 201) {
//       // if the request is successful
//       var jsonResponse = jsonDecode(response.body);
//       _showDialog('success', jsonResponse['message']);
//       // Navigator.push(context, MaterialPageRoute(builder: builder))
//       // print(jsonResponse);
//     } else {
//       // if the request is unsuccessful
//       _showDialog(
//           'Error', 'Request failed with status: ${response.statusCode}');
//       print('Request failed with status: ${response.statusCode}.');
//     }
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Posting page'),
//       ),
//       body: Center(
//           child: ElevatedButton(
//               onPressed: () {
//                 postData();
//               },
//               child: Text('Post'))),
//     );
//   }
// }
