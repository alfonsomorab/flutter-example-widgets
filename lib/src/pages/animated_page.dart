import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedPage extends StatefulWidget {
  @override
  _AnimatedPageState createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage> {

  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _border = BorderRadius.circular(50.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Page'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          height: _height,
          width: _width,
          decoration: BoxDecoration(
            borderRadius: _border,
            color: _color,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: _changeShape,
      ),
    );
  }

  void _changeShape(){
    final random = Random();
    setState(() {
      this._color = Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        1.0
      );
      this._width = random.nextInt(350).toDouble();
      this._height = random.nextInt(550).toDouble();
      this._border = BorderRadius.circular(
        random.nextInt(100).toDouble()
      );
    });
  }
}
