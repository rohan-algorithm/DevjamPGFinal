import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'clg.dart';

class Item {
  final String name;
  final String logo;
  final String city;

  Item({required this.name, required this.logo, required this.city});
}

class SearchPage extends StatefulWidget {
  static const String id = "search";
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final TextEditingController _searchController;
  late final Stream<QuerySnapshot> _stream;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _stream = FirebaseFirestore.instance.collection('collagelist').snapshots();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: TextField(
          cursorColor: Colors.white,
          style:TextStyle(
            color: Colors.white,

          ),
          controller: _searchController,
          decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 16.0, color: Colors.white70),
            hintText: 'Search by Collage Name',
          ),
          onChanged: (query) {
            setState(() {});
          },
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final List<Item> items = snapshot.data!.docs
              .map((doc) => Item(
            name: doc['name'] as String,
            logo: doc['logo'] as String,
            city: doc['city'] as String,

            //quantity: doc['quantity'] as int,
          ))
              .toList();

          final filteredItems = items
              .where((item) => item.name
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
              .toList();
          final List<DocumentSnapshot> documents = snapshot.data!.docs;

          return ListView.builder(
            itemCount: filteredItems.length,
            itemBuilder: (context, index) {
              final item = filteredItems[index];
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
                            child: Image.network(item.logo, width: 40,height: 40,)),
                      ),
                      SizedBox(width: 12,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(item.name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          SizedBox(height: 5,),
                          Text(item.city,style: TextStyle(fontSize: 14),),
                        ],

                      )
                    ],
                  ),
                //  onTap: () => _showStudentsData(context, document.reference),
                ),
              );
              //   ListTile(
              //   title: Text(item.name),
              //  // subtitle: Text('Quantity: ${item.quantity}'),
              // );
            },
          );
        },
      ),
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