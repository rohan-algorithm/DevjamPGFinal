import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'clg.dart';
import 'package:url_launcher/url_launcher.dart' ;

class ViewPG extends StatelessWidget {
  static const String id = "viewpg";
  const ViewPG({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(

        children: [
          AppBar(
            title: Center(child: Text(Name)),
            actions: [
              Padding(
                padding: EdgeInsets.all(15),
                  child: Icon(Icons.favorite)),
            ],
            backgroundColor: Colors.deepPurple,
           // shadowColor: Colors.deepPurple[200],
            leading: BackButton(
              color: Colors.white,
            ),

          ),
          SizedBox(height: 3,),
          Stack(
            children: [

            ],
          ),
          CarouselSlider(items: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                image: DecorationImage(
                  image: NetworkImage(Image1),
                  fit: BoxFit.cover,
                )
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  image: DecorationImage(
                    image: NetworkImage(Image2),
                    fit: BoxFit.cover,
                  )
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  image: DecorationImage(
                    image: NetworkImage(Image3),
                    fit: BoxFit.cover,
                  )
              ),
            )
          ], options: CarouselOptions(
            height: 300
          )),
          SizedBox(height: 1,),
          Card(
            color: Colors.deepPurple[200],
            child :ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.deepPurple,
              backgroundImage: NetworkImage(Profilepic),
            ) ,
            title: Text(Name),
            subtitle:  Text(Address),
            trailing: MaterialButton(
              onPressed: () async {
                final Uri url =Uri(
                  scheme: 'tel',
                  path: '9770573891'
                );
                if(await canLaunchUrl(url)){
                  await launchUrl(url);
                }
                //UrlLauncher("tel://21213123123")
              },
              child: Icon(
                  Icons.call
              ),
            ),
          ),
          ),
          Card(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(

                        child: Column(
                          children :[
                          Icon(FontAwesomeIcons.water,
                          size: 50, //Icon Size
                          color: Colors.deepPurple, //Color Of Ico
                          ),
                            Text('24x7 Water',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold
                            ),),
                         ]
                        ),
                      ),
                     // SizedBox(width: 20,),
                      Card(

                        child: Column(
                            children :[
                              Icon(FontAwesomeIcons.taxi,
                                size: 50, //Icon Size
                                color: Colors.deepPurple, //Color Of Ico
                              ),
                              Text('Easy Transport',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold
                              ),),
                            ]
                        ),
                      ),
                      //SizedBox(width: 20,),
                      Card(

                        child: Column(
                            children :const [
                              Icon(FontAwesomeIcons.wifi,
                                size: 50, //Icon Size
                                color: Colors.deepPurple, //Color Of Ico
                              ),
                              Text('Free WiFi',style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold
                              ),),
                            ]
                        ),
                      ),
                      //SizedBox(width: 26,),
                      Card(

                        child: Column(
                            children :const [
                              Icon(FontAwesomeIcons.newspaper,
                                size: 50, //Icon Size
                                color: Colors.deepPurple, //Color Of Ico
                              ),
                              Text('Market',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold
                              ),),
                            ]
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 8,),
          Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Description",
                          //textAlign: TextAlign.left,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.deepPurple,
                          )),

                      TextButton(onPressed: (){},
                        style: TextButton.styleFrom(
                         // primary: Colors.purpleAccent,
                          backgroundColor: Colors.deepPurple[100], // Background Color
                        ),
                        child: Text('₹'+Price,
                          //textAlign: TextAlign.left,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: Colors.deepPurple,
                          )),)

                    ],
                  ),
                ),
                SizedBox(height: 8,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(Description, style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 15
                  )),
                    SizedBox(height: 5,),
                    Text('Rules',style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 5,),
                    Text(Description, style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 15
                    )),
                    SizedBox(height: 5,),
                    Text('Nearby Landmarks',style: TextStyle(
                      fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 5,),
                    Text(Description, style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 15
                    )),
                  ]
                ),
                SizedBox(height: 20,),
                Padding(padding: EdgeInsets.all(12),
                child:SlideAction(
                  outerColor: Colors.deepPurple[100],
                  innerColor: Colors.deepPurple,
                  text: 'Schedule a Visit',
                  onSubmit: (){
                    //Do something
                  },

                ),)

              ],
            ),




        ],
      ),
    );
  }
}
