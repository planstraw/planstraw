import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:planstraw/tabs/Animetab.dart';
import 'package:planstraw/tabs/MangaTab.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
        return DefaultTabController(
          length: 2,
          child: Shortcuts(
            shortcuts: {
              LogicalKeySet(LogicalKeyboardKey.select):
                  const Intent(ActivateAction.key),
        },
        child:Scaffold(
        backgroundColor: Color.fromARGB(255, 35, 40, 50),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: <Widget>[
              Text(widget.title),
              SizedBox(width: 50),
              TabBar(
                isScrollable: true,
                indicatorColor: Color.fromARGB(255, 255, 60, 70),
                tabs: <Widget>[
                  Tab(text: 'Anime'),
                  Tab(text: 'Manga'),
                ],
              )
            ],
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TabBarView(
              children: <Widget>[
                AnimeTab(),
                MangaTab(),
              ],
            ),
          ),
        ),
      ),
      ),
    );
  }
}
