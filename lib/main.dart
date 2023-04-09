import 'package:dental_appointment_anuska_fyp/views/pages/home_page.dart';
import 'package:dental_appointment_anuska_fyp/views/pages/loader.dart';
import 'package:dental_appointment_anuska_fyp/views/pages/profile/profile_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalti/khalti.dart';

import 'controller/authentication_controller.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Khalti.init(
    publicKey: 'test_public_key_df43763c0b7741c1a3454d4f38adb507',
    enabledDebugging: false,
  );
 Get.put(Authentication());
  runApp( MaterialApp(
      home: GetMaterialApp(
      title: "Dental Appointment Project",
      theme: ThemeData(
        fontFamily: 'Poppins'
      ),
      debugShowCheckedModeBanner: false,
      home:const Loader())));
}

