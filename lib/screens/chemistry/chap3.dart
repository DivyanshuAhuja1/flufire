import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Chap3 extends StatefulWidget {
  const Chap3({super.key});

  @override
  State<Chap3> createState() => _Chap3State();
}

class _Chap3State extends State<Chap3> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Chapter 3. Metals And Non-metals",
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
                  _launchUrl(Uri.parse('https://drive.google.com/file/d/1Zuv5u9UjmEVTjp-IIwBGoPI2hqfU3bGQ/view?usp=drive_link'));
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
                  _launchUrl(Uri.parse('https://drive.google.com/file/d/1gOHtBZTye1eVaVuz67R6bwb60Ca_B3nq/view?usp=drive_link'));
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