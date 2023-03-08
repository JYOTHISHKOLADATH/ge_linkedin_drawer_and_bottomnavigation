// import 'package:flutter/material.dart';
// import 'package:ge_bottomnavbar_drawer/modelMessage.dart';
// import 'package:ge_bottomnavbar_drawer/sqlite_service.dart';
//
// class AddMessage extends StatefulWidget {
//   const AddMessage({Key? key}) : super(key: key);
//
//   @override
//   State<AddMessage> createState() => _AddMessageState();
// }
//
// class _AddMessageState extends State<AddMessage> {
//   final _textFieldController1 = TextEditingController();
//   final _textFieldController2 = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: TextFormField(
//             controller: _textFieldController1,
//             decoration: InputDecoration(
//                 border:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//                 label: Text('Title')),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: TextFormField(
//             controller: _textFieldController2,
//             decoration: InputDecoration(
//                 border:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//                 label: Text('Message')),
//           ),
//         ),
//         ElevatedButton(
//             onPressed: () {
//               onSubmitButtonClicked();
//             },
//             child: Text('Add Message'))
//       ],
//     );
//   }
//
//   Future<void> onSubmitButtonClicked() async {
//     final _title = _textFieldController1.text.trim();
//     final _message = _textFieldController2.text.trim();
//     if (_title.isEmpty || _message.isEmpty) {
//       return;
//     }
//     print('$_title,$_message');
//     final _messageEntered = MessageModal(title: _title, message: _message);
//     addMessage(_messageEntered);
//     _textFieldController1.clear();
//     _textFieldController2.clear();
//   }
//
// }
