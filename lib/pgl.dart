import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pgapp/avl_clg.dart';
import 'package:pgapp/utils/addclg.dart';
import 'package:pgapp/utils/favclg.dart';
import 'arguments/FormData.dart';
import 'clg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pgapp/viewpg.dart';
import 'package:getwidget/getwidget.dart';

import 'arguments/FormData.dart';

final _firestore = FirebaseFirestore.instance;

class PGList extends StatefulWidget {
  static const String id= "pgslist";
  const PGList({Key? key}) : super(key: key);

  @override
  State<PGList> createState() => _PGListState();
}

class _PGListState extends State<PGList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ClgStream(),
    );
  }
}




class ClgStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var formData = ModalRoute.of(context)!.settings.arguments as FormData;
    String MyClg = '/collagelist/IIT Delhi/PGs/';
    return StreamBuilder<QuerySnapshot>(

      stream: _firestore.collection(MyClg).snapshots(),
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
          final pgname = clg['name'];
          final discription = clg['description'];
          final city = clg['city'];
          final images = clg['images'];
          final address = clg['address'];
          final cover = clg['cover'];
          final price = clg['price'];
          final gender = clg['gender'];
          final phone = clg['phone'];
          final owner = clg['owner'];



          //final currentUser = loggedInUser.email;

          final abtclg = Collage(
            name: pgname,
            discription: discription,
            city: city,
            logo: images,
            address: address,
            cover: cover,
            phone: phone,
            gender: gender,
            price: price,
            owner: owner,
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
  Collage({required this.name, required this.discription ,required this.city,required this.logo, required this.address , required this.cover , required this.gender ,required this.phone ,required this.owner ,required this.price ,});
  final String name;
  final String city;
  final String discription;
  final String logo;
  final String price;
  final String owner;
  final String phone;
  final String cover;
  final String gender;
  final String address;
  //final bool isMe;

  @override
  Widget build(BuildContext context) {

    return Text(name);
    //   MaterialButton(
    //   child: GFCard(
    //     boxFit: BoxFit.cover,
    //     color: Colors.white,
    //     // borderRadius: BorderRadius.all(Radius.circular(33.0)),
    //     elevation: 22,
    //
    //     titlePosition: GFPosition.start,
    //     //image: Image.network(cover),
    //     //showImage: true,
    //
    //     content: Text(discription,style: TextStyle(fontSize: 16), ),
    //     buttonBar: GFButtonBar(
    //       children: <Widget>[
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Text('⭐️⭐️⭐️⭐️⭐️'),
    //
    //             Text(price,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
    //
    //           ],
    //         )
    //
    //
    //         // GFButton(
    //         //   color: Colors.deepPurple.shade200,
    //         //   onPressed: () {},
    //         //   size: 45,
    //         //   text: 'Have a look!',
    //         // ),
    //       ],
    //     ),
    //   ),
    //   onPressed: (){
    //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewPG()));
    //   },
    // );



  }
}