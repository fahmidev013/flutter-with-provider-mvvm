


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qms/notifiers/PostsNotifier.dart';
import 'package:qms/screens/AddPostScreen.dart';
import 'package:qms/screens/HomeScreen.dart';
import 'package:qms/screens/TestPage.dart';

Future<void> main() async {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => PostsNotifier(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  State createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(title: 'Flutter Demo Home Page'),
      routes: {
        "/add_post" : (context)=> AddPostScreen(),
        "/testpage" : (context)=> TestPage(),
      },
    );
  }
}