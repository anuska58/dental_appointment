import 'package:dental_appointment_anuska_fyp/controller/authentication_controller.dart';
import 'package:dental_appointment_anuska_fyp/utils/constants.dart';
import 'package:dental_appointment_anuska_fyp/views/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/my_button.dart';
import '../components/my_field.dart';


class LoginScreen extends StatelessWidget {

  LoginScreen({Key? key}) : super(key: key);

 final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final authentication = Get.find<Authentication>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 200,
                    width: 300,
                  ),
                  const Text("Login",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: primaryColor)),
                  MyField(
                    controller: emailController,
                    prefixIcon:const Icon(Icons.email_outlined),
                    myValidator: (value) {
                      final regex = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                          if (!regex.hasMatch(value)) {
                            return 'Not a valid email';
                          }
                        return null;
                      
                    },
                  ),
                  MyField(
                    text: "Password",
                    obscureText: true,
                    controller: passwordController,
                     prefixIcon:const Icon(Icons.key_outlined),
                    myValidator: (value) {
                      return null;
                    },
                  ),
                  MyButton(onTap: () {
                    
                    var isFormValid = formKey.currentState!.validate();
                    if (isFormValid) {
                     
                            var data={
                              "email":emailController.text,
                              "password":passwordController.text,
                            };
                            authentication.login(data);
                            // Get.to(HomePage());
                          }
                        // else{
                        //   printError(u);
                        // }  
                  },
                  text: "Login"),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Forgot Password?",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: primaryColor)),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Don't have an account?",
                        style: TextStyle(
                           fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                  InkWell(
                    onTap: () => Get.to(SignupScreen()),
                    child: const Text("Register",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
