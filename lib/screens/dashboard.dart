import 'package:card_swiper/card_swiper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:science_new/main.dart';
import 'package:science_new/profile/profile.dart';
import '../about%20us/about.dart';
import '../mainpages/biology.dart';
import '../mainpages/chemistry.dart';
import '../mainpages/physics.dart';
import '../mainpages/sample_paper.dart';
import 'package:url_launcher/url_launcher.dart';
import '../userlogin/signin.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Assistify",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile(email: email)),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    width: 0.5,
                    height: 1,
                  ),
                  Text(
                    'Assistify',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person_2),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile(email: email)),
                );

              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUs()),
                );

              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.feedback),
              title: Text('Feedback'),
              onTap: (){
                _launchUrl(Uri.parse(
                    'https://docs.google.com/forms/d/e/1FAIpQLSdZNUXsUKhMoSWi-zGitJnJhKIEz9lyUfqWJKgny0cPJ534GQ/viewform?usp=sf_link'));
              },
            )
          ],
        ),
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
                    'assets/SCIENCE/s1.jpg',
                    'assets/SCIENCE/s2.jpg',
                    'assets/SCIENCE/s3.jpg',
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
            SizedBox(height: 30), // Add some space between the Swiper and ElevatedButtons
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chemistry()),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.science), // Replace with the desired icon
                        SizedBox(width: 8), // Add some space between icon and text
                        Text('Chemistry'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => bio()),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.biotech), // Replace with the desired icon
                        SizedBox(width: 8),
                        Text('Biology'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => phy()),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.electrical_services), // Replace with the desired icon
                        SizedBox(width: 8),
                        Text('Physics'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => sampledash()),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.library_books), // Replace with the desired icon
                        SizedBox(width: 8),
                        Text('Sample Paper'),
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
    else if (index == 3) { //physics
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => phy()));
    }
    else if (index == 4) { //physics
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

