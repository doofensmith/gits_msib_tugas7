import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gits_msib_tugas7/bin/artikel.dart';
import 'package:gits_msib_tugas7/bin/buat_test.dart';
import 'package:gits_msib_tugas7/bin/login.dart';
import 'package:gits_msib_tugas7/bin/search.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'bin/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider(
          create: (BuildContext context) {},
        ),
      ],
      child: MaterialApp(
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) {
            return const TestPage();
          },
          '/login': (BuildContext context) {
            return const LoginPage();
          },
          '/search': (BuildContext context) {
            return SearchPage();
          },
        },
        initialRoute: '/home',
      ),
    );
  }
}
