


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Shop extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ShopState();
  }
}

class _ShopState extends State<Shop>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("RVL",style: TextStyle(color: Colors.black),),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.menu,color: Colors.black,),)
        ],
      ),
      body: Center(child: Text("Ini Menu sho"),),
    );
  }
}