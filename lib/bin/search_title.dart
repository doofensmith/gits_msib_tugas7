import 'package:flutter/material.dart';

import '../models/search.dart';

class SearchContent extends StatefulWidget {
  const SearchContent({
    Key? key,
    this.query = '',
    required this.searching,
  }) : super(key: key);

  final String query;
  final List<Search> searching;

  @override
  _SearchContentState createState() => _SearchContentState();
}

class _SearchContentState extends State<SearchContent> {
  @override
  Widget build(BuildContext context) {
    if (widget.searching.isEmpty) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: const Text(
          " We couldn't find any title matching ",
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      );
    }
    return ListView.builder(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          Search search = widget.searching[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            elevation: 2,
            child: ListTile(
              leading: Icon(
                Icons.article_rounded,
                color: Colors.teal[800],
              ),
              tileColor: const Color(0xFFFFFFFF),
              title: Text(
                search.title,
                style: const TextStyle(
                  color: Colors.teal,
                ),
              ),
              onTap: () {},
            ),
          );
        },
        itemCount: widget.searching.length);
  }
}
