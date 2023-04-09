import 'package:dental_appointment_anuska_fyp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../payments/khalti.dart';

class BookAppointmentIma extends StatefulWidget {
   BookAppointmentIma({Key? key}) : super(key: key);
    
  @override
  State<BookAppointmentIma> createState() => _BookAppointmentImaState();
}

class _BookAppointmentImaState extends State<BookAppointmentIma> {
  int _value=0;
  TextEditingController dateController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text(
                          'BOOK AN APPOINTMENT',
                          style: 
                          TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            color: primaryColor,
                            fontWeight: FontWeight.w700,
                          )
                        ),
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData.fallback(),
      ),
      body: SafeArea(
        child:Center(
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Date and Time Selection
               Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  "Select Date",
                                  style: TextStyle(
                                    fontSize: 20
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: TextFormField(
                                    
                                    controller: dateController,
                                    decoration: const InputDecoration(
                                      icon: Icon(
                                        Icons.calendar_month,
                                        color: Color(0xff8696BB),
                                      ),
                                    ),
                                    readOnly: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Mandatory field';
                                      }
                                      return null;
                                    },
                                    onTap: () async {
                                      DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.now().add(const Duration(days: 30)),
                                      );
                                      if (pickedDate != null) {
                                        String formattedDate =DateFormat('yyyy-MM-dd').format(pickedDate);
                                        setState(() {
                                          dateController.text = formattedDate;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                padding:  EdgeInsets.all(8.0),
                child:  Text("Select Time",
                style: TextStyle(fontSize: 20),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Radio(
                    value: 1,
                     groupValue: _value, 
                     onChanged: (_){
                      setState(() {
                        _value=1;
                      });
                     },
                  ),
                  const SizedBox(width: 1.0,),
                  const Text("11:00 AM"),
                ],
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Radio(
                      value: 2,
                       groupValue: _value, 
                       onChanged: (_){
                        setState((){
                        _value=2;
                       }
                      );
                     },
                  ),
                  const SizedBox(width: 1.0,),
                  const Text("12:00 PM"),
                ],
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Radio(
                      value: 3,
                       groupValue: _value, 
                       onChanged: (_){
                        setState(() {
                          _value=3;
                        });
                       },
                    ),
                    const SizedBox(width: 1.0,),
                    const Text("01:00 PM"),
                  ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Radio(
                    value: 4,
                     groupValue: _value, 
                     onChanged: (_){
                      setState(() {
                        _value=4;
                      });
                     },
                  ),
                  const SizedBox(width: 1.0,),
                  const Text("02:00 PM"),
                ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Radio(
                    value: 5,
                     groupValue: _value, 
                     onChanged: (_){
                      setState(() {
                        _value=5;
                      });
                     },
                  ),
                  const SizedBox(width: 1.0,),
                  const Text("03:00 PM"),
                ]
              ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 InkWell( 
                  onTap: () => Get.to(()=>KhaltieApp()) ,
                  child: const Text("BOOK",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,

                  ),),
                 ),
                const Center(
                  child: SizedBox(
                    width: 30,
                  ),
                ),
             //Booking Cancellation
             TextButton(
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Are you sure you want to cancel?',
                          style: TextStyle(
                            color: primaryColor
                          ),),
                          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel',
                               style: TextStyle(
                            color: primaryColor
                          ),),
                            ),
                            TextButton(
                              onPressed: () => Get.to(()=> BookAppointmentIma()),
                              child: const Text('Confirm',
                               style: TextStyle(
                              color: primaryColor
                          ),),
                            ),
                          ],
                        ),
                      ),
                    child: const Text('CANCEL',
                           style: TextStyle(
                           fontFamily: 'Segoe UI',
                           fontSize: 20,
                           color:  primaryColor,
                           fontWeight: FontWeight.w700,
                          ),
                           softWrap: false,
                           ),
                    ),
                  ],
             ), 

          

             const Padding(
               padding: EdgeInsets.all(8.0),
               child: Text("*Booking Charges will be applicable",
               style: TextStyle(
                fontSize: 15,
                color: primaryColor,
               ),),
             )
            ],
            
          ),
        ) ),
    );
    
  }
}

