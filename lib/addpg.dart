import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final firestore = FirebaseFirestore.instance.collection('collagelist/IIT Delhi/pglist');

class PgApplicationPage extends StatefulWidget {
  static const String id="adddpgg";
  @override
  _PgApplicationPageState createState() => _PgApplicationPageState();
}

class _PgApplicationPageState extends State<PgApplicationPage> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _address = TextEditingController();
  final _profile = TextEditingController();
  String _price = '0';

  final _phoneNumber = TextEditingController();
  String _gender = "Male";
  final _owner = TextEditingController();
  final _image1 = TextEditingController();
  final _image2 = TextEditingController();
  final _image3 = TextEditingController();
  final _cover= TextEditingController();
 // final _coverImage = TextEditingController();
  final _description = TextEditingController();
  //final _coverImage = TextEditingController();
  //
  //
  // String _name = '';
  // String _address = '';
  // double _price = 0.0;
  // String _phoneNumber = '';
  // String _gender = '';
  // String _description = '';
  File? _profileImage;
  File? _coverImage;
  List<File> _selectedImages = [];
  final picker = ImagePicker();

  Future getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        if (_profileImage == null) {
          _profileImage = File(pickedFile.path);
        } else if (_coverImage == null) {
          _coverImage = File(pickedFile.path);
        } else if (_selectedImages.length < 3) {
          _selectedImages.add(File(pickedFile.path));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    //  theme: ThemeData(colorScheme: Colors.deepPurple),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Center(child: const Text('Enter PG Details')),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    controller: _name,
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name.';
                      }
                      return null;
                    },

                  ),
                  TextFormField(

                    decoration: InputDecoration(
                      labelText: 'Owner',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the valid owner name.';
                      }
                      return null;
                    },
                    controller: _owner,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Address',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address.';
                      };
                      return null;
                    },
                    controller: _address,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Price',
                    ),
                    keyboardType: TextInputType.number,
                    //controller: _price,
                    onChanged: (value){
                      _price=value;
                    }
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number.';
                      }
                      return null;
                    },
                    controller: _phoneNumber,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Description',
                    ),
                    maxLines: null,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a description.';
                      }
                      return null;
                    },
                    controller: _description,
                  ),
                  TextField(
                    controller: _image1,
                    decoration: InputDecoration(
                      hintText: 'Image 1',
                     // border: OutlineInputBorder(),
                    ),
                  ),
                  TextField(
                    controller: _image2,
                    decoration: InputDecoration(
                      hintText: 'Image 2',
                      //border: OutlineInputBorder(),
                    ),
                  ),
                  TextField(
                    controller: _image3,
                    decoration: InputDecoration(
                      hintText: 'Image 3',
                      //border: OutlineInputBorder(),
                    ),
                  ),
                  TextField(
                    controller: _profile,
                    decoration: InputDecoration(
                      hintText: 'Prifile pic',
                      //border: OutlineInputBorder(),
                    ),
                  ),
                  TextField(
                    controller: _cover,
                    decoration: InputDecoration(
                      hintText: 'cover',
                     // border: OutlineInputBorder(),
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gender',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Male',
                            groupValue: _gender,
                            onChanged: (value) {
                              setState(() {
                                _gender = value!;
                              });
                            },
                          ),
                          Text('Male'),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Female',
                            groupValue: _gender,
                            onChanged: (value) {
                              setState(() {
                                _gender = value!;
                              });
                            },
                          ),
                          Text('Female'),
                        ],
                      ),


                      SizedBox(height: 16.0),
                      GestureDetector(
                        onTap: () {
                          getImage(ImageSource.gallery);
                        },
                        child: _profileImage == null ? Container(
                          height: 200.0,
                          color: Colors.grey[200],
                          child: Center(
                            child: Icon(
                              Icons.camera_alt,
                              size: 64.0,
                            ),
                          ),
                        )
                            : Image.file(
                          _profileImage!,
                          height: 200.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      GestureDetector(
                        onTap: () {
                          getImage(ImageSource.gallery);
                        },
                        child: _coverImage == null ? Container(
                          height: 200.0,
                          color: Colors.grey[200],
                          child: Center(
                            child: Icon(
                              Icons.camera_alt,
                              size: 64.0,
                            ),
                          ),
                        )
                            : Image.file(
                          _coverImage!,
                          height: 200.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Selected Images',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        children: List.generate(
                          _selectedImages.length,
                              (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedImages.removeAt(index);
                              });
                            },
                            child: Image.file(
                              _selectedImages[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Center(
                        child: MaterialButton(
                          onPressed: (){

                          String id = _name.text.toString();
                          firestore.doc(id).set({
                            'name' :_name.text.toString(),
                            'owner' :_owner.text.toString(),
                            'address' :_address.text.toString(),
                            'cover' :_cover.toString(),
                            'image1' : _image1.toString(),
                            'image2' : _image2.toString(),
                            'image3' : _image3.toString(),
                            'price' : _price.toString(),
                            'profilepic' : _profile.toString(),
                            'Description' : _description.toString(),
                            'gender' : _gender.toString(),
                            'phone' : _phoneNumber.toString(),

                          }).then((value){
                            Navigator.pop(context);
                          }).onError((error, stackTrace){
                            //Utils().
                          });

                        },
                          color: Colors.deepPurple,
                          child: Text('Submit',style: TextStyle(color: Colors.white)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}