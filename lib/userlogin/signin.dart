import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:science_new/userlogin/signup.dart';
import '../../utils/color_utils.dart';
import '../screens/dashboard.dart';
import 'reset_password.dart';
import '../../reusable_widgets/reusable_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  bool _isPasswordVisible = false;
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: SizedBox(
                width: 460,
                child: Column(
                  children: <Widget>[
                    reusableTextField(
                      "Enter Email",
                      Icons.person_outline,
                      false,
                      _emailTextController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        reusableTextField(
                          "Enter Password",
                          Icons.lock_outline,
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
                    // Error Message Widget
                    if (_errorMessage.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _errorMessage,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    const SizedBox(
                      height: 8,
                    ),
                    Forgetpass(context),
                    FirebaseButton(context, 'Login', () {
                      String email = _emailTextController.text.trim();
                      String password = _passwordTextController.text.trim();

                      // Check if email and password are not empty
                      if (email.isEmpty || password.isEmpty) {
                        setState(() {
                          _errorMessage = 'Please fill all fields';
                        });
                        return;
                      }

                      // Check if email is in a valid format
                      if (!isValidEmail(email)) {
                        setState(() {
                          _errorMessage = 'Invalid email format';
                        });
                        return;
                      }

                      // Perform Firebase authentication
                      FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      ).then((value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Dashboard(),
                          ),
                        );
                      }).onError((error, stackTrace) {
                        // Update error message based on the specific error returned by Firebase
                        setState(() {
                          if (error is FirebaseAuthException) {
                            if (error.code == 'user-not-found') {
                              _errorMessage = 'Wrong email entered';
                            } else if (error.code == 'wrong-password') {
                              _errorMessage = 'Wrong password entered';
                            } else {
                              _errorMessage = 'Authentication failed';
                            }
                          }
                        });
                      });
                    }),
                    signUpOption(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Row signUpOption(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("Don't Have an account?",
          style: TextStyle(color: Colors.white70)),
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignUpScreen(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        child: Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}


Widget Forgetpass(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 35,
    alignment: Alignment.bottomRight,
    child: TextButton(
      child: const Text(
        "Forgot Password?",
        style: TextStyle(color: Colors.white70),
        textAlign: TextAlign.right,
      ),
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => ResetPassword())),
    ),
  );
}

bool isValidEmail(String email) {
  // Use a regular expression to check if the email is in a valid format
  String emailRegex = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
  RegExp regex = RegExp(emailRegex);
  return regex.hasMatch(email);
}
