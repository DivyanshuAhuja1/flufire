import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Chap4 extends StatefulWidget {
  const Chap4({Key? key}) : super(key: key);

  @override
  State<Chap4> createState() => _Chap4State();
}

class _Chap4State extends State<Chap4> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Chapter 4. Carbon And Its Compounds",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
                  _launchUrl(Uri.parse('https://drive.google.com/file/d/1WYAMjcgE8BMAFBGqkYQD_lfeall2OEAN/view?usp=drive_link'));
                },
                child: const Text('Notes'),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  _launchUrl(Uri.parse('https://drive.google.com/file/d/1la_aTQjIHOO274ysnTUqCzyclwkZTPaD/view?usp=drive_link'));
                },
                child: const Text('Mind Maps'),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  _launchUrl(Uri.parse('https://drive.google.com/file/d/1uUnzZRJJj8iseesynS1SUyuAWRUAkd6e/view?usp=drive_link'));
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
