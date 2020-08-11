import 'dart:async';
import 'package:flutter/material.dart';
import 'event_bus.dart';
import 'pageFour.dart';

//页面三
class PageThree extends StatefulWidget {
  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  TextEditingController _controller;
  String _inum;
  int _input;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 3..'),
      ),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text('点击修改page 1页面的数字。'),
              TextField(
                controller: _controller,
                onChanged: (value){
                  setState(() {
                    _inum = value;
                  });
                },
              ),
              FlatButton(
                onPressed: (){
                  _input = int.parse(_inum);
                  _onChange(_input);
                },
                child: Text('确认修改'),
              ),
              FlatButton(
                color: Colors.lightGreen,
                child: Text('to page 4...'),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){return PageFour();}));
                },
              ),
              FlatButton(
                color: Colors.red,
                child: Text('to page 4(replacement)'),
                onPressed: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){return PageFour();}));
                },
              ),
              FlatButton(
                color: Colors.black12,
                child: Text('return page2'),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              )
            ],
          )
      ),
    );
  }

  //触发事件
  _onChange(int num){
    eventBus.fire(NumberEvent(num));
  }
}