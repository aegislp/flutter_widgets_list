import 'package:flutter/material.dart';


import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icon_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page")
      ),
      body: _lista()
    );
  }

  Widget _lista() {

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
        return ListView(
          children: _listaItems(snapshot.data,context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {

    final List<Widget> lista = [];

    data.forEach((opcion){

      final WidgetTemp = new ListTile(
        title: Text(opcion['texto']),
        leading: getIconFromString(opcion['icon']),
        trailing: Icon(Icons.keyboard_arrow_right,color: Colors.blue,),
        onTap: (){
           
          Navigator.pushNamed(context, opcion['ruta']);
        },
      );
      lista..add(WidgetTemp)
           ..add(Divider());
    });

    return lista;
  }
}