import 'package:flutter/material.dart';

import 'package:planstraw/widgets/Cover.dart';

class MangaTab extends StatefulWidget {
  @override
  _MangaTabState createState() => _MangaTabState();
}

class _MangaTabState extends State<MangaTab>
    with AutomaticKeepAliveClientMixin<MangaTab> {
  String page = "manga";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Align(
                child: Text(
                  'Trending This Week',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                alignment: Alignment.topLeft),
          ),
          coverListView(context, 'trending', page),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Align(
                child: Text(
                  'Top Publishing Anime',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                alignment: Alignment.topLeft),
          ),
          coverListView(context, 'current', page),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Align(
                child: Text(
                  'Top Upcoming Manga',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                alignment: Alignment.topLeft),
          ),
          coverListView(context, 'upcoming', page),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Align(
                child: Text(
                  'Highest Rated Manga',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                alignment: Alignment.topLeft),
          ),
          coverListView(context, 'rated', page),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Align(
                child: Text(
                  'Most Popular Manga',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                alignment: Alignment.topLeft),
          ),
          coverListView(context, 'popular', page),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
