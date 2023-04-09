import 'dart:convert';

MedicalReport medicalReportFromJson(String str) => MedicalReport.fromJson(json.decode(str));

String medicalReportToJson(MedicalReport data) => json.encode(data.toJson());

class MedicalReport {
    MedicalReport({
        required this.id,
        required this.patientId,
        required this.description,
        required this.image,
    });

    String id;
    String patientId;
    String description;
    String image;

    factory MedicalReport.fromJson(Map<String, dynamic> json) => MedicalReport(
        id: json["id"],
        patientId: json["patient_id"],
        description: json["description"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "patient_id": patientId,
        "description": description,
        "image": image,
    };
}