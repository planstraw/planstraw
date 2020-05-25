import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:planstraw/pages/HomePage.dart';
import 'package:planstraw/models/CommonModel.dart';

class DetailsPage extends StatefulWidget {
  final CommonModel item;
  final String page;
  DetailsPage(this.item, this.page);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with TickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      // needed for AndroidTV to be able to select
      shortcuts: {LogicalKeySet(LogicalKeyboardKey.select): const Intent(ActivateAction.key)},
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.openSans().fontFamily,
        ),
        home: Scaffold(
          body: Container(
            color: Colors.black,
            child: Stack(
              children: <Widget>[
                buildBackdropImage(context),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                        Colors.black.withAlpha(230),
                        Colors.transparent
                      ])),
                  child: buildItemDetails(),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.close),
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
  }

  Widget buildBackdropImage(BuildContext context) {
    return Stack(
      children: <Widget>[
        FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: (widget.item != null && widget.item.backgroundImage != null)
              ? widget.item.backgroundImage
              : kTransparentImage,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        // Positioned(
        //   top: 0,
        //   left: 0,
        //   bottom: 0,
        //   right: 0,
        //   child: BackdropFilter(
        //     filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
        //     // child: Container(color: Colors.black.withOpacity(0)),
        //   ),
        // )
      ],
    );
  }

  Widget buildItemDetails() {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
              flex: 5,
              child: Column(
                children: <Widget>[
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.item.title,
                        style: GoogleFonts.oswald(
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 50)),
                      )),
                  SizedBox(height: 40),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 255, 180, 10),
                        size: 30,
                      ),
                      SizedBox(width: 10),
                      Text(
                        widget.item.averageRating,
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 30),
                      Icon(
                        Icons.timer,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(width: 10),
                      Text(
                        widget.item.totalLength.toString() + " minutes",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 30),
                      Text(
                        widget.item.startDate.toString(),
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  SizedBox(height: 40),
                  Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: 400,
                        child: Text(
                          widget.item.synopsis,
                          maxLines: 10,
                          style: TextStyle(
                              color: Colors.white, fontSize: 10, height: 1.5),
                        ),
                      )),
                  SizedBox(height: 50),
                ],
              )),

          // }
        ],
      ),
    );
  }
}
