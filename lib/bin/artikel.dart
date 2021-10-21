import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login.dart';
import 'profile.dart';
import 'search.dart';
import '../widget/appbar.dart';
import '../models/post.dart';
import '../network/api_client.dart';
import '../provider/auth_provider.dart';

class Artikel extends StatefulWidget {
  const Artikel({Key? key}) : super(key: key);

  @override
  State<Artikel> createState() => _ArtikelState();
}

class _ArtikelState extends State<Artikel> {
  List<Post> _listPost = <Post>[];
  final ScrollController _scrollController = ScrollController();
  int _page = 1;
  final int _perPage = 10;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _requestNewPost();
    _scrollController.addListener(() {
      double _pixels = _scrollController.position.pixels;
      double _maxScroll = _scrollController.position.maxScrollExtent;
      if (_pixels == _maxScroll) {
        _page += 1;
        _requestNewPost();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text(
          'Flutter Article',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        actions: [
          Consumer<AuthProvider>(
            builder: (BuildContext context, value, Widget? child) {
              return IconButton(
                onPressed: () {
                  print(value.loginData?.token);
                  if (value.loginData == null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Profile(),
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.person_sharp, color: Colors.white),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        itemCount: _listPost.length,
        itemBuilder: (BuildContext context, int index) {
          Post? post = _listPost[index];
          if (_listPost.length == index) {
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              child: const CircularProgressIndicator(),
            );
          } else {
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
                  post.title!.rendered.toString(),
                  style: const TextStyle(
                    color: Colors.teal,
                  ),
                ),
                subtitle: Text(
                  post.content!.rendered.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.teal,
                  ),
                ),
                onTap: () {},
              ),
            );
          }
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

  Future<void> _requestNewPost() async {
    _listPost = await ApiClient(page: _page, perPage: _perPage).getPostData();
    if (_listPost.isNotEmpty) {
      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Oops! Something went wrong...',
          ),
        ),
      );
    }
  }
}
