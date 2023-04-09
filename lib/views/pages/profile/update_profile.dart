import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/user_controller.dart';
import '../../../utils/constants.dart';
import '../../components/my_button.dart';
import '../../components/my_field.dart';

class UpdateProfilePage extends StatelessWidget {
  final userController = Get.find<UserController>();
  final updateController = Get.put(UserController());
  final nameController=TextEditingController();
  final ageController=TextEditingController();
  final genderController=TextEditingController();
  final addressController=TextEditingController();
  final phoneController=TextEditingController();
  final formKey=GlobalKey<FormState>();
   UpdateProfilePage({Key? key}) : super(key: key){
    final currentUser = userController.usersList.first;
    nameController.text = currentUser.name;
    ageController.text = currentUser.age;
    genderController.text = currentUser.gender;
    addressController.text = currentUser.address;
    phoneController.text = currentUser.phoneNumber;
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed:()=>Get.back(closeOverlays: true),
          icon: const Icon(Icons.arrow_back_ios,
          color: Colors.white,),),
        title:  const Padding(
          padding: EdgeInsets.only(left: 75),
          child: Text("Edit Profile",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
        ),
        
        backgroundColor:primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Obx(
                () => userController.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : _buildForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyField(
            text: "Name",
            controller: nameController,
            myValidator: (value) {
              return null;
            },
          ),
          SizedBox(height: 20),
          MyField(
           text: "Age",
            controller: ageController,
            myValidator: (value) {
              return null;
            },
          ),
           SizedBox(height: 20),
          MyField(
           text: "Gender",
            controller: genderController,
            myValidator: (value) {
              return null;
            },
          ),
           SizedBox(height: 20),
          MyField(
           text: "Address",
            controller: addressController,
            myValidator: (value) {
              return null;
            },
          ),
          SizedBox(height: 20),
          MyField(
            
            text: "Phone Number",
            controller: phoneController,
            myValidator: (value) {
              return null;
            },
          ),
          SizedBox(height: 20),
          // Obx(
          //   () => userController.authService.isError.value
          //       ? (text: userController.authService.errorMessage.value)
          //       : SizedBox(),
          // ),
          SizedBox(height: 20),
          Obx(() => MyButton(
  isLoading: updateController.isLoading.value,
  onTap: () async {
    var data = {
      'name': nameController.text,
      'age': ageController.text,
      'gender': genderController.text,
      'address': addressController.text,
      'phone_number': phoneController.text,
    };
    var isValidated = formKey.currentState!.validate();

    if (isValidated) {
      updateController.isLoading(true);
      var updatedUsersList = await updateController.updateProfile(data); // added await here
      if (updatedUsersList != null) {
        userController.usersList.value = updatedUsersList; // updated the usersList here
      }
      updateController.isLoading(false);
    }
  },
  text: 'Save'
)),

        ],
      ),
    );
  }
}
