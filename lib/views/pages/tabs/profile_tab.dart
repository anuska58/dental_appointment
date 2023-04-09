 import 'package:dental_appointment_anuska_fyp/controller/user_controller.dart';
import 'package:dental_appointment_anuska_fyp/models/users.dart';
import 'package:dental_appointment_anuska_fyp/utils/constants.dart';
import 'package:dental_appointment_anuska_fyp/views/pages/profile/profile_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/authentication_controller.dart';
import '../../../utils/shared_prefs.dart';
import '../profile/profile_component.dart';
import '../loader.dart';
import '../profile/profile_menu.dart';

class ProfileTab extends StatelessWidget {
  final AuthService authService= AuthService();
  final UserController userController=Get.put(UserController());
  final authentication=Get.find<Authentication>();
  ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var isDark =MediaQuery.of(context).platformBrightness==Brightness.dark;
    return SafeArea(
         
               child:
                Obx(() => Wrap(
                children: userController.usersList.value
                  .map((User userDetails) =>
                    ProfileComponent(usersList: userDetails))
                  .toList())),
              
    
    );         
  }
  logout() async{
  await authentication.logout();
  Get.offAll(const Loader());
  }
}



