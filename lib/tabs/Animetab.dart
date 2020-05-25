import 'package:flutter/material.dart';

import 'package:planstraw/widgets/Cover.dart';

class AnimeTab extends StatefulWidget {
  @override
  _AnimeTabState createState() => _AnimeTabState();
}

class _AnimeTabState extends State<AnimeTab> with AutomaticKeepAliveClientMixin<AnimeTab>  {
  String page ="anime";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Align(
              child: Text('Trending This Week', style: TextStyle(color: Colors.white, fontSize: 18),), alignment: Alignment.topLeft
            ),
          ),          
          coverListView(context, 'trending', page),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Align(
              child: Text('Top Airing Anime', style: TextStyle(color: Colors.white, fontSize: 18),), alignment: Alignment.topLeft
            ),
          ),
          coverListView(context, 'current', page),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Align(
              child: Text('Top Upcoming Anime', style: TextStyle(color: Colors.white, fontSize: 18),), alignment: Alignment.topLeft
            ),
          ),
          coverListView(context, 'upcoming', page),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Align(
              child: Text('Highest Rated Anime', style: TextStyle(color: Colors.white, fontSize: 18),), alignment: Alignment.topLeft
            ),
          ),
          coverListView(context, 'rated', page),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Align(
              child: Text('Most Popular Anime', style: TextStyle(color: Colors.white, fontSize: 18),), alignment: Alignment.topLeft
            ),
          ),
          coverListView(context, 'popular', page),


        ],
      ),
    );

}
@override
  bool get wantKeepAlive => true;

}
