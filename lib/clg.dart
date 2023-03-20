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

//
//
// class Clg extends StatelessWidget {
//   static const String id= "clg";
//    const Clg({Key? key}) : super(key: key);
//
//   Widget safeZone(context) {
//     return SafeArea(
//       child: Column(
//
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 0.2,vertical: 0.2),
//               child:
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var formData = ModalRoute.of(context)!.settings.arguments as FormData;
//
//     // void initState()async {
//     //   final myclg = FirebaseFirestore.instance
//     //       .collection('users');
//     //   myclg.snapshots().listen((snapshot) {
//     //     final clgaddress = myclg['address'];
//     //
//     //   });
//     //   super.initState();
//     // }
//
//     return MaterialApp(
//       home: Scaffold(
//           backgroundColor: Colors.grey[300],
//           body: CustomScrollView(
//             slivers: [
//               SliverAppBar(
//                 toolbarHeight: 80,
//                 title: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: const [
//                     Icon(
//                       Icons.clear,
//                       color: Colors.white,
//                     ),
//                     Icon(
//                       Icons.book_outlined,
//                       color: Colors.white,
//                     )
//                   ],
//                 ),
//                 bottom: PreferredSize(
//                   preferredSize: Size.fromHeight(0),
//                   child: Container(
//                     decoration:  BoxDecoration(
//                       color: Colors.deepPurple[500],
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(20),
//                         topRight: Radius.circular(20),
//                       ),
//                     ),
//                     child:  Center(
//                       child: Text(formData.name,
//
//                         style: TextStyle(
//                           color: Colors.white,
//
//                           fontSize: 30,
//                           letterSpacing: 2.5,
//                           fontWeight: FontWeight.w800,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 pinned: true,
//                 backgroundColor: Colors.deepPurple[300],
//                 // expandedHeight: 200,
//                 // flexibleSpace: FlexibleSpaceBar(
//                 //   // collapseMode: CollapseMode.parallax,
//                 //   background: Image.asset(
//                 //     'assets/images/mnnit.jpeg',
//                 //     width: double.maxFinite,
//                 //     fit: BoxFit.cover,
//                 //   ),
//                 // ),
//               ),
//               SliverToBoxAdapter(
//                 child: safeZone(context),
//               )
//             ],
//           )),
//     );
//
//   }
// }
//
//
//
//
// class ClgStream extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//
//     var formData = ModalRoute.of(context)!.settings.arguments as FormData;
//     String MyClg = 'collagelist' + formData.name;
//     return StreamBuilder<QuerySnapshot>(
//
//       stream: _firestore.collection(MyClg).snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return const Center(
//             child: CircularProgressIndicator(
//               backgroundColor: Colors.deepPurple,
//             ),
//           );
//         }
//         final clgList = snapshot.data!.docs;
//         List<Collage> allclg = [];
//         for (var clg in clgList) {
//           final pgname = clg['name'];
//           final discription = clg['discription'];
//           final city = clg['city'];
//           final images = clg['images'];
//           final address = clg['address'];
//           final cover = clg['cover'];
//           final price = clg['price'];
//           final gender = clg['gender'];
//           final phone = clg['phone'];
//           final owner = clg['owner'];
//
//
//
//           //final currentUser = loggedInUser.email;
//
//           final abtclg = Collage(
//             name: pgname,
//             discription: discription,
//             city: city,
//             logo: images,
//             address: address,
//             cover: cover,
//             phone: phone,
//             gender: gender,
//             price: price,
//             owner: owner,
//             //isMe: currentUser == messageSender,
//           );
//           allclg.add(abtclg);
//         }
//         return Expanded(
//           child: ListView(
//             reverse: true,
//             padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
//             children: allclg,
//           ),
//         );
//       },
//     );
//   }
// }
//
//
// class Collage extends StatelessWidget {
//   Collage({required this.name, required this.discription ,required this.city,required this.logo, required this.address , required this.cover , required this.gender ,required this.phone ,required this.owner ,required this.price ,});
//   final String name;
//   final String city;
//   final String discription;
//   final String logo;
//   final String price;
//   final String owner;
//   final String phone;
//   final String cover;
//   final String gender;
//   final String address;
//   //final bool isMe;
//
//   @override
//   Widget build(BuildContext context) {
//
//     return MaterialButton(
//       child: GFCard(
//         boxFit: BoxFit.cover,
//         color: Colors.white,
//         // borderRadius: BorderRadius.all(Radius.circular(33.0)),
//         elevation: 22,
//
//         titlePosition: GFPosition.start,
//         image: Image.network(logo),
//         showImage: true,
//
//         content: Text(discription,style: TextStyle(fontSize: 16), ),
//         buttonBar: GFButtonBar(
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('⭐️⭐️⭐️⭐️⭐️'),
//
//                 Text('₹12000',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
//
//               ],
//             )
//
//
//             // GFButton(
//             //   color: Colors.deepPurple.shade200,
//             //   onPressed: () {},
//             //   size: 45,
//             //   text: 'Have a look!',
//             // ),
//           ],
//         ),
//       ),
//       onPressed: (){
//         Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewPG()));
//       },
//     );
//
//   }
// }



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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Text(document['name'],style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold) ,textAlign: TextAlign.start, ),
                    //Text(document['description'],style: TextStyle(fontSize: 12, )),
                        if(document['gender']==true)
                          Icon(Icons.male)
                        else if(document['gender']==false)
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
