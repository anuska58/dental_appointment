import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/medical_controller.dart';
import '../../../models/medical_report.dart';
import '../../../utils/constants.dart';
import '../../components/medical_report_component.dart';

class Report extends StatelessWidget {
  final MedicalReportController controller = Get.put(MedicalReportController());

  Report({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report'),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Obx(
          () => controller.reportList.value.isEmpty
              ? const Center(
                  child: Text(
                    'No reports found.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                )
              : ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 16.0),
                  itemCount: controller.reportList.value.length,
                  itemBuilder: (BuildContext context, int index) {
                    final MedicalReport report = controller.reportList.value[index];
                    return ReportComponent(report: report);
                  },
                ),
        ),
      ),
    );
  }
}
