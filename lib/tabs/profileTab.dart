import 'package:flutter/material.dart';
import 'package:instagram_clone/model/user_modal.dart';
import 'package:instagram_clone/screen/loginScreen.dart';
import 'package:scoped_model/scoped_model.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(builder: (context, child, model) {
      return Scaffold(
        key: _scaffoldKey,
        appBar: nameTitle(model),
        endDrawer: drawer(),
        body: Column(
          children: <Widget>[
            profileInfo(model),
            bioProfile(model),
            editButton(),
            listEvents(),
            gridImages(model)
          ],
        ),
      );
    });
  }

  Widget drawer() {
    return Drawer(
      child: ScopedModelDescendant<UserModel>(builder: (context, child, model) {
        return ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                model.userData["name"],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Divider(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
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
                ListTile(
                  leading: Icon(
                    Icons.close,
                    size: 35,
                  ),
                  title: Text('Sair'),
                  onTap: () {
                    Navigator.pop(context);
                    model.signOut();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                )
              ],
            )
          ],
        );
      }),
    );
  }

  Widget gridImages(model) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.all(4.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            childAspectRatio: 0.65),
        itemCount: model.userData['images'].length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(model.userData['images'][index]),
              ),
            ),
          );
        },
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
                      radius: 34,
                      backgroundColor: Colors.grey[700],
                      child: CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.add,
                          color: Colors.grey[700],
                          size: 30,
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

  Widget bioProfile(model) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, top: 10),
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  model.userData["name"],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(model.userData["bio"]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget profileInfo(model) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          model.userData["imageProfile"] != null
              ? CircleAvatar(
                  radius: 50.0,
                  child: Container(
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(model.userData["imageProfile"]),
                      ),
                    ),
                  ),
                )
              : CircleAvatar(
                  radius: 50.0,
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        model.userData["publications"].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Text('publications'),
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
                        model.userData["followers"].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
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
                        model.userData["following"].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Text('following'),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget nameTitle(model) {
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
            model.userData["name"].toString(),
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
