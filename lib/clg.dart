import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pgapp/viewpg.dart';
import 'package:getwidget/getwidget.dart';
import 'arguments/FormData.dart';
late String Name;
late String Address;
late String Phone;
late String Description;
late String Image1;
late String Image2;
late String Image3;
late String Profilepic;
late String Price;
late String Gender;



class Clg extends StatelessWidget {
  static const String id = "clg";
  final DocumentReference clglistRef;

  const Clg({Key? key, required this.clglistRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);

          },
            child: Icon(Icons.clear,color: Colors.white,)),
        title: Center(child: const Text('PG Near ')),
        actions: const [
          Padding(
            padding: EdgeInsets.all(15),
              child: Icon(Icons.favorite)),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: clglistRef.collection('pglist').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final List<DocumentSnapshot> documents = snapshot.data!.docs;

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (BuildContext context, int index) {
              final DocumentSnapshot document = documents[index];
              Name = document['name'];
              Address = document['address'];
              Phone = document['phone'];
              Price = document['price'];
              Description = document['Description'];
              Image1 = document['image1'];
              Image2 = document['image2'];
              Image3 = document['image3'];
              Gender = document['gender'];
              Profilepic = document['profilepic'];
            //  Name = document['name'];

              return MaterialButton(


                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(22.0))),
                child: GFCard(
                  boxFit: BoxFit.cover,
                  color: Colors.white,
                  // borderRadius: BorderRadius.all(Radius.circular(33.0)),
                  elevation: 18,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),

                  titlePosition: GFPosition.start,
                  image: Image.network(document['cover']),
                  showImage: true,

                  content:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                    Text(document['name'],style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold) ,textAlign: TextAlign.start, ),
                    //Text(document['description'],style: TextStyle(fontSize: 12, )),

                        Text(Gender,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        if(document['gender']=='Male')
                          Icon(Icons.male)
                        else if(document['gender']=='Female')
                          Icon(Icons.female,)


                  ]),


                  buttonBar: GFButtonBar(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('⭐️⭐️⭐️⭐️⭐️'),

                          Text('₹ '+document['price'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)

                        ],
                      )


                      // GFButton(
                      //   color: Colors.deepPurple.shade200,
                      //   onPressed: () {},
                      //   size: 45,
                      //   text: 'Have a look!',
                      // ),
                    ],

                  ),
                ),
                onPressed: (){
                  Name = document['name'];
                  Address = document['address'];
                  Phone = document['phone'];
                  Price = document['price'];
                  Description = document['Description'];
                  Image1 = document['image1'];
                  Image2 = document['image2'];
                  Image3 = document['image3'];
                  Gender = document['gender'];
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewPG()));
                },
              );
              //   ListTile(
              //   title: Text(document['name']),
              //   subtitle: Text(document['city']),
              // );
            },
          );
        },
      ),
    );
  }
}
