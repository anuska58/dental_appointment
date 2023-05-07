import 'dart:convert';
import 'dart:developer';

import 'package:dental_appointment_anuska_fyp/models/appointment.dart';
import 'package:dental_appointment_anuska_fyp/utils/api.dart';
import 'package:dental_appointment_anuska_fyp/utils/constants.dart';
//import 'package:dental_appointment_anuska_fyp/views/pages/profile/appointment.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../utils/shared_prefs.dart';
import '../views/payments/khalti.dart';

class AppointmentController extends GetxController {
  AuthService authService = AuthService();
  var isLoading = false.obs;

  var appointmentList = <AppointmentModel>[].obs;
   @override
  void onInit(){
    super.onInit();
    getAcceptedAppointmentPatient();
  }

  Future<bool> addAppointment({
    required String doctorid,
    required String fromTime,
    required String toTime,
    required String date,
  }) async {
    isLoading.value = true;
    var currentUser = await authService.getToken();
    log("Message from controller:$doctorid,$fromTime,$toTime,$date,$currentUser");

    var data = {
      'token': await authService.getToken(),
      'doctorid': doctorid,
      //'patientid':"12",
      'date': date,
      'from': fromTime,
      'to': toTime,
      'status': "pending",
    };
    var url = Uri.parse(BOOKING_API);
    var response = await http.post(url, body: data);
    isLoading.value = false;
    log(response.body.toString());
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        //Get.to(const KhaltieApp());
       await showMessage(message: jsonResponse["message"]);
        return true;
      } else {
        showMessage(message: jsonResponse["message"], isSuccess: false);
        return false;
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return false;
    }
  }

  static Future<bool> updateStatus(String appid, String status) async {
    var data = {
      'appointmentid': appid,
      'status': status,
    };
    var url = Uri.parse(UPDATE_APPOINMENT_API);
    var response = await http.post(url, body: data);

    if (response.statusCode == 200) {
      //var jsonResponse=jsonDecode(response.body) as Map<String,dynamic>;
      //if(jsonResponse["success"]){
      return true;
    } else {
      return false;
    }
  } //else{
  //print('Request failed with status: ${response.statusCode}.');
  getAcceptedAppointmentPatient()async {
    isLoading.value = true;
    var url = Uri.parse(ACCEPTED_APPOINMENT_FOR_PATIENT_API);
    var token=await authService.getToken();   //get token in order to get user id
    var response = await http.post(url,body: {"token": token});
    isLoading.value = false;
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        appointmentList.value = (jsonResponse["data"] as List)
            .map((e) => AppointmentModel.fromJson(e))
            .toList();
      } else {
        showMessage(message: jsonResponse["message"], isSuccess: false);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}





  