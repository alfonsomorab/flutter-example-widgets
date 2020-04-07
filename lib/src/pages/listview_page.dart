import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  List<int> _list = new List();
  ScrollController _scrollController = new ScrollController();
  bool _isLoading = false;

  @override
  void initState() {

    super.initState();

    _addElementsToList();

    _scrollController.addListener((){
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        //_addElementsToList();
        _fetchData();

      }
    });
  }

  // IMPORTANT!!! when we have a controller
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de imágenes'),
      ),
      body: Stack(
        children: <Widget>[
          _createListView(),
          _createLoading(),
        ]
      )
    );
  }

  Widget _createListView(){
    return RefreshIndicator(

      onRefresh: _getFirstPage,

      child: ListView.builder(
        controller: _scrollController,
        itemCount: _list.length,
        itemBuilder: (BuildContext context, item){

          final _image = _list[item];

          return FadeInImage(
            placeholder: AssetImage('assets/original.gif'),
            image: NetworkImage('https://i.picsum.photos/id/$_image/500/400.jpg'),
          );
        }
      ),
    );
  }

  void _addElementsToList(){
    Random random = new Random();
    for( int i = 0 ; i < 10 ; i++){
      _list.add( random.nextInt( 500 ) );
    }

  }

  Future _fetchData() async {
    _isLoading = true;

    setState(() {

    });
    new Timer( new Duration( seconds: 2 ), _responseHTTP );
  }

  void _responseHTTP(){
    _isLoading = false;

    setState(() {

    });

    _scrollController.animateTo(
      _scrollController.position.pixels + 150,
      duration: Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn
    );

    _addElementsToList();
  }


  Widget _createLoading(){
    if ( _isLoading ){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(


              )
            ],
          ),
          SizedBox(height: 20.0,)

        ],
      );
    }
    else{
      return Container();
    }

  }

  Future<void> _getFirstPage() {

    final duration = new Duration(seconds: 3);

    new  Timer(duration, (){

      setState(() {
        _list.clear();
        _addElementsToList();
      });
    });

    return Future.delayed(duration);
  }
}
