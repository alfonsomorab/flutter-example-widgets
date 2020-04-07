import 'package:flutter/material.dart';
import 'package:flutterexamplewidgets/src/pages/alert_page.dart';
import 'package:flutterexamplewidgets/src/providers/MenuProvider.dart';
import 'package:flutterexamplewidgets/src/utils/icons_string_util.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Components"),
      ),
      body: _createListView(),
    );
  }

  Widget _createListView() {
    print(menuProvider.options);

    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> asyncSnapshot){
        return ListView(
          children: _createListTiles(asyncSnapshot.data, context),
        );
      },
    );


  }

  List<Widget> _createListTiles(List<dynamic> data, BuildContext context) {

    List<Widget> list = [];

    data.forEach( ( opt ) {
      final column = Column(
        children: <Widget>[
          ListTile(
            title: Text(opt["texto"]),
            onTap: (){

              // Navigate between pages
              Navigator.pushNamed(context, opt['ruta']);

              // Other method to navigate between pages
//              final route = MaterialPageRoute(
//                builder: (BuildContext context) {
//                  return AlertPage();
//                }
//
//              );
//
//              Navigator.push(context, route);
            },
            leading: getIcon(opt['icon']),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
        ],
      );
      list.add(column);
    });
    return list;
  }


}
