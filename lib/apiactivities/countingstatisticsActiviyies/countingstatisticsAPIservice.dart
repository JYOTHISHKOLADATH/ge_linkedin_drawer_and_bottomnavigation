import 'dart:convert';
import 'package:http/http.dart' as http;

import 'countingStatisticsModel.dart';

Future<List<String>> fetchItems(String id) async {
  final response = await http.get(Uri.parse(
      "http://geapps.germanexperts.ae:7001/api/itemsforcountinglist/$id"),
    headers: {
      'apikey': "a4db08b7-5729-4ba9-8c08-f2df493465a1",
    },
  );

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    // List<Item> items = data.map((json) => Item.fromJson(json)).toList();
    List<String> items = data.map((json) => Item.fromJson(json).barcode ?? "").toList();
   print(items);
    return items;
  } else {
    throw Exception('Failed to load items');
  }
}
