import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gits_msib_tugas7/widget/appbar.dart';
import 'package:gits_msib_tugas7/widget/text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Center(
              child: Column(
                children: <Widget>[
                  const Image(
                    image: AssetImage('assets/images/content.png'),
                    height: 120,
                    width: 120,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15),
                  ),
                  const Text(
                    'Flutter Article',
                    style: TextStyle(color: Colors.teal, fontSize: 24),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      bottom: 50,
                    ),
                  ),
                  const CustomTextFormField(
                    labelText: 'Username',
                    hintText: 'ex : Maspion',
                    icon: Icon(
                      Icons.person_outline_rounded,
                      color: Colors.teal,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      bottom: 20,
                    ),
                  ),
                  const CustomTextFormField(
                    labelText: 'Password',
                    hintText: 'ex : Maspion',
                    icon: Icon(
                      Icons.lock,
                      color: Colors.teal,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      bottom: 20,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: null,
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.teal)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
