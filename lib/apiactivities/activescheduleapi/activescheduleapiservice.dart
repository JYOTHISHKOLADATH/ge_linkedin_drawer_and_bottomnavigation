import 'package:http/http.dart' as http;
import 'dart:convert';

import 'apimodel.dart';
List<ScheduleApiModel>? schedulelist;
class ScheduleAPIService {
  Future<List<ScheduleApiModel>>showingSchedule() async {
    final response = await http.get(
      Uri.parse(
          "http://geapps.germanexperts.ae:7001/api/schedulebystatus"),
      headers: {
        'apikey': "a4db08b7-5729-4ba9-8c08-f2df493465a1",
      },
    );

    if (response.statusCode == 200) {
      // return ScheduleApiModel.fromJson(jsonDecode(response.body));
     var body= jsonDecode(response.body);
     List<ScheduleApiModel> schedulelist =List<ScheduleApiModel>.from(body.map((item) => ScheduleApiModel.fromJson(item)));
     return schedulelist;

    } else {
      throw Exception('failed to load data 12345');
    }
  }
}
