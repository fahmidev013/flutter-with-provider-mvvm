import 'package:flutter/material.dart';
import 'package:qms/model/post.dart';

class TestPage extends StatefulWidget {
  @override
  State createState() {
    return _TestPageState();
  }
}

class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    super.initState();
  }


  Future<void> _askedToLead() async {
    switch (await showDialog<Post>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Select assignment'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {  },
                child: const Text('Treasury department'),
              ),
              SimpleDialogOption(
                onPressed: () { },
                child: const Text('State department'),
              ),
            ],
          );
        }
    )) {}
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("MVVM + Provider Demo"),
          actions: <Widget>[],
        ),
        body: Container(
            color: Colors.black12,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(Icons.album),
                          title: Text('The Enchanted Nightingale'),
                          subtitle: Text(
                              'Music by Julie Gable. Lyrics by Sidney Stein.'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                              child: const Text('BUY TICKETS'),
                              onPressed: () {
                                _askedToLead();
                              },
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              child: const Text('LISTEN'),
                              onPressed: () {/* ... */},
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]
            )
        )
    );
  }
}


