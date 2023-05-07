import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalti/khalti.dart';

import 'controller/authentication_controller.dart';
import 'views/pages/loader.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Khalti.init(
   // publicKey: 'test_public_key_d1987391b8fb4a598af0d423089e8299',
   publicKey: 'test_public_key_939c60f8638d40be8a2860d292361a9a',
    enabledDebugging: true,
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

