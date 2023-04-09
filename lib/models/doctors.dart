class Doctor {
  bool? success;
  String? message;
  List<Data>? data;

  Doctor({this.success, this.message, this.data});

  Doctor.fromJson(Map<String, dynamic> json) {
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
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? email;
  String? education;
  String? experience;
  String? nmcNumber;

  Data(
      {this.id,
      this.name,
      this.email,
      this.education,
      this.experience,
      this.nmcNumber});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    education = json['education'];
    experience = json['experience'];
    nmcNumber = json['nmc_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['education'] = education;
    data['experience'] = experience;
    data['nmc_number'] = nmcNumber;
    return data;
  }
}
