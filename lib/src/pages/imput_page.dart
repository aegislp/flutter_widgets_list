import 'package:flutter/material.dart';


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String  _nombre = "";
  DateTime _fecha;

  String _opcionSeleccionada = 'Volar';

  TextEditingController fechaController = new TextEditingController();

  List<String> _poderes = ['Volar','Correr'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs Pages'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          _crearInput1(),
          SizedBox(),
          _createInput2(),
          SizedBox(),
          _createInputEmail(),
          Divider(),
          _createFecha(),
          Divider(),
          _createMenu()

        ],
      ),
    );
  }

  Widget _crearInput1() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        counter: Text("Letras ${ _nombre.length  }"),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Eje: Luis MElo',
        labelText: 'Nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (valor){
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

 Widget _createInput2() {
   return ListTile(
     title: Text('Nombre: $_nombre'),
   );
 }

  Widget _createInputEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        counter: Text("Letras ${ _nombre.length }"),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Eje: Luis MElo',
        labelText: 'Email',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (valor){
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _createFecha() {
    return TextField(
          keyboardType: TextInputType.datetime,
          controller: fechaController,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Fecha Nacimiento',
            labelText: 'Fecha Nacimiento',
            suffixIcon: Icon(Icons.calendar_view_day),
            icon: Icon(Icons.calendar_today)
          ),
          onTap: (){
            FocusScope.of(context).requestFocus(new FocusNode());
            _setDatePciker(context);
          },
        );
  }

  _setDatePciker(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: new DateTime(2018), 
      lastDate: new DateTime(2021)
    );

    if(picked != null){
      setState(() {
        _fecha = picked;
        fechaController.text = _fecha.toString();
      });
    }
  }

 List<DropdownMenuItem<String>> _getDropItems(){
    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach((poder){
      lista.add(new DropdownMenuItem(child: Text(poder),value: poder,));
    });

    return lista;


 }
 Widget _createMenu() {
    return DropdownButton(
      value: _opcionSeleccionada,
      items: _getDropItems(), 
      onChanged: (opt){
        setState(() {
          _opcionSeleccionada = opt;
        });
      }
    );
 }
}