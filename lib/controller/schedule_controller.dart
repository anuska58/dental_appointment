import 'dart:convert';
import 'dart:developer';

//import 'package:dental_appointment_anuska_fyp/views/pages/profile/appointment.dart';
import 'package:dental_appointment_anuska_fyp/utils/api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/schedule.dart' as schedule;
import '../utils/constants.dart';
import '../utils/shared_prefs.dart';

class ScheduleController extends GetxController {
  AuthService authService = AuthService();
  var isLoading = false.obs;

  Rx<List<schedule.Data>> scheduleList = Rx<List<schedule.Data>>([]);

  getSchedule(
      {required String date,
      required String doctorid,
      required String dayofweek}) async {
    isLoading.value = true;
    var data = {'doctorid': doctorid, 'dayOfWeek': dayofweek, 'date': date};
    var url = Uri.parse(GET_SELECTABLE_TIMES);
    var response = await http.post(url, body: data);
    isLoading.value = false;
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      log(jsonResponse.toString());

      if (jsonResponse["success"] != null) {
        if (jsonResponse["data"] != null) {
          scheduleList.value = (jsonResponse["data"] as List)
              .map((e) => schedule.Data.fromJson(e))
              .toList();
          log(jsonResponse.toString());

          update();
        }
      } else {
        showMessage(
            message: jsonResponse["message"].toString(), isSuccess: false);
      }
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
    //else{
    //print('Request failed with status: ${response.statusCode}.');
  }
}
