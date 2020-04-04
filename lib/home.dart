import 'package:flutter/material.dart';

class HomePost extends StatefulWidget {
  @override
  _HomePostState createState() => _HomePostState();
}

class _HomePostState extends State<HomePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }

  Widget appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.send,
            color: Colors.grey[800],
          ),
          onPressed: () {},
        )
      ],
      title: Container(
        height: 40,
        width: 110,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/insta_logo.png'), fit: BoxFit.cover),
        ),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.camera_alt,
          color: Colors.grey[800],
        ),
        onPressed: () {},
      ),
    );
  }

  Widget body() {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 60,
            child: storyList(),
          ),
        ),
        Divider(),
        post(),
      ],
    );
  }

  Widget post() {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                'name',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ),
                            Text('algum lugar - mundo')
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: IconButton(
                      icon: Icon(Icons.list),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 350,
            child: Container(
              color: Colors.blueAccent,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.grey,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.message,
                          color: Colors.grey,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.send,
                          color: Colors.grey,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.bookmark,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Text(
                  'name: is simply dummy text of the printing and typesetting industry.'),
            ),
          ),
        ],
      ),
    );
  }

  Widget storyList() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        storyTile(Colors.green),
        storyTile(Colors.green),
        storyTile(Colors.green),
        storyTile(Colors.green),
        storyTile(Colors.green),
        storyTile(Colors.green),
        storyTile(Colors.green),
        storyTile(Colors.green),
        storyTile(Colors.green),
        storyTile(Colors.green),
      ],
    );
  }

  Widget storyTile(Color color) {
    return Container(
      height: 60,
      width: 60,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(120),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF833ab4),
            Color(0xFFfd1d1d),
            Color(0xFFfcb045),
          ],
        ),
      ),
      child: CircleAvatar(
        radius: 2,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 25,
        ),
      ),
    );
  }
}
