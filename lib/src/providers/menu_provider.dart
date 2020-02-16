import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;



class _MenuProvider{
  List<dynamic> opciones = [];

  _MenuProvider(){
  }

  Future<List<dynamic>> cargarData() async {
    final data = await rootBundle.loadString('data/menu_opts.json');
      
    Map dataMap = json.decode(data);
      
    this.opciones = dataMap['rutas'];
       
    return this.opciones;
  }


}

final menuProvider = new _MenuProvider();