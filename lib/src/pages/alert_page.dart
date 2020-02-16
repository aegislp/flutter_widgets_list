import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Alert Page')
        ),
        body: Center(
          child: FlatButton(
            child: Text('Presioname'),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: ()=>_mostrarAlerta(context), 
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
    );
  }

  _mostrarAlerta(BuildContext context) {
     
    showDialog( 
      context: context,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text("Alert de prueba"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("texto de la alaert"),
              FlutterLogo(size: 100,)
            ],
          ),
          actions: <Widget>[
            FlatButton(onPressed: ()=>Navigator.of(context).pop(), child: Text("Cancel")),
            FlatButton(onPressed: ()=>Navigator.of(context).pop(), child: Text("Ok"))
          ],
        );
      } ,
    );
  }
}