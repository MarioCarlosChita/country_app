import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:nod_express/Settting/Country.dart';
import 'package:nod_express/Settting/Setting.dart';


class MenuIndex extends StatefulWidget{
   PageIndex createState()=> PageIndex();
}

class PageIndex extends State<MenuIndex>{
  List<Country> lista = [];

  @override
  void initState() {
    Setting.getAll().then((countries){
         setState(() {
             lista  = countries;
         });
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
           leading: IconButton(icon: Icon(
               Icons.arrow_back_ios , size: 23, color: Colors.black,),
               onPressed: (){} ,

           ),
           title: Text("ForCountries" , style: TextStyle(
               color: Colors.black ,
               fontSize:18 ,
               fontWeight: FontWeight.bold,
           ),),
           actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.menu , size: 23, color: Colors.black,),
                 onPressed: (){},
              )
           ],
           backgroundColor: Colors.yellowAccent,
           centerTitle: true,
           elevation: 0,
      ),
        body: lista.length  ==0 ?
             Center(
                child: Loading(
                    indicator: BallPulseIndicator(),
                    size: 100.0,color: Colors.yellow
                ),
             ):Container(
          padding: EdgeInsets.only(
              top: 10 ,
              left: 10 ,
              right: 10 ,
          ),
          width: double.maxFinite,
          height: double.maxFinite,

          child: GridView.count(
            primary: true,
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            shrinkWrap: true,
            childAspectRatio:1,
            
            children: List.generate(lista.length, (index) {
              return InkWell(
                 onTap: (){},
                 child:Container(
                width: 60,
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.network(
                      lista[index].flag,
                      width: 30,
                      height: 30,
                      semanticsLabel: 'A shark?!',
                      placeholderBuilder: (BuildContext context) => Container(
                          padding: const EdgeInsets.all(30.0),
                          child: const CircularProgressIndicator(backgroundColor: Colors.yellowAccent,)),
                    ),
                    SizedBox(height: 5,),
                    Text(lista[index].nome , style: TextStyle(
                      color: Colors.black  ,
                      fontWeight: FontWeight.bold ,
                      fontSize: 9,
                    ),),
                    SizedBox(height:4,),
                    Text('Capital:'+lista[index].capital , style: TextStyle(
                      color: Colors.grey ,
                      fontSize: 9,

                    ),)
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white ,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5) ,

                    )
                ),
                margin: EdgeInsets.only(
                  bottom: 10 ,

                ),
              ),);
            }),
          )
        ),
    );
  }
}