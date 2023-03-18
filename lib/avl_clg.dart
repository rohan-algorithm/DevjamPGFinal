import 'package:flutter/material.dart';
import 'clg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getwidget/getwidget.dart';
final _firestore = FirebaseFirestore.instance;

class AvlClg extends StatefulWidget {
  static const String id = "avlclg";
  const AvlClg({Key? key}) : super(key: key);

  @override
  State<AvlClg> createState() => _AvlClgState();
}

class _AvlClgState extends State<AvlClg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                // try {
                //   _auth.signOut();
                //   Navigator.pop(context);
                // } catch (e) {
                //   print(e);
                // }
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClgStream(),

          ],
        ),
      ),
    );
  }
}


class AvlClg extends StatelessWidget {
  static const String id = "avlclg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('assets/profile.jpeg'),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.deepPurple
                  ),
                  accountName:  Text('Rohan Rao'),
                  accountEmail:  Text('xyz@gmail.com')
              ),
              ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
              ),
              ListTile(
                title: Text("Next Screen"),
                leading: Icon(Icons.accessibility_new),

              ),
              ListTile(
                title: Text("Log Out"),
                leading: Icon(Icons.logout),

              ),
            ],
          ),
        ),
        appBar: AppBar(
          toolbarHeight: 100.0,
          // leading: Drawer(

          // ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(16),
                bottomLeft: Radius.circular(16)),
          ),
          title: Center(
              child: Text('AVAILABLE PG\'s AT')),
          shadowColor: Colors.deepPurple.shade700,
          backgroundColor: Colors.deepPurple.shade700,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.bookmark_added_rounded),
              tooltip: 'Your bookmarked PG\'s',
              onPressed: () {
                // handle the press
              },
            ),
          ],

        ),
        backgroundColor: Colors.grey.shade300,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.0,vertical: 10.0),
            child: PgPage(),

          ),

        ),
      );

  }
}

class PgPage extends StatefulWidget {
  @override
  _PgPageState createState() => _PgPageState();
}

class _PgPageState extends State<PgPage> {

  Container viewList( String collegeName, int id){
    return Container(
      height: 100.0,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all( Radius.circular(12.0)),
        ),
        child: TextButton(

          child: ListTile(

            leading: CircleAvatar(
              backgroundColor: Colors.deepPurple.shade700,
              child: Icon(
                Icons.night_shelter,
                color: Colors.white,
              ),
            ),
            title: Text(
              collegeName,
            ),
          ),
          onPressed: (){
            // Navigator.pushNamed(
            //     context,
            _navigateToNextScreen(context);
            // ),

            //
          },

        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          elevation: 10.0,

          toolbarHeight: 100.0,

          shape: const RoundedRectangleBorder(

            borderRadius: BorderRadius.all( Radius.circular(16.0)),
          ),
          backgroundColor: Colors.deepPurple.shade700,
          title: Container(
            width: double.infinity,
            height: 40,

            color: Colors.white,
            child: const Center(
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search college',

                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.camera_alt)),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Column(
                children: <Widget>[
                  ClgStream(),

                ],
              ),

            ],
          ),
        ),
      ],

    );

  }
}

void _navigateToNextScreen(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Clg()));
}




class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        backgroundColor: Colors.deepPurple.shade700,
        title: const Text('New Screen'),
      ),
      body: const Center(
        child: Text(
          'This is a new screen',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

class ClgStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('collagelist').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.deepPurple,
            ),
          );
        }
        final clgList = snapshot.data!.docs;
        List<Collage> allclg = [];
        for (var clg in clgList) {
          final clgname = clg['name'];
          final clgaddress = clg['address'];
          final clglogo = clg['logo'];
          final clgcity = clg['city'];


          //final currentUser = loggedInUser.email;

          final abtclg = Collage(
            name: clgname,
            address: clgaddress,
            city: clgcity,
            logo: clglogo,
            //isMe: currentUser == messageSender,
          );
          allclg.add(abtclg);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: allclg,
          ),
        );
      },
    );
  }
}


class Collage extends StatelessWidget {
  Collage({required this.name, required this.address ,required this.city,required this.logo});
  final String name;
  final String address;
  final String city;
  final String logo;
  //final bool isMe;

  @override
  Widget build(BuildContext context) {

    return Padding(

      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 50),
      child: ListTile(
        title: Text(name),
        subtitle: Text(city),
        leading: Image.network('https://firebasestorage.googleapis.com/v0/b/nagapradeshdevjam.appspot.com/o/mnnit.png?alt=media&token=861057ca-9939-4cdf-a7a5-6b6959aeb7c7', fit: BoxFit.cover,),
        hoverColor: Colors.deepPurple,
      )
      );

  }
}