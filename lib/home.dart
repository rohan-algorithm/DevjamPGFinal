import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pgapp/avl_clg.dart';
import 'package:pgapp/pgl.dart';
import 'package:pgapp/clg.dart';
import 'package:pgapp/search.dart';
import 'package:pgapp/sellerdash.dart';
import 'package:pgapp/utils/addclg.dart';
import 'package:pgapp/utils/favclg.dart';
import 'package:pgapp/utils/test.dart';
import 'arguments/FormData.dart';
import 'clg.dart';


final currentUser = FirebaseAuth.instance.currentUser;
final email = currentUser?.email;


final FirebaseFirestore _db = FirebaseFirestore.instance;

Future<DocumentSnapshot<Map<String, dynamic>>> getUserInfo(String userId) async {
  DocumentSnapshot<Map<String, dynamic>> userInfo = await _db.collection('users').doc(userId).get();
  return userInfo;
}

class HomeScn extends StatefulWidget {
  static const String id = "home";
  const HomeScn({Key? key}) : super(key: key);

  @override
  State<HomeScn> createState() => _HomeScnState();
}

class _HomeScnState extends State<HomeScn> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.deepPurple[700],
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
            child: GNav(

              gap:4 ,
              color: Colors.deepPurple,
             tabBackgroundColor: Colors.deepPurple.shade400,
              backgroundColor: Colors.white,
              activeColor: Colors.black,
              tabs: [
                GButton(
                  icon: Icons.home,
                   text: 'Home',
              ),
              GButton(icon: Icons.search,
                onPressed: (){
                   Navigator.pushNamed(context, SearchPage.id);
                },
                text: 'Blog',),
                GButton(icon: Icons.favorite_border,
                  text: 'Favorite',),
              GButton(icon: Icons.settings,
                onPressed: (){
                  MaterialPageRoute(
                    builder: (BuildContext context) => UserScreen(userId: 'admin@email.com')
                  );
                },
                text: 'Account',),
            ],

            ),
          ),
        ),
      body: SafeArea(

        child:  Column(
            children: [
              Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // User info idhar
                            Text(email!,style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),),
                            SizedBox(height: 8,),
                            Text(DateTime.now().toString(),style: TextStyle(color: Colors.white70) ,),
                          ],
                        ),

                        Container(
                          decoration: BoxDecoration(
                            color: Colors.deepPurpleAccent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(12),
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white,

                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 25,),
                    TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, SearchPage.id);
                      },
                      child: Container(
                        decoration: BoxDecoration(color: Colors.deepPurple[500],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            SizedBox(width: 7,),
                            Text(
                              'Search',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Trending Searches!',style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                    SizedBox(height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        favclg(name: 'MNNIT',logo:'https://firebasestorage.googleapis.com/v0/b/nagapradeshdevjam.appspot.com/o/mnnit.png?alt=media&token=3193a5ad-9a1a-485c-848a-fb65624bd84f'),
                        favclg(name: 'IIT Guwahati',logo:'https://upload.wikimedia.org/wikipedia/en/thumb/1/12/IIT_Guwahati_Logo.svg/1200px-IIT_Guwahati_Logo.svg.png'),
                        favclg(name: 'IIT Madras',logo:'https://upload.wikimedia.org/wikipedia/en/thumb/6/69/IIT_Madras_Logo.svg/1200px-IIT_Madras_Logo.svg.png'),
                      ],
                    ),


                  ],
                ),
              ),
              SizedBox(height: 10,),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 1),
                  color: Colors.grey[200],
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Padding(
                              padding: EdgeInsets.only(left: 10,top: 10,),
                              child: Text('Collages',style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                            MaterialButton(
                              onPressed: (){
                                Navigator.pushNamed(context, AddClg.id);
                              },
                                child: Icon(Icons.add)),
                          ],
                        ),
                        SizedBox(height: 12,),
                        // list of collage
                        ClgStream(),

                      ],
                    ),
                  ),
                ),
              )
          ],

        ),
      ),

    );
  }
}


class ClgStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('collagelist').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final List<DocumentSnapshot> documents = snapshot.data!.docs;

        return Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            itemCount: documents.length,
            itemBuilder: (BuildContext context, int index) {
              final DocumentSnapshot document = documents[index];

              return TextButton(
                onPressed: (){

                  _showStudentsData(context, document.reference,);
                },
                style: TextButton.styleFrom(
                  shadowColor: Colors.deepPurpleAccent,
                  foregroundColor: Colors.black,
                  textStyle: TextStyle(color:
                  Colors.black,),
                ),

                child:  Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration (
                    color: Colors.white,
                    borderRadius: BorderRadius. circular (16),
                  ),
                  child: Row(
                    children: [

                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                            padding: EdgeInsets.all(10),
                            color: Colors.grey[300],
                            child: Image.network(document['logo'], width: 40,height: 40,)),
                      ),
                      SizedBox(width: 12,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(document['name'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          SizedBox(height: 5,),
                          Text(document['city'],style: TextStyle(fontSize: 14),),
                        ],

                      )
                    ],
                  ),
                  //onTap: () => _showStudentsData(context, document.reference),
                ),
              );

              //   ListTile(
              //   title: Text(document['name']),
              //   subtitle: Text(document['city']),
              //
              //
              // );
            },
          ),
        );
      },
    );


  }
}

void _showStudentsData(BuildContext context, DocumentReference clglistRef) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => Clg(clglistRef: clglistRef),
    ),
  );
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

    return TextButton(
      onPressed: (){

        Navigator.pushNamed(context, Clg.id,);
      },
      style: TextButton.styleFrom(
         shadowColor: Colors.deepPurpleAccent,
         foregroundColor: Colors.black,
          textStyle: TextStyle(color:
          Colors.black,),
      ),

      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration (
          color: Colors.white,
          borderRadius: BorderRadius. circular (16),
      ),
        child: Row(
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: EdgeInsets.all(10),
                  color: Colors.grey[300],
                  child: Image.network(logo, width: 40,height: 40,)),
            ),
            SizedBox(width: 12,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text(city,style: TextStyle(fontSize: 14),),
              ],

            )
          ],
        ),
      ),
    );

  }
}

