import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final options = ["Uno", "Dos", "Tres", "Cuatro", "Cinco"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Components temp"),
      ),
      body: ListView(
        children: _createShortListTiles()
      ),
    );

  }

  List<Widget> _createListTiles(){

    List<Widget> list = List<Widget>();

    for (String opt in options){
      ListTile listTile = ListTile(
        title: Text(opt),
      );

      list..add(listTile)..add(Divider());
    }

    return list;

  }

  List<Widget> _createShortListTiles(){
    return options.map((item){
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item),
            subtitle: Text("This is a subtitle"),
            leading: Icon(Icons.ac_unit),
            trailing: Icon( Icons.arrow_forward_ios ),
            onTap: (){},
          ),
          Divider()
        ],
      );
    }).toList();
  }
}
