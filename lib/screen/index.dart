import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nod_express/Settting/Country.dart';
import 'package:nod_express/Settting/Setting.dart';
import 'package:nod_express/screen/MenuIndex.dart';


class Index extends StatefulWidget{
     Template createState()=>  Template();
}

class Template extends State<Index>{


  bool statebutton =  false;
  List<Country> lista = new List<Country>();

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
           backgroundColor: Colors.white,
           body:Container(
               width: double.maxFinite,
               height: double.maxFinite,
               alignment: Alignment.center,
               child:Stack(
                   overflow: Overflow.visible,
                   children: <Widget>[
                     Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget>[
                           Image.asset('assets/logo.png'),
                           SizedBox(height:50,) ,
                           ButtonTheme(
                             minWidth: 200,
                             height: 60,
                             child: FlatButton(
                               onPressed: (){
                                  setState(() {
                                      statebutton  = true;
                                  });
                                  // page next for next
                                  screenNext();
                               } ,
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(10) ,
                                 side: BorderSide(
                                     color: Colors.yellow
                                 )
                               ),
                               child: Text('Entrar' , style: TextStyle(
                                   color: Colors.black,
                                   fontSize: 14
                               ),),
                             ),
                           ) ,
                           SizedBox(height:20,) ,
                           Text('Discover all country ' , style: TextStyle(
                             color: Colors.grey ,
                             fontSize: 11,
                           ),)
                         ],
                       ),
                    statebutton ? Positioned(
                       top: 280,
                       left:160,
                       child: CircularProgressIndicator(
                         backgroundColor: Colors.yellow,
                       ),
                     ):Container(),
                   ],
               )
           ),
      );
  }



  void screenNext(){
      Future.delayed(Duration(seconds: 5), (){
         statebutton = false;
         Navigator.of(context).pushAndRemoveUntil(
             MaterialPageRoute(builder: (context)=> new MenuIndex()),
                 (Route<dynamic> r)=> false);
      });
  }


}

