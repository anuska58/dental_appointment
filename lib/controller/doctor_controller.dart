import 'dart:convert';
import 'dart:developer';

import 'package:dental_appointment_anuska_fyp/utils/api.dart';
import 'package:dental_appointment_anuska_fyp/utils/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/doctors.dart';
import '../utils/constants.dart';

class DoctorController extends GetxController{
  AuthService authService=AuthService();
  var isLoading = false.obs;
  
  Rx<List<Data>> doctorsList=Rx<List<Data>>([]);

  @override
  void onInit(){
    super.onInit();
    get();
  }

  //get doctors data
  get() async {
    isLoading.value = true;
    var url = Uri.parse(GET_DOCTOR_API);
    var response = await http.get(url);
    isLoading.value = false;
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        doctorsList.value = (jsonResponse["data"] as List) //convert ta obtained data as list
            .map((e) => Data.fromJson(e))
            .toList();
      } else {
        showMessage(message: jsonResponse["message"], isSuccess: false);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
  
