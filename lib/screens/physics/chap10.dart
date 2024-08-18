import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Chap10 extends StatefulWidget {
  const Chap10({Key? key}) : super(key: key);

  @override
  State<Chap10> createState() => _Chap10State();
}

class _Chap10State extends State<Chap10> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Chapter 10. Light - Reflection and Refraction",
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
                  _launchUrl(Uri.parse('https://drive.google.com/file/d/1lMZB4czkJyjAqesfDfDWX5mX_YIJopjo/view?usp=drive_link'));
                },
                child: const Text('Notes'),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  _launchUrl(Uri.parse('https://drive.google.com/file/d/1wMuhbb1ckunsopEnDPPJ3YjYG0NtOfW7/view?usp=drive_link'));
                },
                child: const Text('Mind Maps'),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  _launchUrl(Uri.parse('https://drive.google.com/file/d/1oj3B4A4eXvM7Et1z4IKBzb8NqahZivt2/view?usp=drive_link'));
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
