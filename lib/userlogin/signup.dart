import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../reusable_widgets/reusable_widget.dart';
import '../../utils/color_utils.dart';
import '../screens/dashboard.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _phnTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  String _errorText = '';
  bool _isPasswordVisible = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("CB2B93"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                  "UserName",
                  Icons.person_outline,
                  false,
                  _userNameTextController,
                ),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                  "Name",
                  Icons.person_outline,
                  false,
                  _nameTextController,
                ),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                  "Phone Number",
                  Icons.person_outline,
                  false,
                  _phnTextController,
                ),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                  "Enter Email Id",
                  Icons.person_outline,
                  false,
                  _emailTextController,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          reusableTextField(
                            "Enter Password",
                            Icons.lock_outlined,
                            !_isPasswordVisible,
                            _passwordTextController,
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                if (_errorText.isNotEmpty)
                  Text(
                    _errorText,
                    style: TextStyle(color: Colors.red),
                  ),
                const SizedBox(
                  height: 20,
                ),
                FirebaseButton(context, "Sign Up", () {
                  _signUp();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signUp() {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: _emailTextController.text,
      password: _passwordTextController.text,
    )
        .then((value) {
      FirebaseFirestore.instance.collection('School').doc(_emailTextController.text).set({
        'name': _nameTextController.text,'phone':_phnTextController.text,'username':_userNameTextController.text,
      }).then((_) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Dashboard(),
        ),
      );
    }).catchError((error) {
        // Handle Firestore errors
        print("Firestore Error: $error");
      });
    })
        .catchError((error) {
      // Handle Firebase Authentication errors
      setState(() {
        _errorText = _mapErrorToText(error);
      });
      print("Authentication Error: ${error.toString()}");
    });
  }

  String _mapErrorToText(dynamic error) {
    switch (error.code) {
      case "email-already-in-use":
        return "The email address is already in use by another account.";
      case "invalid-email":
        return "The email address is badly formatted.";
      case "weak-password":
        return "Password should be at least 6 characters.";
      default:
        return "An error occurred. Please try again.";
    }
  }
}
