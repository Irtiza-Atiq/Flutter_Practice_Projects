// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter_application_1/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/left_bar.dart';
import 'package:flutter_application_1/Widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController= TextEditingController();
   TextEditingController _weightController= TextEditingController();
   double _bmiresult=0;
   String _textResult="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(

        title: Text(
          "\t\t\t\t\t\t~~BMI Calculator~~\n(Project copied By Irtiza :D )",
          style: TextStyle(color: accentHexColor,fontWeight: FontWeight.w300, ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
         backgroundColor: mainHexColor,
         body:  SingleChildScrollView(
child: Column(
  children:
  [
    SizedBox(height:20,),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width:130,
          child : TextField(
            controller: _heightController,
            style:TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.w300,
color: accentHexColor
            ),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Height",
               hintStyle: TextStyle(
                fontSize: 42,
                fontWeight:  FontWeight.w300,
                color: hintColor.withOpacity(0.8)
              )

            ),
          ),
          ),
          Container(
          width:130,
          child : TextField(
            controller: _weightController,
            style:TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.w300,
color: accentHexColor
            ),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Weight",
              hintStyle: TextStyle(
                fontSize: 42,
                fontWeight:  FontWeight.w300,
                color: hintColor.withOpacity(0.8)
              )

            ),
          ),
          ),
      ],

    ),
    SizedBox(height:30),
    GestureDetector(
      onTap: (){
double _h= double.parse(_heightController.text);
double _w= double.parse(_weightController.text);

setState(() {
  _bmiresult = _w / (_h*_h);
  if(_bmiresult>25){
    _textResult="You're OverWeight Fatto!";
  }
  else if(_bmiresult >=18.5 && _bmiresult <=25)
  {
    _textResult="You have Normal Weight";
  }
  else 
  {
    _textResult="You're under Weight";

  }
});
      },
      child: Container(
        child: Text("Calculate",style : TextStyle(fontSize:22, fontWeight: FontWeight.bold, color: accentHexColor),)
      ),
    ),
    SizedBox(height:50),
    Container(
      child: Text(_bmiresult.toStringAsFixed(2),style: TextStyle(fontSize: 90,color: accentHexColor),)
    ),
    SizedBox(height:30),
    Visibility(
      visible: _textResult.isNotEmpty,
      child: 
     Container(
      child: Text(_textResult,style : TextStyle(fontSize:32, fontWeight: FontWeight.w400, color: accentHexColor),)
    ),
    ),
   
    SizedBox(
      height:10
      ),
    LeftBar(
      barWidth: 20
      ),
    SizedBox(
      height:10
      ),
    
     LeftBar(
      barWidth: 60
      ),
    SizedBox(
      height:10
      ),
    LeftBar(
      barWidth: 20
      ),

     SizedBox(
      height:10
      ),
    RightBar(
      barWidth: 20
      ),
    SizedBox(
      height:10
      ),
    
   RightBar(
    barWidth: 60
    ),
    SizedBox(
      height:10
      ),
   RightBar(
    barWidth: 20
    ),
    

  ]
),
         ),
    );
    
  }
}