import 'package:dental_appointment_anuska_fyp/controller/doctor_controller.dart';
import 'package:dental_appointment_anuska_fyp/views/pages/bookingpages/book_appointment_ima.dart';
import 'package:dental_appointment_anuska_fyp/views/pages/bookingpages/book_appointment_sapana.dart';
import 'package:dental_appointment_anuska_fyp/views/pages/bookingpages/book_appointment_umesh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/authentication_controller.dart';
import '../../../utils/shared_prefs.dart';

class AppointmentTab extends StatelessWidget{
final AuthService authService= AuthService();
  final authentication=Get.find<Authentication>();
  AppointmentTab({Key? key}) : super(key: key);

  final DoctorController controller = Get.put(DoctorController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title:Center(
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'BOOK AN APPOINTMENT',
                    style: 
                    TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color: Color(0xff2e3192),
                      fontWeight: FontWeight.w700,
                    ),
                    softWrap: false,
                  )
                ),
                ),
             
                
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children:[
                    //     const Text(
                    //       'Dr. Umesh Parajuli',
                    //        style: TextStyle(
                    //         fontFamily: 'Cairo',
                    //         fontSize: 18,
                    //         color: Color(0xff000000),
                    //         wordSpacing: 1,
                    //         height: 1.5,
                    //       ),
                    //       softWrap: false,
                    //     ),
                    //     const Text(
                    //         'MDS\nOrthodontics',
                    //         style: TextStyle(
                    //           fontFamily: 'Cairo',
                    //           fontSize: 16,
                    //           color:  Color(0xff000000),
                    //           wordSpacing: 1,
                    //           height: 1.5,
                    //         ),
                    //         textAlign: TextAlign.left,
                    //       ),
                    //       InkWell(
                    //         onTap: () => Get.to(()=>BookAppointmentUmesh()),
                    //         child:const Text("BOOK",
                    //         style: TextStyle(
                    //           fontSize: 15,
                    //           fontWeight: FontWeight.bold,
                    //           color: Color(0xff2e3192),
                    //           decoration: TextDecoration.underline,
                    //         )
                    //         ),
                    //       ),  
                    //   ],
                    // ),
                 
                 
                Obx(() => SizedBox(
                    height: (controller.doctorsList.value.length) * 50,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: const Icon(Icons.person, size: 100,),
                                  title: Text(controller.doctorsList.value[0].name,
                                  style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18,height: 3)),
                                  subtitle: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text(controller.doctorsList.value[0].education,
                                        style: const TextStyle(fontSize: 16)),
                                        Text(controller.doctorsList.value[0].experience,
                                        style: const TextStyle(fontSize: 16),),
                                      Text(controller.doctorsList.value[0].nmc,
                                      style: const TextStyle(fontSize: 16),),
                                      InkWell(
                                      onTap: () => Get.to(()=> BookAppointmentUmesh()),
                                      child:  const Text("BOOK",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff2e3192),
                                        decoration: TextDecoration.underline,
                                      )),
                                    ),  
                                    ],
                                  ), 
                                );
                              },
                            ),
                 )
                 ), 
                Obx(() => SizedBox(
                    height: (controller.doctorsList.value.length) * 50,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: const Icon(Icons.person, size: 100,),
                                  title: Text(controller.doctorsList.value[1].name,
                                  style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18,height: 3)),
                                  subtitle: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text(controller.doctorsList.value[1].education,
                                        style: const TextStyle(fontSize: 16)),
                                        Text(controller.doctorsList.value[1].experience,
                                        style: const TextStyle(fontSize: 16),),
                                      Text(controller.doctorsList.value[1].nmc,
                                      style: const TextStyle(fontSize: 16),),
                                      InkWell(
                                        onTap: () => Get.to(()=> BookAppointmentSapana()),
                                        child:  const Text("BOOK",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff2e3192),
                                          decoration: TextDecoration.underline,
                                        )),
                                      ),  
                                    ],
                                  ), 
                                );
                              },
                            ),
                 )
                 ),
                 Obx(() => SizedBox(
                    height: (controller.doctorsList.value.length) * 50,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: const Icon(Icons.person, size: 100,),
                                  title: Text(controller.doctorsList.value[2].name,
                                  style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18,height: 3)),
                                  subtitle: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text(controller.doctorsList.value[2].education,
                                        style: const TextStyle(fontSize: 16)),
                                        Text(controller.doctorsList.value[2].experience,
                                        style: const TextStyle(fontSize: 16),),
                                      Text(controller.doctorsList.value[2].nmc,
                                      style: const TextStyle(fontSize: 16),),
                                      InkWell(
                                        onTap: () => Get.to(()=> BookAppointmentIma()),
                                        child:  const Text("BOOK",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff2e3192),
                                          decoration: TextDecoration.underline,
                                        )),
                                      ),  
                                    ],
                                  ), 
                                );
                              },
                            ),
                 )
                 ),  
               ],
          ),
        ),
      ),
    );
  }
}