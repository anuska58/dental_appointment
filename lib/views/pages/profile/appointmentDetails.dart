import 'package:dental_appointment_anuska_fyp/controller/appointment_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../models/doctors.dart';
import '../../../utils/shared_prefs.dart';
import '../../components/appointment_card.dart';
import '../../components/menuOptions.dart';

class AppointmentDetails extends StatefulWidget {
  const AppointmentDetails({super.key});

  @override
  State<AppointmentDetails> createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
  String name = "";
  List<AppointmentCard> appointments = [];
  AuthService authService = AuthService();

  late bool isDoctor = false;
  @override
  void initState() {
    super.initState();
    initialFetch();
  }

  Future<void> initialFetch() async {
    //await fetchFirstName();
    await fetchAcceptedAppointments();
  }

  // Future<void> fetchFirstName() async {
  //   // final user = SharedPrefrence().getUserId();
  //   final user = await DoctorController.getCurrentUser();
  //   log('Current User:${user.first.email}');
  //   var shared = await SharedPreferences.getInstance();

  //   shared.setString("id", user.first.id!);
  //   setState(() {
  //     name = user.first.firstName!;
  //     isDoctor = user.first.isAdmin== "1";
  //     log('is doctor:$isDoctor');
  //   });
  // }

//as
  Future<void> fetchAcceptedAppointments() async {
    if (!isDoctor) {
      final acceptedAppointments =
          await AppointmentController.getAcceptedAppointmentPatient();
      List<AppointmentCard> appointmentList = [];
      List<Doctor> doctor = [];
      for (var appointment in acceptedAppointments) {
        List<String> dateArray = appointment.date!.split("-");
        DateTime date = DateTime(
          int.parse(dateArray[0]),
          int.parse(dateArray[1]),
          int.parse(dateArray[2]),
        );
        String dateFormatted = DateFormat('EEEE, d MMMM').format(date);
        doctor =
            await AppointmentController.getPatientById(appointment.doctorid!);
        appointmentList.add(AppointmentCard(
          doctorName: "Dr. ${doctor.first.data!.first.name}",
          appoinmentDate: dateFormatted,
          appointmentTime: appointment.time!,
          description: appointment.description!,
          appointmentStatus: appointment.status!,
          isDoctor: false,
          appointmentId: appointment.appointmentid!,
        ));
      }
      setState(() {
        appointments = appointmentList;
      });
    } else {
      final acceptedAppointments =
          await AppointmentController.getAcceptedAppointment();
      List<AppointmentCard> appointmentList = [];
      List<Doctor> doctor = [];
      for (var appointment in acceptedAppointments) {
        List<String> dateArray = appointment.date!.split("-");
        DateTime date = DateTime(
          int.parse(dateArray[0]),
          int.parse(dateArray[1]),
          int.parse(dateArray[2]),
        );
        String dateFormatted = DateFormat('EEEE, d MMMM').format(date);
        doctor =
            await AppointmentController.getPatientById(appointment.patientid!);
        appointmentList.add(AppointmentCard(
          doctorName: " ${doctor.first.data!.first.name}",
          appoinmentDate: dateFormatted,
          appointmentTime: appointment.time!,
          description: appointment.description!,
          appointmentStatus: appointment.status!,
          isDoctor: false,
          appointmentId: appointment.appointmentid!,
        ));
      }
      setState(() {
        appointments = appointmentList;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello,",
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          " $name",
                          style: Theme.of(context).textTheme.headline1,
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                !isDoctor
                    ? MenuOption(
                        menuTitle: "Accepted Appointment",
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () async {
                                final acceptedAppointments =
                                    await AppointmentController
                                        .getAcceptedAppointment();
                                List<AppointmentCard> appointmentList = [];
                                List<Doctor> patient = [];

                                for (var appointment in acceptedAppointments) {
                                  List<String> dateArray =
                                      appointment.date!.split("-");
                                  DateTime date = DateTime(
                                    int.parse(dateArray[0]),
                                    int.parse(dateArray[1]),
                                    int.parse(dateArray[2]),
                                  );
                                  String dateFormatted =
                                      DateFormat('EEEE, d MMMM').format(date);
                                  patient = await AppointmentController
                                      .getPatientById(appointment.patientid!);
                                  appointmentList.add(AppointmentCard(
                                    doctorName:
                                        "${patient.first.data!.first.name}",
                                    appoinmentDate: dateFormatted,
                                    appointmentTime: appointment.time!,
                                    description: appointment.description!,
                                    appointmentStatus: appointment.status!,
                                    isDoctor: isDoctor,
                                    appointmentId: appointment.appointmentid!,
                                  ));
                                }
                                setState(() {
                                  appointments = appointmentList;
                                });
                              },
                              child: MenuOption(
                                menuTitle: "Accepted Appointments",
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () async {
                                final pendingAppointments =
                                    await AppointmentController
                                        .getPendingAppointment();
                                List<AppointmentCard> appointmentList = [];
                                List<Doctor> patient = [];

                                for (var appointment in pendingAppointments) {
                                  List<String> dateArray =
                                      appointment.date!.split("-");
                                  DateTime date = DateTime(
                                    int.parse(dateArray[0]),
                                    int.parse(dateArray[1]),
                                    int.parse(dateArray[2]),
                                  );
                                  String dateFormatted =
                                      DateFormat('EEEE, d MMMM').format(date);
                                  patient = (await AppointmentController
                                      .getPatientById(appointment.patientid!));
                                  appointmentList.add(AppointmentCard(
                                    doctorName:
                                        "${patient.first.data!.first.name}",
                                    appoinmentDate: dateFormatted,
                                    appointmentTime: appointment.time!,
                                    description: appointment.description!,
                                    appointmentStatus: appointment.status!,
                                    isDoctor: isDoctor,
                                    appointmentId: appointment.appointmentid!,
                                  ));
                                }
                                setState(() {
                                  appointments = appointmentList;
                                });
                              },
                              child: MenuOption(
                                menuTitle: "Pending Appointments",
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () async {
                                final rejectedAppointments =
                                    await AppointmentController
                                        .getRejectedAppointment();
                                List<AppointmentCard> appointmentList = [];
                                List<Doctor> patient = [];

                                for (var appointment in rejectedAppointments) {
                                  List<String> dateArray =
                                      appointment.date!.split("-");
                                  DateTime date = DateTime(
                                    int.parse(dateArray[0]),
                                    int.parse(dateArray[1]),
                                    int.parse(dateArray[2]),
                                  );
                                  String dateFormatted =
                                      DateFormat('EEEE, d MMMM').format(date);
                                  patient = await AppointmentController
                                      .getPatientById(appointment.patientid!);
                                  appointmentList.add(AppointmentCard(
                                    doctorName:
                                        "${patient.first.data!.first.name}",
                                    appoinmentDate: dateFormatted,
                                    appointmentTime: appointment.time!,
                                    description: appointment.description!,
                                    appointmentStatus: appointment.status!,
                                    isDoctor: isDoctor,
                                    appointmentId: appointment.appointmentid!,
                                  ));
                                }
                                setState(() {
                                  appointments = appointmentList;
                                });
                              },
                              child: MenuOption(
                                menuTitle: "Rejected Appointments",
                              ),
                            ),
                          ],
                        ),
                      ),
                SizedBox(
                  height: 24,
                ),
                ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: appointments,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}