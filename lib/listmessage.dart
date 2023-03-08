// import 'package:flutter/material.dart';
// import 'package:ge_bottomnavbar_drawer/add_messageWidgets.dart';
// import 'package:ge_bottomnavbar_drawer/editing_messagepage.dart';
// import 'package:ge_bottomnavbar_drawer/sqlite_service.dart';
//
// import 'modelMessage.dart';
//
// class ListmessageWidget extends StatefulWidget {
//   const ListmessageWidget({Key? key}) : super(key: key);
//
//   @override
//   State<ListmessageWidget> createState() => _ListmessageWidgetState();
// }
//
// class _ListmessageWidgetState extends State<ListmessageWidget> {
//   int? selectedIteme;
//   String? selectedTitle;
//   String? selectedMessage;
//   final AddMessage tools = new AddMessage();
//
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: messageListNotifier,
//       builder: (BuildContext context, List<MessageModal> messsageList,
//           Widget? child) {
//         return ListView.separated(
//             itemBuilder: (context, index) {
//               final data = messsageList[index];
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Card(
//                   child: ListTile(
//                     title: Text(data.title),
//                     subtitle: Text(data.message),
//                     trailing: IconButton(
//                         onPressed: () {
//                           deleteMessage(data.id);
//                         },
//                         icon: Icon(
//                           Icons.delete,
//                           color: Colors.redAccent,
//                         )),
//                     onTap: () {
//                       // selectedIteme=data.id;
//                       selectedTitle = data.title;
//                       selectedMessage = data.message;
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => EditingMessagePage(
//                                   data.id, selectedTitle, selectedMessage)));
//                       // EditingMessagePage(data.id,data.title,data.message)
//                       // updateMessage(MessageModal ,data.id,data.title,data.message);
//                     },
//                   ),
//                 ),
//               );
//             },
//             separatorBuilder: (context, index) {
//               return Divider();
//             },
//             itemCount: messsageList.length);
//       },
//     );
//   }
// }
