import 'package:flutter/material.dart';
import 'package:gits_msib_tugas7/models/post.dart';
import 'package:gits_msib_tugas7/network/api_client.dart';

import 'login.dart';
import 'search.dart';
import '../widget/appbar.dart';

class Artikel extends StatefulWidget {
  const Artikel({Key? key}) : super(key: key);

  @override
  State<Artikel> createState() => _ArtikelState();
}

class _ArtikelState extends State<Artikel> {
  final int _count = 10;
  final List<Post> _listData = <Post>[];
  final ScrollController _scrollController = ScrollController();
  int _offset = 0;
  Post? _post;

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
      body: FutureBuilder(
        future: ApiClient().getPostData(3, 10),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          //bool connect = snapshot.connectionState == ConnectionState.done;
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Post? post = snapshot.data[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  elevation: 2,
                  child: ListTile(
                    leading: Icon(
                      Icons.article_rounded,
                      color: Colors.teal[800],
                    ),
                    tileColor: const Color(0xFFFFFFFF),
                    title: Text(
                      post!.title!.rendered.toString(),
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
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
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
}
