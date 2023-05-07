import 'package:dental_appointment_anuska_fyp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dental_appointment_anuska_fyp/models/appointment.dart';

import '../../../controller/appointment_controller.dart';

class MyAppointmentsPage extends StatefulWidget {
  @override
  _MyAppointmentsPageState createState() => _MyAppointmentsPageState();
}

class _MyAppointmentsPageState extends State<MyAppointmentsPage> {
  final AppointmentController _appointmentController =
      Get.put(AppointmentController());

  @override
  void initState() {
    super.initState();
    _appointmentController.getAcceptedAppointmentPatient();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Appointments'),
        backgroundColor: primaryColor,
      ),
      body: Obx(() {
        if (_appointmentController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: _appointmentController.appointmentList.length,
            itemBuilder: (context, index) {
              AppointmentModel appointment =
                  _appointmentController.appointmentList[index];
              return ListTile(
                title: Text('Doctor ID:${appointment.doctorId}',
                style: const TextStyle(fontWeight: FontWeight.w600),),
                subtitle: Text(
                    '${appointment.date} ${appointment.fromTime} - ${appointment.toTime}'),
                    trailing: Text('${appointment.status}'),
              );
            },
          );
        }
      }),
    );
  }
}
