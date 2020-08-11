import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_eventbus/pageThree.dart';
import 'event_bus.dart';
import 'pageTwo.dart';

//第一个页面
class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  StreamSubscription _numSubsciption;
  int _num = 0;
  //注册监听
  @override
  void initState(){
    super.initState();
    _numSubsciption = eventBus.on<NumberEvent>().listen((event) {
      int num = event.count;
      setState(() {
        if(num != null) {
          _num = num;
        }
      });
    });
  }

  //取消订阅
  @override
  void dispose(){
    super.dispose();
    _numSubsciption.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page 1'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Text('数字：'),
            Text('$_num'),
            FlatButton(
              color: Colors.lightGreen,
              onPressed:(){
                // navigator
                Navigator.of(context).push(MaterialPageRoute(builder: (context){return PageTwo();}));
              } ,
              child: Text('to page 2..'),
            ),
            FlatButton(
              color: Colors.lightGreen,
              onPressed:(){
                // navigator
                Navigator.of(context).push(MaterialPageRoute(builder: (context){return PageThree();}));
              } ,
              child: Text('to page 3..'),
            ),
            FlatButton(
              color: Colors.red,
              child: Text('to page 2(replacement)'),
              onPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){return PageTwo();}));
              },
            ),
            FlatButton(
              color: Colors.black12,
              //maybePop，能退则退，不能退就不做反应
              child: Text('return (maybePop)'),
              onPressed: (){
                Navigator.of(context).maybePop();
              },
            )
          ],
        ),
      ),
    );
  }
}