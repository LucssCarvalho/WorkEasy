import 'package:WorkEasy/model/user_modal.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(builder: (context, child, model) {
      return Scaffold(
        body: Container(
          child: Column(
            children: [
              CircleAvatar(
                radius: 70,
                child: Image.network(model.userData["imageProfile"]),
              ),
            ],
          ),
        ),
      );
    });
  }
}
