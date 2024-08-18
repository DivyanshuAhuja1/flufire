import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Chap2 extends StatefulWidget {
  const Chap2({super.key});

  @override
  State<Chap2> createState() => _Chap2State();
}

class _Chap2State extends State<Chap2> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Chapter 2. Acids, Bases and Salts",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/newbck.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _launchUrl(Uri.parse('https://drive.google.com/file/d/1ir6BnX_QD4ttbNz376Hr1gR7Q1HmaCKX/view?usp=drive_link'));
                },
                child: const Text('Notes'),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  _launchUrl(Uri.parse('https://drive.google.com/file/d/1IfcCT4hJUeP5QutWmk2CTlquK7hWBSxM/view?usp=drive_link'));
                },
                child: const Text('Mind Maps'),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  _launchUrl(Uri.parse('https://drive.google.com/file/d/12Txo6OkaU1fbKZO65CvYrNpHeGsDOKiC/view?usp=drive_link'));
                },
                child: const Text('Ncert Solutions'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }
}