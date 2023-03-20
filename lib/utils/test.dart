import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final FirebaseFirestore _db = FirebaseFirestore.instance;

Future<DocumentSnapshot<Map<String, dynamic>>> getUserInfo(String userId) async {
  DocumentSnapshot<Map<String, dynamic>> userInfo = await _db.collection('users').doc(userId).get();
  return userInfo;
}


class UserScreen extends StatelessWidget {
  static const String id="tesdt";
  final String userId;

  const UserScreen({required this.userId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      future: getUserInfo(userId),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          final userData = snapshot.data!.data()!;
          return Scaffold(
            appBar: AppBar(
              title: Text('Dashboard'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // User information section
                    Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50.0,
                            backgroundImage: NetworkImage(
                              'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50',
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Text(userData['name'],
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(userData['email'], style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    // Navigation section
                    Expanded(
                      child: GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16.0,
                          crossAxisSpacing: 16.0,
                          children: [
                            InkWell(
                              onTap: () {
                                // Navigate to orders screen
                                //Navigator.pushNamed(context, PG.id);
                              },
                              child: Container(
                                padding: EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.shopping_cart),
                                    SizedBox(height: 16.0),
                                    Text(
                                      'Orders',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                // Navigate to settings screen
                                Navigator.pushNamed(context, '/settings');
                              },
                              child: Container(
                                padding: EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.settings),
                                      SizedBox(height: 16.0),
                                      Text(''),
                                    ]),),
                            ),
                          ]),),
                  ]),),);
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}


//Text('Name: ${userData['name']}'),