import 'package:ge_bottomnavbar_drawer/apiactivities/viewschedule_api/viewschedule_api_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



  Future<ViewScheduleApiModel> viewSchedule(scheduleid) async {
    final response = await http.get(
      Uri.parse(
        "http://geapps.germanexperts.ae:7001/api/countingschedulebyid/$scheduleid"),
      headers: {
        'apikey': "a4db08b7-5729-4ba9-8c08-f2df493465a1",
      },
    );

    if (response.statusCode == 200) {
      // return ViewScheduleApiModel.fromJson(jsonDecode(response.body));
      final jsonList = jsonDecode(response.body);
      final jsonObject = jsonList.first;
      return ViewScheduleApiModel.fromJson(jsonObject);

      // var body= jsonDecode(response.body);
      // List<ViewScheduleApiModel> viewSchedulelist =List<ViewScheduleApiModel>.from(body.map((item) => ViewScheduleApiModel.fromJson(item)));
      // return viewSchedulelist;

    } else {
      throw Exception('failed to load data viewschdule 123');
    }
  }

