import 'package:dental_appointment_anuska_fyp/utils/constants.dart';
import 'package:dental_appointment_anuska_fyp/views/pages/profile/appointmentDetails.dart';
import 'package:dental_appointment_anuska_fyp/views/pages/profile/medical_report.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/authentication_controller.dart';
import '../../../utils/shared_prefs.dart';
import '../loader.dart';
import 'profile_menu.dart';

class ProfileBottomSheet extends StatelessWidget {
  final AuthService authService= AuthService();
  final authentication=Get.find<Authentication>();
 ProfileBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)),
        color: Colors.white,),
      child: Column(
        children: [
          const SizedBox(height: 8,),
          const Center(
            child: Icon(Icons.keyboard_double_arrow_down_outlined, color: primaryColor,)),
              ProfileMenuWidget(title: "Medical Report",icon: Icons.medical_information_outlined,onPressed: ()=>Get.to(()=>Report())) ,
              ProfileMenuWidget(title: "Appointment",icon: Icons.schedule_outlined,onPressed: ()=>Get.to(()=>MyAppointmentsPage())) ,
             // ProfileMenuWidget(title: "Settings",icon: Icons.settings_outlined,onPressed: (){}) ,
              //ProfileMenuWidget(title: "Transactions",icon: Icons.wallet,onPressed: (){}) ,
              //const Divider(color: Colors.grey,),
              //const SizedBox(height: 10,),
              ProfileMenuWidget(title: "Logout",
                icon: Icons.logout,
              textColor: Colors.red,
              endIcon:false,
              onPressed: ()=>logout()
              ) ,
            ],)
        
      
    );
  }
  logout() async{
  await authentication.logout();
  Get.offAll(const Loader());
  }
}