import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valueSlider = 100.0;
  bool _blockSlider = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider Page"),
      ),
      body: Column(

        children: <Widget>[
          Container(
            padding: EdgeInsets.only( top: 50.0 ),
            child: _createSlider()
          ),
          _createCheck(),
          _createSwitch(),
          Expanded(
            child: _createImage(),
          ),
        ],
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      value: _valueSlider,
      max: 400.0,
      min: 50.0,
      onChanged: ( _blockSlider ) ? null : (value){
        setState(() {
          _valueSlider = value;
        });
      },
    );
  }

  Widget _createImage(){
    return FadeInImage(
      placeholder: AssetImage('assets/original.gif'),
      image: NetworkImage('https://pngimage.net/wp-content/uploads/2018/06/random-png-6.png'),
      width: _valueSlider,
    );
  }

  Widget _createCheck(){
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _blockSlider,
      onChanged: ( value ){
        setState(() {
          _blockSlider = value;
        });
      },
    );
  }

  Widget _createSwitch(){
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _blockSlider,
      onChanged: (value){
        setState(() {
          _blockSlider = value;
        });
      },
    );
  }
}
