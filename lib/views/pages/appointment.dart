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
        backgroundColor: Color.fromRGBO(99, 180, 255, 0.1),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Appointment",
                  
                ),
                SizedBox(
                  height: 45,
                ),
                Text(
                  "Doctor",
                  
                ),
                TextField(
                  controller: doctorController,
                  readOnly: true,
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  "Date",
                  
                ),
                TextField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.calendar_month,
                      color: Color(0xff8696BB),
                    ),
                  ),
                  readOnly: true,
                  controller: dateController,
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  "Time",
                  
                ),
                TextField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.timer_outlined,
                      color: Color(0xff8696BB),
                    ),
                  ),
                  readOnly: true,
                  controller: timeController,
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  "Description",
                  
                ),
                TextField(
                  readOnly: true,
                  controller: descriptionController,
                  maxLines: 5,
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                    child: (widget.isDoctor &&
                            widget.appointmentStatus ==
                                widget.appointmentStatus)
                        ? Column(children: [
                            Text(
                              "Set Status",
                            ),
                            DropdownButtonFormField(
                              items: [
                                DropdownMenuItem(
                                  value: "accepted",
                                  child: Text("Accepted"),
                                ),
                                DropdownMenuItem(
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
                                      return HomePage();
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
                                    return HomePage();
                                  },
                                ));
                              },
                            ),
                            SizedBox(
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