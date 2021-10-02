


import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qms/notifiers/PostsNotifier.dart';
import 'package:qms/screens/AddPostScreen.dart';
import 'package:qms/screens/HomeScreen.dart';
import 'package:qms/screens/TestPage.dart';

Future<void> backgroundMessageHandler(RemoteMessage msg) async {
  print(msg.data.toString());
  print(msg.notification!.title);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
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
  late FirebaseMessaging messaging;


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