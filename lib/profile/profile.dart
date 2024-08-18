import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
String name12 = '';

class Profile extends StatelessWidget {
  const Profile({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance
              .collection('School')
              .doc(email)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData && snapshot.data != null && snapshot.data!.exists) {
              var data = snapshot.data!.data() as Map<String, dynamic>;
              name12 = data['name'];
              return ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
                      _buildFormField("Name", data['name'] ?? ''),
                      _buildFormField("Username", data['username'] ?? ''),
                      _buildFormField("Email", email),
                      _buildFormField("Phone", data['phone'] ?? ''),
                    ],
                  ),
                ],
              );
            } else {
              return Center(
                child: Text('No data available'),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildFormField(String heading, String initialValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: TextFormField(
                readOnly: true,
                initialValue: initialValue,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            Positioned(
              left: 5,
              top: -12,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                color: Colors.white,
                child: Text(
                  heading,
                  style: TextStyle(
                    backgroundColor: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
