// ignore_for_file: use_build_context_synchronously

// ignore: must_be_immutable
import 'package:dental_appointment_anuska_fyp/views/pages/tabs/appointment_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/appointment_controller.dart';
import '../../../controller/schedule_controller.dart';
import '../../../utils/constants.dart';

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

  //bool _isChecked = false;
  late List<bool> _isCheckedList;

  void getSelectedDaySchedules(
      {required DateTime selectedDate, required String doctorId}) async {
    int dayOfWeek;
    dayOfWeek = (selectedDate.weekday - 1) % 7;

    String doctorId1 = doctorId.toString();

    await scheduleController.getSchedule(
        date: dateController.text.toString(),
        doctorid: doctorId1,
        dayofweek: dayOfWeek.toString());
    if (scheduleController.scheduleList.value.isNotEmpty) {
      _isCheckedList = List.generate(
          scheduleController.scheduleList.value.length, (index) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            "There are no schedule available for this day. Please select another date"),
        duration: Duration(seconds: 5),
        backgroundColor: Colors.red,
      )
      );
    }
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
                    height: (scheduleController.scheduleList.value.length) * 50,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: scheduleController.scheduleList.value.length,
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                          title: Text(
                              "From:${scheduleController.scheduleList.value[index].startTime!} TO:${scheduleController.scheduleList.value[index].endTime!}"),
                          value: _isCheckedList[index],
                          onChanged: (bool? value) {
                            //log("Hello");
                            setState(() {
                              // Update the selected state of the current tile
                              _isCheckedList[index] = value ?? false;

                              // Unselect other tiles if the current tile is selected
                              if (_isCheckedList[index]) {
                                _isCheckedList = List.generate(
                                    _isCheckedList.length, (index) => false);
                                _isCheckedList[index] = true;
                                startTimeController = scheduleController
                                    .scheduleList.value[index].startTime!;
                                endTimeController = scheduleController
                                    .scheduleList.value[index].endTime!;
                              }
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          secondary: IconButton(
                            icon: const Icon(Icons.lock_clock),
                            onPressed: () {
                              setState(() {
                                // Toggle the selected state of the current tile
                                _isCheckedList[index] = !_isCheckedList[index];
                              });
                            },
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
                      if (startTimeController != "0") {
                        appointmentController.addAppointment(
                            doctorid: widget.id.toString(),
                            fromTime: startTimeController,
                            toTime: endTimeController,
                            date: dateController.text);
                        //log("Message:${widget.id},$startTimeController,$endTimeController,${dateController.text}");
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                "Please select a time from the available schedule"),
                                backgroundColor: Colors.red,
                                )
                              );
                      }
                    },
                    
                    child: const Text(
                      "BOOK",
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
                            onPressed: () =>  Navigator.push(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                     return AppointmentTab();
                                  },
                                )),
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
