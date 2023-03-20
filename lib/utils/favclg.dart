import 'package:flutter/material.dart';
import 'package:pgapp/addpg.dart';
import 'package:pgapp/clg.dart';
import 'package:pgapp/sellerdash.dart';
import 'package:pgapp/utils/test.dart';
import 'package:pgapp/viewpg.dart';
import '../clg.dart';

class favclg extends StatelessWidget {
  final String name;
  final String logo;
  const favclg({Key? key,required this.name,required this.logo,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  PgApplicationPage()),
          );
          //_showStudentsData(context, document.reference,);
        },
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
          color: Colors.deepPurpleAccent,
          ),
          padding: EdgeInsets.all(12),
          child: Center(
            child: Column(
              children: [
                Image.network(logo, width: 65,height: 65,),
                SizedBox(height: 8),
                Text(
                name,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]
            ),
          ),
        ),
      ),
    );
  }
}

// void _showStudentsData(BuildContext context, DocumentReference clglistRef) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (BuildContext context) => Clg(clglistRef: clglistRef),
//     ),
//   );
// }
