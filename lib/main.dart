import 'package:flutter/material.dart';
import 'package:state_management_session_two/modules/all_anime/screens/all_anime_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AllAnimeScreen(),
    );
  }
}
