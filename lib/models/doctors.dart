import 'dart:convert';



List<Doctor> doctorFromJson(String str)=>
    List<Doctor>.from(json.decode(str).map((x)=>Doctor.fromJson(x)));
String doctorToJson(List<Doctor> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Doctor{
   Doctor({
     required this.id,
     required this.name,
     required this.email,
     required this.education,
     required this.experience,
     required this.nmc,


  });
  String id;
  String name;
  String email;
  String education;
  String experience;
  String nmc;
  
  
  factory Doctor.fromJson(Map<String,dynamic>json)=> Doctor(
    id: json['id'] ,
    name: json['name'],
    email: json['email'],
    education: json['education'],
    experience: json['experience'],
    nmc: json['nmc_number'],
  );
  Map<String,dynamic> toJson()=>{

      'id':id,
      'name':name,
      'email':email,
      'education':education,
      'experience':experience,
      'nmc_number':nmc,
     
  };
}
