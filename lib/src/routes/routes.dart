import 'package:componentes/src/pages/animated_container_page.dart';
import 'package:componentes/src/pages/cards_page.dart';
import 'package:componentes/src/pages/imput_page.dart';
import 'package:componentes/src/pages/lista_page.dart';
import 'package:componentes/src/pages/slider_page.dart';
import 'package:flutter/material.dart';

import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_icon.dart';
import 'package:componentes/src/pages/home_page.dart';


Map<String,WidgetBuilder> getNavigationPagesRoutes(){
  return <String, WidgetBuilder>{
        '/': (BuildContext context)=> HomePage(),
        'alert': (BuildContext context)=> AlertPage(),
        'avatar': (BuildContext context)=> AvatarPage(),
        'card': (BuildContext context)=> CardsPage(),
        'animatedContainer': (BuildContext context)=> AnimatedContainerPage(),
        'inputs': (BuildContext context)=> InputPage(),
        'slider': (BuildContext context)=> SliderPage(),
        'list': (BuildContext context)=>ListaPage()
      };
}
