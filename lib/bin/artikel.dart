import 'package:flutter/material.dart';
import 'package:gits_msib_tugas7/bin/login.dart';
import 'package:gits_msib_tugas7/bin/search.dart';
import 'package:gits_msib_tugas7/widget/appbar.dart';

class Artikel extends StatefulWidget {
  const Artikel({Key? key}) : super(key: key);

  @override
  _ArtikelState createState() => _ArtikelState();
}

class _ArtikelState extends State<Artikel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text(
          'Flutter Article',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            icon: const Icon(Icons.person_sharp, color: Colors.white),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            elevation: 2,
            child: ListTile(
              leading: Icon(
                Icons.article_rounded,
                color: Colors.teal[800],
              ),
              tileColor: const Color(0xFFFFFFFF),
              title: const Text(
                'Title',
                style: TextStyle(color: Colors.teal),
              ),
              subtitle: const Text(
                'Deskripsi',
                style: TextStyle(color: Colors.teal),
              ),
              onTap: () {},
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchPage(),
            ),
          );
        },
        backgroundColor: Colors.teal,
        child: const Icon(Icons.search),
      ),
    );
  }
}
