import 'dart:convert';
import 'dart:developer';
import 'package:dental_appointment_anuska_fyp/utils/api.dart';
import 'package:dental_appointment_anuska_fyp/utils/shared_prefs.dart';
import 'package:dental_appointment_anuska_fyp/views/pages/home_page.dart';
import 'package:dental_appointment_anuska_fyp/views/pages/login_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';

class Authentication extends GetxController {
  final _token = ''.obs;
  final authService = AuthService();

  login(data) async {
    var url = Uri.parse(LOGIN_API);
    var response = await http.post(url,
        body:
            data); //await: to wait the second portion unless the first portion is done.

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      log(jsonResponse.toString());
      if (jsonResponse["success"] && jsonResponse["isAdmin"] == '0') {
        await authService.saveToken(jsonResponse["token"]);
        Get.offAll(const HomePage());
        showMessage(message: jsonResponse['message'], isSuccess: true);
      } else {
        showMessage(message: "Invalid Email or Password", isSuccess: false);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  signup(data) async {
    var url = Uri.parse(SIGN_API);
    var response = await http.post(url,
        body:
            data); //await: to wait the second portion unless the first portion is done.
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        Get.offAll(LoginScreen());
        showMessage(message: jsonResponse['message'], isSuccess: true);
      } else {
        showMessage(message: jsonResponse['message'], isSuccess: false);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  logout() async {
    var token_ = await authService.getToken();
    var url = Uri.parse(LOGOUT_API);
    var response = await http.post(url, body: {"token": token_});
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        await authService.removeToken();
        Get.offAll(LoginScreen());
        showMessage(message: jsonResponse["message"], isSuccess: true);
      } else {
        showMessage(message: jsonResponse["message"], isSuccess: false);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}