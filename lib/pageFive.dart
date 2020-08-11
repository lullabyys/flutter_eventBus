import 'dart:async';
import 'package:flutter/material.dart';
import 'event_bus.dart';

//页面 五
class PageFive extends StatefulWidget {
  @override
  _PageFiveState createState() => _PageFiveState();
}

class _PageFiveState extends State<PageFive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 5..'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            FlatButton(
              color: Colors.black12,
              child: Text('return page 4'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              color: Colors.black12,
              child: Text('return page 1(popUntil)'),
              onPressed: (){
                //连续pop 4个路由
                int i=4;
                Navigator.of(context).popUntil((Route route) => i-- ==0);
              },
            )
          ],
        ),
      ),
    );
  }
}