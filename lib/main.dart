import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Let's start 1st by creating the background of the app

          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.blue[400],
              Colors.blue[800],
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          ),
          //now let's make the navigation menu

          SafeArea(
              child: Container(
            width: 200,
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                DrawerHeader(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://helostatus.com/wp-content/uploads/2021/03/2021-WhatsApp-profile-photo.jpg',
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Prabhu',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                )),
                Expanded(
                    child: ListView(
                  children: [
                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Settings',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Log Out',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          )),

          //Now let's make our main screen
          //we will wrap our main screen in a tween animation builder
          //which will allows us to animate it
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: value),
              duration: Duration(milliseconds: 500),
              builder: (_, double val, __) {
                return (
                    //Now let's create a transform widget
                    Transform(
                      alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..setEntry(0, 3, 200 * val)
                          ..rotateY((pi / 6) * val),
                      child: Scaffold(
                        appBar: AppBar(
                          title: Text(
                            '3-D Drawer Menu'
                          ),
                        ),
                        body: Center(
                          child: Text(
                            'Swipe right to open the menu'
                          ),
                        ),
                      ),
                    )
                );
              }),
          //Okay now let's make gesture detector widget that will allow us to open the drawer
          GestureDetector(
            onHorizontalDragUpdate: (e){
              if(e.delta.dx > 0) {
                setState(() {
                  value = 1;
                });
              }
              else {
                setState(() {
                  value = 0;
                });
              }
            },
             /*onTap: () {
               setState(() {
                 value == 0 ? value = 1 : value = 0;
               });
             }*/
          )
        ],
      ),
    );
  }
}
