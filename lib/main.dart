import 'package:flutter/material.dart';
import 'package:instagram_clone/modal/user_modal.dart';
import 'package:instagram_clone/screen/loginScreen.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Instagram clone',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: LoginScreen(),
          );
        },
      ),
    );
  }
}
