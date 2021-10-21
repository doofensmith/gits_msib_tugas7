import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'artikel.dart';
import '../models/login.dart';
import '../network/login_client.dart';
import '../models/auth.dart';
import '../provider/auth_provider.dart';
import '../widget/appbar.dart';
import '../widget/text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _controllerUsername;
  late TextEditingController _controllerPassword;

  Auth? auth;
  @override
  void initState() {
    super.initState();
    _controllerUsername = TextEditingController();
    _controllerPassword = TextEditingController();
  }

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
                  CustomTextFormField(
                    labelText: 'Username',
                    hintText: 'Username',
                    controller: _controllerUsername,
                    icon: const Icon(
                      Icons.person_outline_rounded,
                      color: Colors.teal,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      bottom: 20,
                    ),
                  ),
                  CustomTextFormField(
                    labelText: 'Password',
                    isPassword: true,
                    controller: _controllerPassword,
                    hintText: 'Password',
                    icon: const Icon(
                      Icons.lock,
                      color: Colors.teal,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      bottom: 20,
                    ),
                  ),
                  Consumer<AuthProvider>(
                    builder: (
                      BuildContext context,
                      value,
                      Widget? child,
                    ) {
                      return ElevatedButton(
                        onPressed: () async {
                          Login _login = await LoginClient.loginCheck(
                            username: _controllerUsername.text,
                            password: _controllerPassword.text,
                          );
                          if (_login.code == null) {
                            value.addAuth(
                              auth: Auth(
                                token: _login.token!,
                                userDisplayName: _login.userDisplayName!,
                              ),
                            );
                            Navigator.of(context).pop(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return Artikel();
                                },
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Oops! Something went wrong...',
                                ),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.teal,
                          ),
                        ),
                      );
                    },
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
