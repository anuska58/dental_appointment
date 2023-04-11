import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../models/medical_report.dart';
import '../utils/api.dart';
import '../utils/constants.dart';
import '../utils/shared_prefs.dart';

class MedicalReportController extends GetxController{
  AuthService authService=AuthService();
  var isLoading = false.obs;
  
  Rx<List<MedicalReport>> reportList=Rx<List<MedicalReport>>([]);

  @override
  void onInit(){
    super.onInit();
    getMedicalReportByID();
  }

 //get medical report uploaded by admin
  getMedicalReportByID() async {
    isLoading.value = true;
    var url = Uri.parse(GET_MEDICAL_REPORT_BY_ID);
    var token=await authService.getToken();   //get token in order to get user id
    var response = await http.post(url,body: {"token": token});
    isLoading.value = false;
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        reportList.value = (jsonResponse["data"] as List)
            .map((e) => MedicalReport.fromJson(e))
            .toList();
      } else {
        showMessage(message: jsonResponse["message"], isSuccess: false);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}