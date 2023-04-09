import 'dart:convert';



List<AppointmentModel> appointmentFromJson(String str)=>
    List<AppointmentModel>.from(json.decode(str).map((x)=>AppointmentModel.fromJson(x)));
String productToJson(List<AppointmentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class AppointmentModel{
   AppointmentModel({
     required this.appointmentid,
     required this.doctorid,
     required this.patientid,
     required this.date,
     required this.time,
     required this.description,
     required this.status,

  });
  String appointmentid;
  String doctorid;
  String patientid;
  String date;
  String time;
  String description;
  String status;
  
  
  factory AppointmentModel.fromJson(Map<String,dynamic>json)=> AppointmentModel(
    appointmentid: json['id'] ,
    doctorid: json['doctorid'],
    patientid: json['patientid'],
    date: json['date'],
    time: json['time'],
    description: json['description'],
    status: json['status'],
  );
  Map<String,dynamic> toJson()=>{

      'id':appointmentid,
      'doctorid':doctorid,
      'patientid':patientid,
      'date':date,
      'time':time,
      'description':description,
      'status':status,
  };
}
