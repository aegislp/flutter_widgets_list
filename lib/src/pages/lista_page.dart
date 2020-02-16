import 'dart:async';

import 'package:flutter/material.dart';


class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  final lista = new List();
  int _ultimovalor = 0;
  ScrollController _scrollController = new ScrollController();
  bool _isloading = false;

  @override
  void initState() { 
    super.initState();
    _agregar10();

    _scrollController.addListener((){

      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        fetchdata();
      }
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider Page")
      ),
      body: Stack(
        children: <Widget>[
          _createLista(),
          _createLoading()
        ], 
      ),
    );
  }

  Widget _createLista() {
    return RefreshIndicator(
        onRefresh: obtenerPagina1,
        child: ListView.builder(
        controller: _scrollController,
        itemCount: lista.length,
        itemBuilder: (BuildContext context, int index){
          final int image = lista[index];

          return FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'), 
            image: NetworkImage('https://picsum.photos/500/300/?image=$image'),
            fit: BoxFit.contain,
          );
        }
      ),
    );
  }
  void _agregar10(){

    for (var i = 1; i < 10; i++) {
      _ultimovalor++;
      lista.add(_ultimovalor);
    }

    setState(() {
      
    });
  }

  Future fetchdata() async {
    _isloading = true;
    setState(() {});
    return Timer(new Duration(seconds: 2),repuestaHttp);
  }

  void repuestaHttp() {
    _isloading = false;
    _agregar10();
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: Duration(milliseconds: 600),
      curve: Curves.fastOutSlowIn
    );
  }

  Widget _createLoading() {
    if(_isloading){
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              CircularProgressIndicator(
                backgroundColor: Colors.pink,
                
              ),
            ], 
          ),
          SizedBox(height: 15.00,)
        ],
      );
    }else{
      return Container();
    }
  }

  Future<void> obtenerPagina1() {

    final duration = Duration(seconds: 2);

    new Timer(duration, (){
      lista.clear();
      _ultimovalor++;
      _agregar10();
    });

    return Future.delayed(duration);
    

  }
}