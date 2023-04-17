class AppointmentModel {
  String? id;
  String? doctorId;
  String? date;
  String? fromTime;
  String? toTime;
  String? status;

  AppointmentModel(
      {required this.id,
      required this.doctorId,
      required this.date,
      required this.fromTime,
      required this.toTime,
      required this.status});

 AppointmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    date = json['date'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['doctor_id'] = doctorId;
    data['date'] = date;
    data['from_time'] = fromTime;
    data['to_time'] = toTime;
    data['status'] = status;
    return data;
  }
}