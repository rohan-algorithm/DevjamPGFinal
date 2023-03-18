import 'package:flutter/material.dart';
import 'package:pgapp/viewpg.dart';
import 'package:getwidget/getwidget.dart';




class Clg extends StatelessWidget {
  static const String id= "clg";
   const Clg({Key? key}) : super(key: key);


  Widget list(context) {
    return MaterialButton(
      child: GFCard(
        boxFit: BoxFit.cover,
        color: Colors.white,
        // borderRadius: BorderRadius.all(Radius.circular(33.0)),
        elevation: 22,

        titlePosition: GFPosition.start,
        image: Image.asset(
          'assets/images/pgimg.jpeg',
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
        showImage: true,

        content: Text("One of the best PG available in MNNIT with 24x7 Wifi Facility an more.",style: TextStyle(fontSize: 16), ),
        buttonBar: GFButtonBar(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Text('⭐️⭐️⭐️⭐️⭐️'),

                Text('₹12000',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                
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
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewPG()));
      },
    );
  }

  Widget safeZone(context) {
    return SafeArea(
      child: Column(

        children: [
          // Card(
          //   color: Colors.deepPurple,
          //   child:
          // ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.2,vertical: 0.2),
              child: list(context)),
          list(context),
          list(context),
          list(context),
          list(context),
          list(context),
          list(context),
          list(context),
          list(context),
          list(context),
          list(context),
          list(context),
          list(context),
          list(context),
          list(context),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.grey[300],
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                toolbarHeight: 80,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(
                      Icons.clear,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.book_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(0),
                  child: Container(
                    decoration:  BoxDecoration(
                      color: Colors.deepPurple[500],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'MNNIT',

                        style: TextStyle(
                          color: Colors.white,

                          fontSize: 30,
                          letterSpacing: 2.5,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
                pinned: true,
                backgroundColor: Colors.deepPurple[300],
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  // collapseMode: CollapseMode.parallax,
                  background: Image.asset(
                    'assets/images/mnnit.jpeg',
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: safeZone(context),
              )
            ],
          )),
    );

  }
}