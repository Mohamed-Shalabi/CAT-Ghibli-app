import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_session_two/global/local/prefs.dart';
import 'package:state_management_session_two/global/styles/themes.dart';
import 'package:state_management_session_two/modules/all_anime/screens/all_anime_screen.dart';

// Dark Theme (Color Scheme + Text Theme)
// Using Widgets
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Prefs.init();

  runApp(ChangeNotifierProvider(create: (_) => Themes(),child: const MyApp(),),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final  themes = context.watch<Themes>();

    return MaterialApp(
      title: 'Anime App',
      debugShowCheckedModeBanner: false,
      themeMode: themes.isLight ? ThemeMode.light : ThemeMode.dark,
      theme: themes.lightTheme,
      darkTheme: themes.darkTheme,
      home: const AllAnimeScreen(),
    );
  }
}
