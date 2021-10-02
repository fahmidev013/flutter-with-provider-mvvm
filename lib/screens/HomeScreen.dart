import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qms/components/post/PostView.dart';
import 'package:qms/model/PushNotification.dart';
import 'package:qms/notifiers/PostsNotifier.dart';
import 'package:qms/services/ApiService.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {


  @override
  void initState() {
    PostsNotifier postNotifier =
        Provider.of<PostsNotifier>(context, listen: false);
    ApiService.getPosts(postNotifier);
    super.initState();
    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessage.listen((event) {
      if(event.notification != null){
        print(event.notification!.body);
        print(event.notification!.title);
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      final route = event.data['route'];
      Navigator.of(context).pushNamed(route);

    });
  }

  @override
  Widget build(BuildContext context) {
    PostsNotifier postNotifier = Provider.of<PostsNotifier>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("MVVM + Provider Demo"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, "/add_post");
              },
            ),
            IconButton(
              icon: Icon(Icons.alarm),
              onPressed: () {
                Navigator.pushNamed(context, "/testpage");
              },
            )
          ],
        ),
        body: postNotifier != null
            ? Column(
                children: [
                  Container(
                    child: Text("hhellos"),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.black12,
                      child: ListView.builder(
                          itemCount: postNotifier.getPostList().length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.all(0),
                              key: ObjectKey(postNotifier.getPostList()[index]),
                              child: PostView(
                                post: postNotifier.getPostList()[index],
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
