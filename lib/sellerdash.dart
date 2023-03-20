import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pgapp/addpg.dart';

final currentUser = FirebaseAuth.instance.currentUser;
final email = currentUser?.email;

class SellerDash extends StatefulWidget {
  static const String id= "selldsh";
  const SellerDash({Key? key}) : super(key: key);

  @override
  _SellerDashState createState() => _SellerDashState();
}

class _SellerDashState extends State<SellerDash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
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

                        'https://img.freepik.com/free-icon/man_318-157609.jpg',
                      ),
                    ),
                    SizedBox(height: 16.0),

                    Text(email!,
                      style: TextStyle(
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
                         // Navigator.pushNamed(context, PgApplicationPage.id);
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
                              Icon(Icons.inbox),
                              SizedBox(height: 16.0),
                              Text(
                                'Details',
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
  }
}