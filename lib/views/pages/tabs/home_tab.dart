import 'package:dental_appointment_anuska_fyp/controller/authentication_controller.dart';
import 'package:dental_appointment_anuska_fyp/utils/constants.dart';
import 'package:dental_appointment_anuska_fyp/utils/shared_prefs.dart';
import 'package:dental_appointment_anuska_fyp/views/pages/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';

import '../../../controller/doctor_controller.dart';

class FirstTab extends StatelessWidget {
final AuthService authService= AuthService();
final authentication=Get.find<Authentication>();
FirstTab({Key? key}) : super(key: key);
final DoctorController controller = Get.put(DoctorController());


@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
    title:Center(
      child: Image.asset(
                          "assets/images/logo.png",
                          height: 70,
                          width: 140,
                        ),
    ),
                      backgroundColor: Colors.white,
    ),
    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    body: SafeArea(
      child: SingleChildScrollView(
              child: Column(
                children: [
                  
                  // CustomScrollView(
                  //   slivers: [],
                    //child: 
                  
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ImageSlideshow(
                      width: double.infinity,

        /// Height of the [ImageSlideshow].
        height: 250,

        /// The page to show when first creating the [ImageSlideshow].
        initialPage: 0,

        /// The color to paint the indicator.
        indicatorColor: primaryColor,

        /// The color to paint behind th indicator.
        indicatorBackgroundColor: Colors.grey,

        /// The widgets to display in the [ImageSlideshow].
        /// Add the sample image file into the images folder
        // ignore: sort_child_properties_last
        children: [
          Image.asset(
            'assets/images/dental.png',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.fitWidth,
          ),
          
        ],

        /// Called whenever the page in the center of the viewport changes.
        // onPageChanged: (value) {
        //   print('Page changed: $value');
        // },

        /// Auto scroll interval.
        /// Do not auto scroll with null or 0.
        autoPlayInterval: 3000,

        /// Loops back to first slide.
        isLoop: true
      ),
                  ),
    
  
                  
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                        'Perfect Dental is a dental clinic located in Pokhara, Nepal. The clinic offers a range of dental services including general dentistry, cosmetic dentistry, orthodontics, endodontics, periodontics, and oral surgery. The clinic is staffed by a team of experienced and qualified dental professionals who are committed to providing high-quality dental care to their patients.\nPatients who visit Perfect Dental can expect a clean and modern facility equipped with state-of-the-art dental technology. The clinic uses the latest dental techniques and materials to ensure the best possible outcomes for their patients. Patients can also expect a comfortable and welcoming environment, with friendly staff who are dedicated to making their dental experience as pleasant as possible.\nIn addition to providing dental services, Perfect Dental is committed to educating their patients about good oral hygiene practices and preventive care. The clinic offers advice on proper brushing and flossing techniques, and provides information on the importance of regular dental check-ups and cleanings.\nOverall, Perfect Dental is a reputable dental clinic that provides comprehensive dental care to patients in Pokhara. The clinic is commitment to quality, professionalism, and patient care makes it a popular choice for those seeking dental services in the area.',
                        
                        style: 
                        TextStyle(
                          fontFamily:'Poppins',
                          fontSize: 16,
                          letterSpacing: 0.3,
                          color:  Color(0xff000000),      
                        ),
                        textAlign: TextAlign.left,
                      ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'OUR DOCTORS',
                        style: 
                        TextStyle(
                          fontFamily:'Poppins' ,
                          fontSize: 20,
                          color: Color(0xff2e3192),
                          fontWeight: FontWeight.w700,
                        ),
                        softWrap: false,
                      )
                      ),
                    ),
                     Obx(() => SizedBox(
                    height: (controller.doctorsList.value.length) * 200,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                              itemCount: controller.doctorsList.value.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: const Icon(Icons.person, size: 100,),
                                  title: Text(controller.doctorsList.value[index].name,
                                  style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18,height: 3)),
                                  subtitle: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text(controller.doctorsList.value[index].education,
                                        style: const TextStyle(fontSize: 16)),
                                        Text(controller.doctorsList.value[index].experience,
                                        style: const TextStyle(fontSize: 16),),
                                      Text(controller.doctorsList.value[index].nmc,
                                      style: const TextStyle(fontSize: 16),),
                                      Text(controller.doctorsList.value[index].email,
                                      style: const TextStyle(fontSize: 16),),
                                   
                                    ],
                                  ), 
                                );
                              },
                            ),
                 )
                 ),                
            ],
                

            ),
            
            ),
            
          
        ),
      );
    
      
      
}
}