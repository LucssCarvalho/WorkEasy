import 'package:flutter/material.dart';
import 'package:WorkEasy/model/user_modal.dart';
import 'package:WorkEasy/screen/homeScreen.dart';
import 'package:WorkEasy/screen/signUp_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _emailController = TextEditingController(text: 'lucas@gmail.com');
  final _passController = TextEditingController(text: '123456');

  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: body(),
    );
  }

  Widget body() {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: ScopedModelDescendant<UserModel>(
              builder: (context, child, model) {
                if (model.isLoading)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                return Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Trampandinho',
                          style: TextStyle(fontSize: 30),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: TextField(
                            controller: _emailController,
                            decoration: new InputDecoration(
                              border: new OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.teal)),
                              hintText:
                                  'Número de telefone, email ou nome de usuário',
                              labelStyle: TextStyle(fontSize: 5),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: TextField(
                            obscureText: _showPassword,
                            controller: _passController,
                            decoration: new InputDecoration(
                              border: new OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.teal)),
                              hintText: 'Senha',
                              suffix: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _showPassword = !_showPassword;
                                  });
                                },
                                child: Icon(
                                  _showPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                              ),
                              labelStyle: TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: RaisedButton(
                            color: Colors.purple,
                            child: Container(
                              alignment: Alignment.center,
                              width: 300,
                              height: 50,
                              child: Text(
                                'Entrar',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            onPressed: () {
                              model.signIn(
                                  email: _emailController.text,
                                  pass: _passController.text,
                                  onSucess: _onSucess,
                                  onFail: _onFail);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SignUpScreen(),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Não tem conta? ',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                                Text(
                                  'Cadastre-se',
                                  style: TextStyle(
                                      color: Colors.purple[900],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onSucess() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => HomeScreen(),
    ));
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          'Falha ao entrar',
        ),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
      ),
    );
  }
}
