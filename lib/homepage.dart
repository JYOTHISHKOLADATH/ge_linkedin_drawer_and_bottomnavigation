import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/add_messageWidgets.dart';
import 'package:ge_bottomnavbar_drawer/home_bottomsheet.dart';
import 'package:ge_bottomnavbar_drawer/listmessage.dart';
import 'package:ge_bottomnavbar_drawer/sqlite_service.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  @override
  Widget build(BuildContext context) {
    String enteredMail = widget.name;
    var mailsplit = enteredMail.split('@');
    String _username = mailsplit[0].toUpperCase();
    getAllMessages();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.message),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Hai, ${_username}',
                      style: TextStyle(fontSize: 30),
                    )),

                // Text(widget.name),
              ],
            ),
          ),
    AddMessage(),
          Expanded(child: ListmessageWidget()),
          SizedBox(
            height: 30,
          ),

        ],
      ),
    );
  }
}
