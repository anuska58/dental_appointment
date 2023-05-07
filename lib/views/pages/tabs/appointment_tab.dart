import 'dart:developer';

import 'package:dental_appointment_anuska_fyp/controller/doctor_controller.dart';
import 'package:dental_appointment_anuska_fyp/views/pages/bookingpages/book_appointment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/authentication_controller.dart';
import '../../../utils/shared_prefs.dart';

class AppointmentTab extends StatelessWidget {
  final AuthService authService = AuthService();
  final authentication = Get.find<Authentication>();
  AppointmentTab({Key? key}) : super(key: key);

  final DoctorController controller = Get.put(DoctorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            "assets/images/logo.png",
            height: 70,
            width: 140,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Column(
          children: [
            const Center(
              child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'BOOK AN APPOINTMENT',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff2e3192),
                      fontWeight: FontWeight.w700,
                    ),
                    softWrap: false,
                  )),
            ),
            Obx(() => Center(
              child: SizedBox(
                    height: (controller.doctorsList.value.length) * 150,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: controller.doctorsList.value.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(BookAppointment(
                              id: controller.doctorsList.value[index].id!,
                              doctorName:
                                  controller.doctorsList.value[index].name!,
                            ));
                          },
                          child: Card(
                            elevation: 8.0,
                            child: ListTile(
                              leading: Image.asset(
                                    "assets/images/logo.png",
                                    height: 100,
                                    width: 100,
                                  ),
                              title: Text(
                                  controller.doctorsList.value[index].name!,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      height: 3)),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      controller
                                          .doctorsList.value[index].education!,
                                      style: const TextStyle(fontSize: 16)),
                                  Text(
                                    controller
                                        .doctorsList.value[index].experience!,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    controller
                                        .doctorsList.value[index].nmcNumber!,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    controller
                                        .doctorsList.value[index].experience!,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  Divider(
                                    height: 1,
                                    thickness: 1,
                                    color: Colors.grey[300],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
            )),
          ],
        ),
      ),
    );
  }
}
