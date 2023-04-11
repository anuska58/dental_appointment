import 'package:dental_appointment_anuska_fyp/controller/authentication_controller.dart';
import 'package:dental_appointment_anuska_fyp/utils/constants.dart';
import 'package:dental_appointment_anuska_fyp/views/components/my_button.dart';
import 'package:dental_appointment_anuska_fyp/views/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/my_field.dart';


class SignupScreen extends StatelessWidget {
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final confirmPasswordController=TextEditingController();

  final nameController=TextEditingController();
  final phoneController=TextEditingController();
  final addressController=TextEditingController();
  final genderController=TextEditingController();
  final ageController=TextEditingController();
  final formKey=GlobalKey<FormState>();
  final authentication =Get.put(Authentication());
  SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 200,
                    width: 300,
                  ),
                  const Text("Register a New Account",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primaryColor
                    )),
                  Padding(
                    padding: const EdgeInsets.only(top:10),
                    child: MyField(
                      prefixIcon:const Icon(Icons.email_outlined),
                      controller: emailController,
                      myValidator: (value){
                        final regex = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                          if (!regex.hasMatch(value)) {
                            return 'Not a valid email';
                          }
                        return null;
                      }
                    ),
                  ),
      
                    
                    MyField(
                    text: "Name",
                    prefixIcon:const Icon(Icons.person_outlined),
                    controller: nameController,
                    myValidator: (value)=>null 
                    ),
                    MyField(
                    text: "Phone Number",
                    prefixIcon:const Icon(Icons.phone_android_outlined),
                    controller: phoneController,
                    myValidator: (value)=>null 
                    ),
                    MyField(
                    text: "Password",
                    obscureText: true,
                    prefixIcon:const Icon(Icons.key_outlined),
                    controller: passwordController,
                    myValidator: (value){
                      RegExp regex = RegExp(
                              r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$');
                          //validate password
                          if (!regex.hasMatch(value)) {
                            return 'include a minimum of eight characters,\nat least one letter, number and a special character.';
                          }
                          return null;
                    }
                    ),
                    MyField(
                    text: "Confirm Password",
                    obscureText: true,
                    prefixIcon:const Icon(Icons.key_outlined),
                    controller: confirmPasswordController,
                    myValidator: (value){
                      if(value !=passwordController.text){
                        return 'The password does not match';
                      }
                    }
                    ),
                    MyField(
                    text: "Address",
                    prefixIcon:const Icon(Icons.location_city_outlined),
                    controller: addressController,
                    myValidator: (value)=>null 
                    ),
                    MyField(
                    text: "Gender",
                    prefixIcon:const Icon(Icons.wc),
                    controller: genderController,
                    myValidator: (value)=>null 
                    ),
                    MyField(
                    text: "Age",
                    prefixIcon:const Icon(Icons.person),
                    controller: ageController,
                    myValidator: (value)=>null 
                    ),
                    MyButton(onTap: (){
                      var isFormValid=formKey.currentState!.validate();
                      if(isFormValid){
                        var data={
                          "email":emailController.text,
                          "password":passwordController.text,
                          "name":nameController.text,
                          "address":addressController.text,
                          "gender":genderController.text,
                          "age":ageController.text,
                          "phone_number":phoneController.text,
                          
                          
                          };
                          authentication.signup(data);
                      }
                    }),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Already have an account?"),
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(LoginScreen());
                      },
                      child: const Text("Login",
                      style: TextStyle(
                        color:primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      )),
                    )
              ],),
            ),
          ),
        ))
    );
  }
}