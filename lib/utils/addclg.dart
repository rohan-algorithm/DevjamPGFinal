import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


final firestore = FirebaseFirestore.instance.collection('collagelist');


class AddClg extends StatefulWidget {
  static const String id= "addclg";
  const AddClg({Key? key}) : super(key: key);

  @override
  State<AddClg> createState() => _AddClgState();
}

class _AddClgState extends State<AddClg> {
  final _name = TextEditingController();
  final _city = TextEditingController();
  final _address = TextEditingController();
  final _img = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Your Collage'),),
      body: Column(
        children: [
          TextField(
            controller: _name,
            decoration: InputDecoration(
              hintText: 'Collage Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 5,),
          TextField(
            controller: _city,
            decoration: InputDecoration(
              hintText: 'City',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 5,),
          TextField(
            controller: _address,
            decoration: InputDecoration(
              hintText: 'Address',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 5,),
          TextField(
            controller: _img,
            decoration: InputDecoration(
              hintText: 'Logo Link',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 5,),
          MaterialButton(onPressed: (){
            String id = _name.text.toString();
            firestore.doc(id).set({
              'name' :_name.text.toString(),
              'city' :_city.text.toString(),
              'address' :_address.text.toString(),
              'logo' :_img.text.toString(),
               'id' : id,
            }).then((value){
              Navigator.pop(context);
            }).onError((error, stackTrace){
              //Utils().
            });

          },
           child: Text('Submit'),
          )
        ],
      ),
    );
  }
}

