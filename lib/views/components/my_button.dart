import '/utils/constants.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final onTap;
  final String text;
  final bool isLoading;
  const MyButton(
    {Key? key, 
      required this.onTap,
      this.text='Sign Up',
      this.isLoading=false
      }) 
  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading?const CircularProgressIndicator():
     InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left:10,right: 10,top:10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: primaryColor,
          ),
          width: double.infinity,
          height: 48,
          child:  Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(text,
              style: const TextStyle(
                color: Colors.white
              )),
            ),
          ),
        ),
      ),
    );
  }
}