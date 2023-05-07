import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/medical_report.dart';
import '../../utils/api.dart';
import '../pages/medical_report_of_patients.dart';

class ReportComponent extends StatelessWidget {
  final MedicalReport report;
  const ReportComponent({Key? key, required this.report}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      
      child: SizedBox(
        height: Get.width/2 ,
        width: Get.width/2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () => Get.to(PatientReport(report: report)),
            child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 224, 241, 255),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right:8.0,left:8.0,bottom: 4.0),
                  child: Column(
                    children: [
                      Expanded(child: Image.network("$baseUrl/${report.image}")),
                      Text('Patient ID:${report.patientId}'),
                      Text(report.description)
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
