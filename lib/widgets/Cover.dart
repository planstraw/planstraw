import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:planstraw/pages/DetailsPage.dart';
import 'package:planstraw/services/CommonService.dart';
import 'package:planstraw/models/CommonModel.dart';
import 'package:planstraw/models/FanartModel.dart';

class Cover extends StatefulWidget {
  const Cover({
    Key key,
    @required this.item,
    @required this.onTap,
    this.onFocus,
  }) : super(key: key);

  final CommonModel item;
  final Function onTap;
  final Function onFocus;


  @override
  _CoverState createState() => _CoverState();
}

class _CoverState extends State<Cover> with SingleTickerProviderStateMixin  {

  FocusNode _node;
  AnimationController _controller;
  Animation<double> _animation;
  int _focusAlpha = 100;

  Widget image;

  @override
  void initState() {
    _node = FocusNode();
    _node.addListener(_onFocusChange);
    _controller = AnimationController(duration: const Duration(milliseconds: 100), vsync: this, lowerBound: 0.9, upperBound: 1);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _node.dispose();
    super.dispose();
  }

  void _onFocusChange() {
      if(_node.hasFocus) {
        _controller.forward();
        if(widget.onFocus != null) {
          widget.onFocus();
        }
    } else {
        _controller.reverse();
      }
  }

  void _onTap() {
    _node.requestFocus();
    if(widget.onTap != null) {
      widget.onTap();
    }
  }

  


  @override
  Widget build(BuildContext context) {

    return RawMaterialButton(
      onPressed: _onTap,
      focusNode: _node,
      focusColor: Colors.transparent,
      focusElevation: 0,
      child: buildCover(context),
    );

    
  }

  

  Widget buildCover(BuildContext context) {
    return  ScaleTransition(
      scale: _animation, 
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: _onTap,
        child: Column(
          children: <Widget>[
            Container(
              child: buildPosterImage(context),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(_focusAlpha),
                    blurRadius: 15,
                    offset: Offset(10, 15),
                  )
                ]
              ),
            ),
            SizedBox(height: 5),
            Align(child: Text(widget.item.title, maxLines: 1, style: TextStyle(color: Colors.white),), alignment: Alignment.topLeft,),
            Align(child: Text(widget.item.startDate.toString(), style: TextStyle(color: Color.fromARGB(70, 255, 255, 255), fontSize: 10)), alignment: Alignment.topLeft,),
          ],
        ),
      ),
    );
  }

  Widget buildPosterImage(BuildContext context) {
    return FutureProvider<FanartModel>(
      create: (_) => Provider.of<CommonService>(context).getImages(widget.item),
      child: Consumer<FanartModel>(
        builder: (context, fanart, _) {
          if(fanart != null && fanart.poster != null) {
            
            return FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: fanart.poster,
              fit: BoxFit.fill,
            );
          } else {
            return Image.memory(kTransparentImage, fit: BoxFit.fill);
            // return Image.memory(kTransparentImage);
          }
        },
      ),
    );
  }
}



Widget coverListView(BuildContext context, String endpoint, String page) {

    
  return FutureProvider<List<CommonModel>>(
    create: (_) => Provider.of<CommonService>(context).getDetail(5,endpoint,page),
    child: Consumer<List<CommonModel>>(
      builder: (context,items,_) {
        if(items != null) {
          return OrientationBuilder(
            builder: (context, orientation) {
              int itemCount=items.length;             
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: itemCount, childAspectRatio: 0.55),
                itemCount: itemCount,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  CommonModel item = items[index];
                  return Cover(item: item, onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(item,page)));},);
                },
              );
            });
        }
        return Text('loading');
      },
    ),
  );

    
    
  }
