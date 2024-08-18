
import 'package:flutter/material.dart';
import '../mainpages/physics.dart';
import 'package:url_launcher/url_launcher.dart';
import 'biology.dart';
import 'chemistry.dart';
import '../screens/dashboard.dart';

class sampledash extends StatefulWidget {
  const sampledash({Key? key});

  @override
  State<sampledash> createState() => _sampledashState();
}

class _sampledashState extends State<sampledash> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 4; // Set the initial index to the Home screen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sample Paper",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.feedback),
            onPressed: () {
              _launchUrl(Uri.parse(
                  'https://docs.google.com/forms/d/e/1FAIpQLSdZNUXsUKhMoSWi-zGitJnJhKIEz9lyUfqWJKgny0cPJ534GQ/viewform?usp=sf_link'));
            },
          ),
        ],
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
              Container(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    _launchUrl("https://cbseacademic.nic.in/web_material/SQP/ClassX_2023_24/Science-SQP.pdf" as Uri);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Sample Paper'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    _launchUrl("https://cbseacademic.nic.in/web_material/SQP/ClassX_2023_24/Science-SQP.pdf" as Uri);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 8),
                      Text('Answer Key'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _navigateToScreen(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.science),
            label: 'Chemistry',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.biotech),
            label: 'Biology',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.electrical_services),
            label: 'Physics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Sample Paper',
          ),
        ],
      ),
    );
  }

  void _navigateToScreen(int index) {
    if (index == 0) { //chemistry
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Chemistry()));
    }
    else if (index == 1) { //biology
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => bio()));
    }
    else if (index == 2) { // home
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    }
    else if (index == 3) { //physics
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => phy()));
    }
  }
}

Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
    throw Exception('Could not launch $url');
  }
}
