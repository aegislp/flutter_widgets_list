import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _range = 0.0;
  double _rangc = 0.0;
  double _adaptivevalue = 10.0;
  RangeValues _selectedRange = new RangeValues(0.2, 0.8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SLider Page')
      ),
      body: Container(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _creadSlider(),
            Divider(),
            _createSlider2(),
            Divider(),
            _createSlider3(),
            Divider(),
            _createSlider4(),
            Divider(),
            _createIamge(),
          ],
        ),
      ),
    );
  }

  Widget _creadSlider() {

    return Slider(
      value: _range,
      onChanged: (newRating){
        print(newRating);
        setState(() {
          _range = newRating;
        });
      },
      min: 0,
      max: 20,
      divisions: 4,
      label: '$_range}',
    );
  }

  Widget _createSlider2() {
    return RangeSlider(
      values:  _selectedRange, 
      labels: RangeLabels("${_selectedRange.start}", "${_selectedRange.end}"),
      onChanged: (newRange){
        setState(() {
          _selectedRange = newRange;
        });
      },
      min: 0.0,
      max: 10.0,
      divisions: 4,
    );
  }

  Widget _createSlider3() {
    return CupertinoSlider(
      value: _rangc , 
      onChanged: (newRange){
        setState(() {
          _rangc = newRange;
        });
      },
      min: 0.0,
      max: 100.0,
      thumbColor: CupertinoColors.systemPink,
      activeColor: CupertinoColors.systemOrange,

    );
  }

  Widget _createSlider4() {
    return Slider.adaptive(
      min: 10.0,
      max: 300.0,
      divisions: 10,
      value: _adaptivevalue, 
      onChanged: (newValue){
        setState(() {
          _adaptivevalue = newValue;
        });
      },
      label: 'Tamaña de la imagen',
    );
  }

  Widget _createIamge() {
    return Expanded(
          child: Container(
        width: 300,
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: NetworkImage('https://files.cults3d.com/uploaders/13889723/illustration-file/eda93d07-e8cb-490b-9626-f3c719f2659a/231-2312516_thundercats-logo-logo-thundercats.png'),
              width: _adaptivevalue,
            ),
          ],
        ),
      ),
    );
  }
}