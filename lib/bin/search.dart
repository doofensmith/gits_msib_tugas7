import 'package:flutter/material.dart';
import 'package:gits_msib_tugas7/widget/appbar.dart';
import 'package:gits_msib_tugas7/widget/text_form_field.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Search',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: Column(
          children: const <Widget>[
            CustomTextFormField(
              icon: Icon(
                Icons.search,
                color: Colors.teal,
              ),
              labelText: 'Search',
            ),
          ],
        ),
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
    /*ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
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
                  );*/
  }
}
