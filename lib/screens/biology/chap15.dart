import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Chap15 extends StatefulWidget {
  const Chap15({super.key});

  @override
  State<Chap15> createState() => _Chap15State();
}

class _Chap15State extends State<Chap15> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Chapter 15. Our Environment",
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
                  _launchUrl(Uri.parse('https://drive.google.com/file/d/1el5XHgGuHhS6uKPJ6kvKXZTeoIZnVAD6/view?usp=drive_link'));
                },
                child: const Text('Notes'),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  _launchUrl(Uri.parse('https://drive.google.com/file/d/1RwRnzHulKKq3Eon6LJ3zSfRV5CALRzu1/view?usp=drive_link'));
                },
                child: const Text('Mind Maps'),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  _launchUrl(Uri.parse('https://drive.google.com/file/d/1s85ZMLsj5nwWUGDfJ9ss1sXBGm7AZ8VF/view?usp=drive_link'));
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