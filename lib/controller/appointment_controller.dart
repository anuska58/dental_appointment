
// import 'dart:convert';
// import 'dart:developer';

// import 'package:dental_appointment_anuska_fyp/models/appointment.dart';
// import 'package:dental_appointment_anuska_fyp/utils/api.dart';
// import 'package:dental_appointment_anuska_fyp/utils/constants.dart';
// //import 'package:dental_appointment_anuska_fyp/views/pages/profile/appointment.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart'as http;
// import 'package:shared_preferences/shared_preferences.dart';

// import '../models/doctors.dart';
// import '../utils/shared_prefs.dart';

// class AppointmentController extends GetxController{
//   AuthService authService=AuthService();
//   var isLoading = false.obs;
  
//   var appointmentList=<AppointmentModel>[].obs;

  
//   addAppointment({required String doctorid,required String appointmentDate,required String appointmentTime,required String description})async{
//     isLoading.value=true;
//     var currentUser=await authService.getID();
//     var data={
//     'doctorid':doctorid,
//     'patientid':currentUser,
//     'appointmentDate':appointmentDate,
//     'appointmentTime':appointmentTime,
//     'description':description,
//     'appointmentStatus':"pending",
//     };
//      var url=Uri.parse(BOOKING_API);
//     var response=await http.post(url,body: data);
//     isLoading.value=false;
//     if(response.statusCode==200){
//       var jsonResponse=jsonDecode(response.body) as Map<String,dynamic>;
//       if(jsonResponse["success"]){
//         Get.back();
//         showMessage(message: jsonResponse["message"]);
//       }else{
//         showMessage(message: jsonResponse["message"],isSuccess: false);
//       }
//     }else{
//       print('Request failed with status: ${response.statusCode}.');
//     }
//   }

//  static Future<bool> updateStatus(String appid,String status) 
//  async{
//    var data={
//     'appointmentid':appid,
//     'status':status,
//    };
//    var url=Uri.parse(UPDATE_APPOINMENT_API);
//    var response=await http.post(url, body: data);
//     print('updateAppointmentResponse: ${response.body}');

//     if(response.statusCode==200){
//       //var jsonResponse=jsonDecode(response.body) as Map<String,dynamic>;
//       //if(jsonResponse["success"]){
//         return true;
       
//       }else{
//         return false;
//       } 
//     }//else{
//       //print('Request failed with status: ${response.statusCode}.');

//  static getPendingAppointment() async {
    
//      var pref=await SharedPreferences.getInstance();
//      var id=pref.getString('id');
//     var data={
//       'id':id!
//     };
//     var url = Uri.parse(PENDING_APPOINMENT_API);
//     var response = await http.post(url,body: data);
//     if (response.statusCode == 200) {
      
//     }
//        var appointmentList=json.decode(response.body);
//         final appointments=appointmentList.map<AppointmentModel>((json)=>AppointmentModel.fromJson(json)).toList();
//         return appointments;

//   }
//   static getAcceptedAppointmentPatient() async {
//     var pref=await SharedPreferences.getInstance();
//     String? id=pref.getString('id');

//     var data={
//       'id':id
//     };
//     var url = Uri.parse(ACCEPTED_APPOINMENT_FOR_PATIENT_API);
//     var response = await http.post(url,body: data);
//     if (response.statusCode == 200) {
//       var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
//       if (jsonResponse["success"]) {
//         var appointmentList=json.decode(response.body);
//         final appointments=appointmentList.map<AppointmentModel>((json)=>AppointmentModel.fromJson(json)).toList();
//         return appointments;
//         } else {
//         showMessage(message: jsonResponse["message"], isSuccess: false);
//       }
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//     }
//   }

//   static getAcceptedAppointment() async {
    
//      var pref=await SharedPreferences.getInstance();
//      var id=pref.getString('id');
//     var data={
//       'id':id!
//     };
//     var url = Uri.parse(ACCEPTED_APPOINMENT_API);
//     var response = await http.post(url,body: data);
//     if (response.statusCode == 200) {
//     }
//        var appointmentList=json.decode(response.body);
//         final appointments=appointmentList.map<AppointmentModel>((json)=>AppointmentModel.fromJson(json)).toList();
//         return appointments;

//   }
//     static getRejectedAppointment() async {
    
//      var pref=await SharedPreferences.getInstance();
//      var id=pref.getString('id');
//     var data={
//       'id':id!
//     };
//     var url = Uri.parse(REJECTED_APPOINMENT_API);
//     var response = await http.post(url,body: data);
//     if (response.statusCode == 200) {
//     }
//        var appointmentList=json.decode(response.body);
//         final appointments=appointmentList.map<AppointmentModel>((json)=>AppointmentModel.fromJson(json)).toList();
//         return appointments;

//   }

//   static getPatientById(String id)async{
//     try{
//     var pref=await SharedPreferences.getInstance();
//     String? id=pref.getString('id');
//     var data=Map<String,String>();
//     data['id']=id!;
//     var url=Uri.parse(GET_PATIENT_API);
//     final response= await http.post(url,body: data);
//     var list =json.decode(response.body);
//     final doctorsArray=list.map<Doctor>((json)=> Doctor.fromJson(json)).toList();
//     return doctorsArray;
//   }catch(e){
//     log("Error while getting the user by id $id");
//     log("Error:${e.toString()}");
//     return[];
//   }
//   } 
// }
    
 



  

