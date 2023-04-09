import 'package:dental_appointment_anuska_fyp/utils/shared_prefs.dart';
import 'package:dental_appointment_anuska_fyp/views/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_page.dart';

class Loader extends StatefulWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    checkifAuthenticated();
  }

  checkifAuthenticated() async {
    await Future.delayed(const Duration(seconds: 2));
    var token = await authService.getToken();
    if (token != null) {
      Get.offAll(const HomePage());
    } else {
      Get.offAll(LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            "assets/images/logo.png",
            height: 200,
            width: 200,
          ),
        ),
        const Center(child: CircularProgressIndicator()),
      ],
    ));
  }
}