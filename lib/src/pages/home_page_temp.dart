
import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final  opciones = ['Uno','Dos','Tres'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: ListView(
        children: _createItems(),
      ),
    );

    
  }
  List<Widget> _createItems(){
      return opciones.map((item){

        return  Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text(item),
              subtitle: Text('Subtitle'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: (){},
            ),
            Divider()
          ],
        );
      }).toList();
  }
}