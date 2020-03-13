import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String login = 'lucss.carvalho';
  String name = 'Lucas Carvalho';
  int posts = 22;
  int followers = 506;
  int following = 602;
  String bio = 'bio is null';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          nameTitle(),
          profileInfo(),
          bioProfile(),
          editButton(),
          listEvents(),
        ],
      ),
    );
  }

  Widget listEvents() {
    return Container(
      child: Row(
        children: <Widget>[],
      ),
    );
  }

  Widget editButton() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: RaisedButton(
          color: Colors.white,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5.0),
              side: BorderSide(color: Colors.grey[400])),
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text('Edit profile')],
          ),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget bioProfile() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(bio),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget profileInfo() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.green,
              radius: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      posts.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Text('Publicações'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      followers.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Text('followers'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      following.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Text('following'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget nameTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            login,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Icon(
            Icons.dehaze,
            size: 30,
          )
        ],
      ),
    );
  }
}
