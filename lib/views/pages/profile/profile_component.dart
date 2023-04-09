
import 'package:dental_appointment_anuska_fyp/models/users.dart';
import 'package:dental_appointment_anuska_fyp/views/pages/profile/profile_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/authentication_controller.dart';
import '../../../utils/constants.dart';
import '../../components/my_button.dart';
import '../loader.dart';
import 'update_profile.dart';

class ProfileComponent extends StatelessWidget {
  final User usersList;
  final authentication = Get.find<Authentication>();
  ProfileComponent({super.key, required this.usersList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SafeArea(
          child: Column(
            children: [
              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text("PROFILE",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      ),
                    softWrap: false,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: IconButton(onPressed:(){
                      Get.bottomSheet(ProfileBottomSheet());
                    }, icon: const Icon(Icons.menu)),
                  )
                ],
              ),
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(borderRadius: BorderRadius.circular(100),
                    child:Image.asset(
                              "assets/images/anu.png",
                              height: 70,
                              width: 70,
                            
                    ) ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color:primaryColor,
                      ),
                      child: const Icon(
                        Icons.create,
                        size: 18,
                        color: Colors.white,),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
               Text(usersList.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: 150,
                child:ElevatedButton(
                  onPressed:()=>Get.to(()=>UpdateProfilePage()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  side: BorderSide.none,
                  shape: const StadiumBorder()
                ),
                child:const Text("Edit Profile",
                style: TextStyle(
                  color: Colors.white,
                  
                )),
                
                ),
              ),
              const SizedBox(height: 30,),
              const Divider( color: Colors.grey,),
              const SizedBox(height: 10,),
              //menu
              
             
              Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email:  ${usersList.email}",
                  style: const TextStyle(
                  fontSize:16, fontWeight: FontWeight.bold)),
                   Text("Age:  ${usersList.age}",
                    style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold)),
          
                    Text("Address:  ${usersList.address}",
                    style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold)),
                  
                ],
              ),
            ]
            ),
            
               
        )
      );
    
  }
  logout() async{
  await authentication.logout();
  Get.offAll(const Loader());
  }
}
  
  