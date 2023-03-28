import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ge_bottomnavbar_drawer/apiactivities/syncing%20data/syncingdata%20model.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

 createCountedItem(BuildContext context,String itemName,String shelfId) async {
  final response = await http.post(
    Uri.parse('http://geapps.germanexperts.ae:7001/api/counteditems'),
    headers: {
      'Content-Type': 'application/json',
      "apikey": "a4db08b7-5729-4ba9-8c08-f2df493465a1",
    },
    body: jsonEncode({
      "barcode":"8251479636",
      "itemcode":"9E0599257K",
      "itemname":"$itemName",
      "shelfnumber":"$shelfId",
      "schedule_id":"5",
      "role_id":"1",
      "branch_id":"2",
      "cmp_id":"1",
      "actualqty":"1",
      "synced_at":"28-Feb-2023",
      "synced_by":"11",
      "created_at":"27-Feb-2023",
      "created_by":"4"
    })
  );

  if (response.statusCode == 200||response.statusCode == 201) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Counted item created successfully."),
        backgroundColor: Colors.green,
      ),
    );
    print(response.body);
    //return CountedItemsResponse.fromJson(jsonDecode(response.body));
  } else {
    debugPrint(response.statusCode.toString());
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Something went wrong"),
        backgroundColor: Colors.red,
      ),
    );
    throw Exception;
  }
}
