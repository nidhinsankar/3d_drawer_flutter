import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
          //background of the app\
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0xff42A5F5), Color(0xff1E88E5)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            )),
          ),

          SafeArea(
            child: Container(
              height: double.infinity,
              width: 200.0,
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  DrawerHeader(
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://monstar-lab.com/global/wp-content/uploads/sites/11/2019/04/male-placeholder-image-300x300.jpeg'),
                          radius: 50.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Nidhin sankar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        ListTile(
                          leading: Icon(Icons.home, color: Colors.white),
                          title: Text('Home',
                              style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          leading: Icon(Icons.person, color: Colors.white),
                          title: Text('Profile',
                              style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          leading: Icon(Icons.settings, color: Colors.white),
                          title: Text('Settings',
                              style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Log Out',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: value),
            duration: Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            builder: (_, double val, __) {
              return (Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, 200 * val)
                  ..rotateY((pi / 6) * val),
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        color: Colors.blueAccent[200],
                        alignment: Alignment.center,
                        height: 100,
                        child: Text('3d drawer app',style: TextStyle(color: Colors.white70),),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text('swipe right to see menu'),
                        ),
                      )
                    ],
                  ),
                ),
              ));
            },
          ),

          GestureDetector(
            onHorizontalDragUpdate: (e) {
              if (e.delta.dx > 0) {
                setState(() {
                  value = 1;
                });
              } else {
                setState(() {
                  value = 0;
                });
              }
            },
            // onTap: () {
            //   setState(() {
            //     value == 0 ? value = 1 : value = 0;
            //   });
            // },
          )
        ],
      ),
    );
  }
}
