import 'dart:developer';
import 'package:dental_appointment_anuska_fyp/views/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../utils/services.dart';

class ResetPasswordController extends GetxController {
  bool requestChangeLoading = false;
  String verificationCode = '';

  requestChangePassword(BuildContext context, String email) async {
    verificationCode = '';
    update();
    requestChangeLoading = true;
    update();
    var response = await RemoteService().requestPasswordChange(
      email: email,
    );
    requestChangeLoading = false;
    update();
    verificationCode = response.data['status'].toString().trim();
    // if (verificationCode.length == 6) {
    //   Navigator.push(context,
    //       MaterialPageRoute(builder: (context) => TokenPage(email: email)));
    // }
    update();
  }

  bool tokenVerifyLoading = false;
  verifyToken(String email, String token, BuildContext context) async {
    tokenVerifyLoading = true;
    update();
    var response = await RemoteService().submitVerificationCode(token, email);

    bool valid = response.data['status'].toString().toLowerCase() == 'passed'
        ? true
        : false;
    if (valid) {
      Fluttertoast.showToast(msg: "Code verified enter new password.");
      log("Code Verified Enter new password");
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => NewPasswordPage(
      //       token: token,
      //       email: email,
      //     ),
      //   ),
      // );
    } else {
      Fluttertoast.showToast(
          msg: "Seeme like the code didn't match. Try again");
      log("The code didn't match");
    }
    tokenVerifyLoading = false;
    update();
  }

  bool newPasswordVisible = true;
  bool newPasswordConfirmVisible = true;
  toggleNewPasswordVisible() {
    newPasswordVisible = !newPasswordVisible;
    update();
  }

  toggleNewPasswordConfirmVisible() {
    newPasswordConfirmVisible = !newPasswordConfirmVisible;
    update();
  }

  bool changePasswordLoading = false;
  changePassword(
      String email, String password, String token, BuildContext context) async {
    changePasswordLoading = true;
    update();
    var response = await RemoteService().resetPassword(
      token,
      email,
      password,
    );

    changePasswordLoading = false;
    update();
    if (response.data.toString().toLowerCase().contains("problem")) {
      Fluttertoast.showToast(
          msg: 'There was a problem while changing the password');
      log('There was a problem while changing the password');
    } else {
      Fluttertoast.showToast(msg: "Password has been changed");
      log("Password has been changed");
       Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context){
            return LoginScreen();
          }
        )
      );
    } 
  }
}
