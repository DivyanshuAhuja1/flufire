import 'package:flutter/material.dart';
import 'package:science_new/screens/dashboard.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Developers'),
      content: const Text('Divyanshu Ahuja- 12th Com. \nLaksh Rewani- 12th Sci.'),
      contentTextStyle: TextStyle(fontSize: 18, color: Colors.black),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Close the dialog
            Navigator.pushReplacement( // Navigate back to Dashboard and replace current route
              context,
              MaterialPageRoute(builder: (context) => Dashboard()),
            );
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
