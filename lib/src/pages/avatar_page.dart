import 'package:flutter/material.dart';


class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
            child: CircleAvatar(
              backgroundColor: Colors.amber,
              backgroundImage: NetworkImage('https://i.ytimg.com/vi/nM4ZsqJUJn4/hqdefault.jpg'),
              radius: 20.0,

              child: Text('AM'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 15.0),
            child: CircleAvatar(
              backgroundColor: Colors.amber,
              child: Text('AM'),
            ),
          ),

        ],
      ),
      body: Center(
        child: Container(
          child: FadeInImage(
            image: NetworkImage('https://iso.500px.com/wp-content/uploads/2014/07/big-one.jpg'),
            placeholder: AssetImage('assets/original.gif'),
          )
        ),
      ),
    );
  }
}
