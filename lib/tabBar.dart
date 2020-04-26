import 'package:flutter/material.dart';
import 'package:instagram_clone/tabs/homeTab.dart';
import 'package:instagram_clone/tabs/profileTab.dart';

class Tabbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
          ],
          indicatorWeight: 2,
          labelStyle: TextStyle(fontSize: 10),
          unselectedLabelColor: Colors.grey[800],
          labelColor: Colors.greenAccent[700],
          indicatorColor: Colors.transparent,
        ),
        body: TabBarView(children: [
          HomePost(),
          ProfileScreen(),
        ]),
      ),
    );
  }
}
