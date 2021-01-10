import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:house_mobile/components/rounded_button.dart';
import 'package:house_mobile/components/rounded_input_field.dart';
import 'package:house_mobile/components/rounded_password_field.dart';

import '../api.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final globalKey = GlobalKey<ScaffoldState>();

  var _email = '';
  var _senha = '';

  void _showMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    globalKey.currentState.showSnackBar(snackBar);
  }

  void _onPressed() async {
    if (_formKey.currentState.validate()) {
      try {
        final _data = {'email': _email, 'senha': _senha};

        var response = await api.post("/sessions", data: _data);

        _showMessage('Bem vindo ${response.data['user']['nome']}');
        Navigator.of(context).pushReplacementNamed('/map');
      } on DioError catch (e) {
        if (e.response != null) {
          String errorMessage = e.response.data['message'];
          _showMessage(errorMessage);
        } else {
          _showMessage(
              'Ocorreu um erro inesperado, verifique sua conexão com a internet');
        }
      } catch (e) {
        _showMessage(
            'Ocorreu um erro inesperado, verifique sua conexão com a internet');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                child: Image.asset('assets/logo.png'),
              ),
              RoundedInputField(
                hintText: "Email",
                onChanged: (value) => setState(() {
                  _email = value;
                }),
              ),
              RoudedPasswordField(
                onChanged: (value) => setState(() {
                  _senha = value;
                }),
              ),
              RoundedButton(text: "Login", press: _onPressed),
              // Text(message),
            ],
          ),
        ),
      ),
    );
  }
}
