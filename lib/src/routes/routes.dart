import 'package:flutter/material.dart';

import 'package:flutterexamplewidgets/src/pages/alert_page.dart';
import 'package:flutterexamplewidgets/src/pages/animated_page.dart';
import 'package:flutterexamplewidgets/src/pages/avatar_page.dart';
import 'package:flutterexamplewidgets/src/pages/card_page.dart';
import 'package:flutterexamplewidgets/src/pages/home_page.dart';
import 'package:flutterexamplewidgets/src/pages/inputs_page.dart';
import 'package:flutterexamplewidgets/src/pages/listview_page.dart';
import 'package:flutterexamplewidgets/src/pages/slider_page.dart';

Map <String, WidgetBuilder> getApplicationRoutes(){
  return <String, WidgetBuilder>{
    'home'      : (BuildContext context) => HomePage(),
    'avatar'    : (BuildContext context) => AvatarPage(),
    'alert'     : (BuildContext context) => AlertPage(),
    'card'      : (BuildContext context) => CardPage(),
    'animated'  : (BuildContext context) => AnimatedPage(),
    'inputs'    : (BuildContext context) => InputsPage(),
    'slider'    : (BuildContext context) => SliderPage(),
    'list'    : (BuildContext context) => ListViewPage(),
  };
}