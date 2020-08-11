import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_eventbus/pageOne.dart';
import 'event_bus.dart';
import 'pageFive.dart';

//页面 四
class PageFour extends StatefulWidget {
  @override
  _PageFourState createState() => _PageFourState();
}

class _PageFourState extends State<PageFour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 4..'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            FlatButton(
              color: Colors.lightGreen,
              child: Text('to page 5...'),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){return PageFive();}));
              },
            ),
            FlatButton(
              color: Colors.black12,
              child: Text('return page 3'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              color: Colors.red,
              child: Text('to page 5(removeUntil)'),
              onPressed: (){
                //销毁PageFive 底下两个页面
                int i=2;
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context){return PageFive();}), (Route route)=> i-- ==0);
              },
            )
          ],
        ),
      ),
    );
  }
}