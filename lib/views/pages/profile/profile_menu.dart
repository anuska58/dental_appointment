import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
    this.endIcon=true,
    this.textColor,
  });
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
   // var isDark=MediaQuery.of(context).platformBrightness==Brightness.dark;
    //var iconColor=isDark? (Colors.white) : primaryColor;
    return ListTile(
      onTap: onPressed,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: primaryColor.withOpacity(0.1)
        ),
        child: Icon(icon,color: primaryColor,),
      ),
      title: Text(title,
      style:const TextStyle(
        color: primaryColor,
      ).apply(color: textColor) ,),
      trailing: endIcon? Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color:Colors.grey.withOpacity(0.1)
        ),
        child: const Icon(Icons.arrow_forward_ios,size:18.0,color: Colors.grey,),
      ):null,
      
      );
  }
}
