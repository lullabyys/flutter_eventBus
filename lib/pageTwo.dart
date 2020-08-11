import 'dart:async';
import 'package:flutter/material.dart';
import 'event_bus.dart';
import 'pageThree.dart';

//页面二
class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2..'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            FlatButton(
              color: Colors.lightGreen,
              child: Text('to page 3(动态路由)...'),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){return PageThree();}));
              },
            ),
            FlatButton(
              color: Colors.lightGreen,
              child: Text('to page 3(静态路由)...'),
              onPressed: (){
                Navigator.of(context).pushNamed('/pageThree');
              },
            ),
            FlatButton(
              color: Colors.red,
              child: Text('to page 3(replacement)'),
              onPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){return PageThree();}));
              },
            ),
            FlatButton(
              color: Colors.black12,
              child: Text('return page 1'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}