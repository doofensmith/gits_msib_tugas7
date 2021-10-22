import 'package:flutter/material.dart';

import 'search_title.dart';
import '../models/search.dart';
import '../network/search_client.dart';
import '../widget/appbar.dart';
import '../widget/text_form_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Search> _search = [];
  bool _onSearch = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
        child: ListView(
          children: <Widget>[
            CustomTextFormField(
              controller: _searchController,
              icon: const Icon(
                Icons.search,
                color: Colors.teal,
              ),
              labelText: 'Search',
              onTap: _searchResult,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              onEditingComplete: _searchResult,
            ),
            Container(
              child: _body(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _searchResult() async {
    setState(() => _onSearch = true);
    _search = await SearchClient.getResponse(_searchController.text);
    setState(() => _onSearch = false);
  }

  Widget _body() {
    if (_onSearch) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return SearchContent(
        query: _searchController.text,
        searching: _search,
      );
    }
  }
}
