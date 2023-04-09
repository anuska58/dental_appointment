  import 'dart:developer';

import 'package:dental_appointment_anuska_fyp/utils/api.dart';
import 'package:dio/dio.dart';

class RemoteService{
  static String url="http://172.16.19.11/dental_appointment";


Future<Response> submitVerificationCode(String code, String email) async {
    String url =  
        '$baseUrl/verify_code.php?email=$email&token=$code';
    var response = await Dio().get(url);

    return response;
  }

  Future<Response> requestPasswordChange({
    required String email,
  }) async {
    log("<==Changing the password==>");
    String url ='$baseUrl/request_reset.php?email=$email';
    var response = await Dio().get(url);
    return response;
  }


  Future<Response> resetPassword(
      String token, String email, String password) async {
    String url ='$baseUrl/reset_password.php';

    var response = await Dio().post(
      url,
      data: FormData.fromMap(
        {
          "email": email,
          "token": token,
          "password": password,
        },
      ),
    );
    log(response.data.toString());
    return response;
  }
}



 
  


