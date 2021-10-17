import 'package:flutter/material.dart';

class TextSearch extends StatelessWidget {
  const TextSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: Colors.teal,
      ),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: "Search",
        hintStyle: const TextStyle(color: Colors.teal),
        prefixIcon: const Icon(Icons.search, color: Colors.teal),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
