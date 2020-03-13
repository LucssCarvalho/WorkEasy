import 'package:flutter/material.dart';
import 'package:instagram_clone/profile_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Tabbar(),
    );
  }
}

class Tabbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              child: Container(
                child: Icon(
                  Icons.home,
                  size: 25,
                ),
              ),
            ),
            Tab(
              child: Container(
                child: Icon(
                  Icons.search,
                  size: 25,
                ),
              ),
            ),
            Tab(
              child: Container(
                child: Icon(
                  Icons.add_box,
                  size: 25,
                ),
              ),
            ),
            Tab(
              child: Container(
                child: Icon(
                  Icons.favorite,
                  size: 25,
                ),
              ),
            ),
            Tab(
              child: Container(
                child: CircleAvatar(
                  backgroundColor: Colors.grey[800],
                  radius: 12,
                  child:
                      CircleAvatar(backgroundColor: Colors.green, radius: 10),
                ),
              ),
            ),
          ],
          indicatorWeight: 2,
          labelStyle: TextStyle(fontSize: 10),
          unselectedLabelColor: Colors.grey[800],
          labelColor: Colors.greenAccent[700],
          indicatorColor: Colors.transparent,
        ),
        body: TabBarView(children: [
          ProfileScreen(),
          ProfileScreen(),
          ProfileScreen(),
          ProfileScreen(),
          ProfileScreen(),
        ]),
      ),
    );
  }
}
