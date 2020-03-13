import 'package:flutter/material.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
      child: Scaffold(
        key: _scaffoldKey,
        appBar: nameTitle(),
        endDrawer: drawer(),
        body: Column(
          children: <Widget>[
            profileInfo(),
            bioProfile(),
            editButton(),
            listEvents(),
            gridImages()
          ],
        ),
      ),
    );
  }

  Widget drawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.restore,
              size: 35,
            ),
            title: Text('Arquivar'),
            onTap: () {
              Navigator.pushNamed(context, '/transactionsList');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.filter_center_focus,
              size: 35,
            ),
            title: Text('Tag de nomes'),
            onTap: () {
              Navigator.pushNamed(context, '/transactionsList');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.turned_in_not,
              size: 35,
            ),
            title: Text('Salvos'),
            onTap: () {
              Navigator.pushNamed(context, '/transactionsList');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.list,
              size: 35,
            ),
            title: Text('Melhores amigos'),
            onTap: () {
              Navigator.pushNamed(context, '/transactionsList');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.person_add,
              size: 35,
            ),
            title: Text('Encontrar pessoas'),
            onTap: () {
              Navigator.pushNamed(context, '/transactionsList');
            },
          ),
        ],
      ),
    );
  }

  Widget gridImages() {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(11, (index) {
          return Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              alignment: AlignmentDirectional.center,
              width: 400,
              height: 300,
              color: Colors.cyan,
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headline,
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget listEvents() {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                MaterialButton(
                  child: Container(
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey[700],
                      child: CircleAvatar(
                        radius: 38,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.add,
                          color: Colors.grey[700],
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('New'),
                )
              ],
            ),
          )
        ],
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
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list, color: Colors.black),
          onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
        )
      ],
      elevation: 0,
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            login,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
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
