import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../mainpages/biology.dart';
import '../screens/chemistry/chap1.dart';
import '../screens/chemistry/chap2.dart';
import '../screens/chemistry/chap3.dart';
import '../screens/chemistry/chap4.dart';
import '../screens/dashboard.dart';
import '../mainpages/physics.dart';
import '../mainpages/sample_paper.dart';
import 'package:url_launcher/url_launcher.dart';


class Chemistry extends StatefulWidget {
  const Chemistry({Key? key});

  @override
  State<Chemistry> createState() => _ChemistryState();
}

class _ChemistryState extends State<Chemistry> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0; // Set the initial index to the Home screen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Chemistry",
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
        child: ListView(
          children: <Widget>[
            Container(
              height: 179,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  List<String> image_path = [
                    'assets/CHEM/ch1.jpg',
                    'assets/CHEM/ch2.jpg',
                    'assets/CHEM/ch3.jpg',
                  ];
                  return Card(
                    elevation: 4.0,
                    margin: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Image.asset(image_path[index]),
                    ),
                  );
                },
                itemCount: 3,
                viewportFraction: 0.8,
                scale: 0.9,
              ),
            ),
            SizedBox(height: 16), // Add some space between the Swiper and ElevatedButtons
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chap1()),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Chapter-1'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chap2()),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Chapter-2'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chap3()),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Chapter-3'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chap4()),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Chapter-4'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),


      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 13,
        unselectedFontSize: 11,

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
    if (index == 1) { //biology
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
    else if (index == 4) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => sampledash()));
    }
  }
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Dashboard(),
        )
    );
  }
}

