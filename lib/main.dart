import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:science_new/intro_page.dart';
import 'package:science_new/intro_dash.dart';
import 'package:science_new/userlogin/signin.dart';

var email = '';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCgD4z_5SPZkk2AeN8kV_rx1h8aE_sWtv4",
      appId: "1:360583487398:android:0e14bf811b574c83dbb967",
      messagingSenderId: "360583487398",
      projectId: "science-neww",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthChecker(),
    );
  }
}

class AuthChecker extends StatelessWidget {
  const AuthChecker({Key? key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            // Center the CircularProgressIndicator
            child: SizedBox(
              width: 4,
              height: 4,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
          );
        } else if (snapshot.hasData && snapshot.data != null) {
          email = snapshot.data!.email!;
          return FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('School')
                .doc(snapshot.data!.email)
                .get(),
            builder: (context, userSnapshot) {
              if (userSnapshot.connectionState == ConnectionState.waiting) {
                return SplashScreen();
              } else {
                // User data fetched successfully, navigate to Dashboard
                return LoggedSplash();
              }
            },
          );
        } else {
          return SignInScreen();
        }
      },
    );
  }
}
