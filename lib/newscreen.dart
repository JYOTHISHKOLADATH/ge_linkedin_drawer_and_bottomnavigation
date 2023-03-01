import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

bottom(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text('Job alerts'),
              ),
              ListTile(
                leading: Icon(Icons.assignment_turned_in_outlined),
                title: Text('Skill Assessments'),
              ),
              ListTile(
                leading: Icon(Icons.file_present_rounded),
                title: Text('Interview prep'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Application settings'),
              ),
            ],
          ),
        );
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))));
}
