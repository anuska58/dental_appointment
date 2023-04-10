import 'package:dental_appointment_anuska_fyp/controller/appointment_controller.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class AppointmentPage extends StatefulWidget {
  final String doctorName;
  final String appointmentDate;
  final String appointmentTime;
  final String description;
  final String appointmentStatus;
  final String appointmentId;
  final bool isDoctor;
  const AppointmentPage({
    super.key,
    required this.doctorName,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.description,
    required this.isDoctor,
    required this.appointmentStatus,
    required this.appointmentId,
  });

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  TextEditingController doctorController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();

    setState(() {
      doctorController.text = widget.doctorName;
      dateController.text = widget.appointmentDate;
      timeController.text = widget.appointmentTime;
      descriptionController.text = widget.description;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.white,
        backgroundColor: const Color.fromRGBO(99, 180, 255, 0.1),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Appointment",
                  
                ),
                const SizedBox(
                  height: 45,
                ),
                const Text(
                  "Doctor",
                  
                ),
                TextField(
                  controller: doctorController,
                  readOnly: true,
                ),
                const SizedBox(
                  height: 35,
                ),
                const Text(
                  "Date",
                  
                ),
                TextField(
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.calendar_month,
                      color: Color(0xff8696BB),
                    ),
                  ),
                  readOnly: true,
                  controller: dateController,
                ),
                const SizedBox(
                  height: 35,
                ),
                const Text(
                  "Time",
                  
                ),
                TextField(
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.timer_outlined,
                      color: Color(0xff8696BB),
                    ),
                  ),
                  readOnly: true,
                  controller: timeController,
                ),
                const SizedBox(
                  height: 35,
                ),
                const Text(
                  "Description",
                  
                ),
                TextField(
                  readOnly: true,
                  controller: descriptionController,
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                    child: (widget.isDoctor &&
                            widget.appointmentStatus ==
                                widget.appointmentStatus)
                        ? Column(children: [
                            const Text(
                              "Set Status",
                            ),
                            DropdownButtonFormField(
                              items: [
                                const DropdownMenuItem(
                                  value: "accepted",
                                  child: Text("Accepted"),
                                ),
                                const DropdownMenuItem(
                                  value: "rejected",
                                  child: Text("Rejected"),
                                ),
                              ],
                              onChanged: (value) async {
                                final request = await AppointmentController.updateStatus(
                                    widget.appointmentId, value.toString());
                                if (!request) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Edit failed.')),
                                  );
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      return const HomePage();
                                    },
                                  ));
                                  return;
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Appointment updated successfully.')),
                                );
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return const HomePage();
                                  },
                                ));
                              },
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                          ])
                        : const SizedBox(height: 10.0)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}