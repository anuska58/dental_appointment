class AppointmentModel {
  bool? success;
  String? message;
  List<Data>? data;

  AppointmentModel(
      {required this.success, required this.message, required this.data});

  AppointmentModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['data'] = this.data!.map((v) => v.toJson()).toList();
    return data;
  }
}

class Data {
  String? id;
  String? doctorId;
  String? date;
  String? fromTime;
  String? toTime;
  String? status;

  Data(
      {required this.id,
      required this.doctorId,
      required this.date,
      required this.fromTime,
      required this.toTime,
      required this.status});

  Data.fromJson(Map<String, dynamic> json) {
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