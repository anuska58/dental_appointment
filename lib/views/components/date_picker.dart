import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
   DatePicker({Key? key}) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  void _showDatePicker(){
    showDatePicker(context: context,
     initialDate: DateTime.now(),
      firstDate: DateTime.now(), 
      lastDate: DateTime(2025));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: MaterialButton(
        onPressed: _showDatePicker,
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text('Choose Date',
          style:TextStyle(
            color: Colors.white,
            fontSize: 20,
          )
          )
        ),
      ))
    );
  }
}