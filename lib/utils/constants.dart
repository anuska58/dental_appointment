import 'package:flutter/material.dart';
import 'package:get/get.dart';

const primaryColor=Color(0xff2e3192);
const backgroundColor=Colors.white;

showMessage({required String message, isSuccess=true}){
  
  Get.snackbar(
    isSuccess==true?"Success":"Error",
    message,
    colorText: Colors.white,
    backgroundColor: isSuccess ? Colors.green : Colors.red,
    
  );
}