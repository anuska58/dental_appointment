import 'dart:developer';

import 'package:dental_appointment_anuska_fyp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../Controller/schedule_controller.dart';
import '../../../controller/appointment_controller.dart';

// ignore: must_be_immutable
class BookAppointment extends StatefulWidget {
  String? id;
  String? doctorName;

  BookAppointment({Key? key, this.id, this.doctorName}) : super(key: key);

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  TextEditingController dateController = TextEditingController();
  final ScheduleController scheduleController = Get.put(ScheduleController());
  final AppointmentController appointmentController =
      Get.put(AppointmentController());
  String startTimeController = "0";
  String endTimeController = "0";

  bool _isChecked = false;

  void getSelectedDaySchedules(
      {required DateTime selectedDate, required String doctorId}) {
    int dayOfWeek;

    dayOfWeek = (selectedDate.weekday - 1) % 7;

    String doctorId1 = doctorId.toString();
    scheduleController.getSchedule(
        doctorid: doctorId1, dayofweek: dayOfWeek.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BOOK AN APPOINTMENT',
            style: TextStyle(
              fontSize: 20,
              color: primaryColor,
              fontWeight: FontWeight.w700,
            )),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData.fallback(),
      ),
      body: SafeArea(
          child: Center(
        child: SizedBox(
          height: 900,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Date and Time Selection
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Dr.${widget.doctorName.toString()}",
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Select Date",
                          style: TextStyle(fontSize: 20),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: TextFormField(
                            controller: dateController,
                            decoration: const InputDecoration(
                              icon: Icon(
                                Icons.calendar_month,
                                color: Color(0xff8696BB),
                              ),
                            ),
                            readOnly: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Mandatory field';
                              }
                              return null;
                            },
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 30)),
                              );
                              if (pickedDate != null) {
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                setState(() {
                                  dateController.text = formattedDate;

                                  getSelectedDaySchedules(
                                      selectedDate:
                                          DateTime.parse(dateController.text),
                                      doctorId: widget.id!);
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Select Time",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Obx(() => (SizedBox(
                    height:
                        (scheduleController.scheduleList.value.length) * 150,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: scheduleController.scheduleList.value.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            height: 200,
                            child: ListView(
                              children: <Widget>[
                                CheckboxListTile(
                                  title: Text(
                                      "From:${scheduleController.scheduleList.value[index].startTime!} TO:${scheduleController.scheduleList.value[index].endTime!}"),
                                  value: _isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isChecked = value ?? false;
                                      startTimeController = scheduleController
                                          .scheduleList.value[index].startTime!;
                                      endTimeController = scheduleController
                                          .scheduleList.value[index].endTime!;
                                    });
                                  },
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  secondary: IconButton(
                                    icon: const Icon(Icons.lock_clock),
                                    onPressed: () {
                                      setState(() {
                                        _isChecked = !_isChecked;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ))),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      appointmentController.addAppointment(
                          doctorid: widget.id.toString(),
                          fromTime: startTimeController,
                          toTime: endTimeController,
                          date: dateController.text);
                      log("Message:${widget.id},$startTimeController,$endTimeController,${dateController.text}");

                      // if (response == true) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(
                      //       content: Text('Booking request made sucessifully!'),
                      //       duration: Duration(seconds: 2),
                      //     ),
                      //   );
                      // } else {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(
                      //       content: Text('Booking request failed!'),
                      //       duration: Duration(seconds: 2),
                      //     ),
                      //   );
                      // }
                    },
                    // Get.to(
                    //   () => const KhaltieApp()),
                    child: const Text(
                      "Make Booking Request ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  const Center(
                    child: SizedBox(
                      width: 30,
                    ),
                  ),
                  //Booking Cancellation
                  TextButton(
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text(
                          'Are you sure you want to cancel?',
                          style: TextStyle(color: primaryColor),
                        ),
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: primaryColor),
                            ),
                          ),
                          TextButton(
                            onPressed: () => Get.to(() => BookAppointment()),
                            child: const Text(
                              'Confirm',
                              style: TextStyle(color: primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    child: const Text(
                      'CANCEL',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 20,
                        color: primaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                      softWrap: false,
                    ),
                  ),
                ],
              ),

              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "*Booking Charges will be applicable",
                  style: TextStyle(
                    fontSize: 15,
                    color: primaryColor,
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}