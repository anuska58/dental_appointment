import 'package:flutter/material.dart';

class MyDialogue extends StatelessWidget {
  const MyDialogue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
       title: const Text("Confirm"),
       content: const Text("Are you sure you want to cancel?"),
           actions: <Widget>[
             TextButton(
               child: const Text('Confirm'),
               onPressed: () {
                 print('Confirmed');
                 Navigator.of(context).pop();
               },
             ),
             TextButton(
               child: const Text('Cancel'),
               onPressed: () {
                 Navigator.of(context).pop();
               },
             ),
           ],
     );
  }
}