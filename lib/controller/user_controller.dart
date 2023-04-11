import 'dart:convert';
import 'dart:developer';

import 'package:dental_appointment_anuska_fyp/models/users.dart';
import 'package:dental_appointment_anuska_fyp/utils/api.dart';
import 'package:dental_appointment_anuska_fyp/utils/shared_prefs.dart';
import 'package:dental_appointment_anuska_fyp/views/pages/tabs/profile_tab.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

import '../utils/constants.dart';

class UserController extends GetxController{
  var isLoading=false.obs;
  final AuthService authService=AuthService();
  var usersList=<User>[].obs;

  @override
  void onInit(){
    super.onInit();
    getUserID();
    getUserDetails();
  }
  //get user id by passing the token
  getUserID() async{
    var url=Uri.parse(GET_USER_ID_API);
    var token_ = await authService.getToken();
    var response = await http.post(url, body: {"token": token_});
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        var userID = jsonResponse['id'].toString();
        var result = Future(() => userID);
        result.then((str) => (str));
        return result;
      } else {
        showMessage(
             message: jsonResponse["message"], isSuccess: false);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }


  //get the details of the user
  getUserDetails() async{
    var url = Uri.parse(GET_USER_DETAILS_API);
    var token_ = await authService.getToken();
    var response = await http.post(url, body: {"token": token_});
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        usersList.value = (jsonResponse["data"] as List)
            .map((e) => User.fromJson(e))
            .toList();
      } else {
        showMessage(
             message: jsonResponse["message"], 
             isSuccess: false);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  //controller for update profile
  updateProfile(data) async {
  var url = Uri.parse(EDIT_PROFILE_API);
  data['token'] = await authService.getToken();
  var response = await http.post(url, body: data);
  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    log('jsonResponse: $jsonResponse');
    if (jsonResponse != null && jsonResponse["success"]) {
      getUserDetails();
      Get.back();
      showMessage(message: jsonResponse['message'], isSuccess: true);
      update();
      
    } else {
      showMessage(
        message: jsonResponse["message"] ?? "Unknown error",
        isSuccess: false,
      );
    }
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

}