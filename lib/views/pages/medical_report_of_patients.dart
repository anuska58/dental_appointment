import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/medical_report.dart';
import '../../utils/api.dart';
import '../../utils/constants.dart';
import '../../utils/shared_prefs.dart';

class PatientReport extends StatelessWidget {
  final AuthService authService=AuthService();
  final MedicalReport report;
  PatientReport({Key? key,required this.report}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Reports of Patient'),
        backgroundColor: primaryColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
            Image.network("$baseUrl/${report.image}", height: 500),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Patient ID: ${report.patientId}',
                        style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500))),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(report.description, 
                    style: TextStyle(fontSize: 17),)
                    ),
              ],
            ),
          ),
        ),
      ),
    );
}
}