import 'package:ge_bottomnavbar_drawer/new_api_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserApiServices {
  Future<ApiModel> validationOfUser(
      String username, String password) async {
    final response = await http.get(
      Uri.parse(
          "http://geapps.germanexperts.ae:7001/api/login/$username/$password"),
      headers: {
        'apikey': "a4db08b7-5729-4ba9-8c08-f2df493465a1",
      },
    );

    if (response.statusCode == 200) {
      return ApiModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed to load data 12345');
    }
  }
}
