import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/sqlite_service.dart';

class EditingMessagePage extends StatefulWidget {
  final int? id;
  final String? title;
  final String? message;

  EditingMessagePage(this.id, this.title, this.message);

  @override
  State<EditingMessagePage> createState() => _EditingMessagePageState();
}

class _EditingMessagePageState extends State<EditingMessagePage> {
  @override
  final _textFieldControllerTitle = TextEditingController();
  final _textFieldControllerMessage = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Set the initial values of the TextFormFields
    _textFieldControllerTitle.text = widget.title ?? '';
    _textFieldControllerMessage.text = widget.message ?? '';
  }

  final validationkey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editing Page'),
      ),
      body: Form(
        key: validationkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _textFieldControllerTitle,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    label: Text('Title')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '*required';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _textFieldControllerMessage,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    label: Text('Message')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '*required';
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (validationkey.currentState!.validate()) {
                    updateMessage(widget.id, _textFieldControllerTitle.text,
                        _textFieldControllerMessage.text);
                    Navigator.pop(context);
                  }
                },
                child: Text('Update'))
          ],
        ),
      ),
    );
  }
}
