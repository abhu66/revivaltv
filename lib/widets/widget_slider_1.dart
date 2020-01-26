import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:revival_tv/models/Product.dart';

class WidgetSlider1 extends StatefulWidget {

  WidgetSlider1({Key key,this.products}) :super(key:key);
  final List<dynamic> products;


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WidgetSlider1State();
  }
}

class _WidgetSlider1State extends State<WidgetSlider1> {
  final controller = PageController(viewportFraction: 0.8);
  final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];



  List<dynamic> productList;
  @override
  void initState(){
    super.initState();
    productList = widget.products;
  }

  final Widget placeholder = Container(color: Colors.grey);
  int _current = 0;

  List<T> map<T>(List<dynamic> list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
   return Column(children: [CarouselSlider(
     items: productList.map((i) {
       return Builder(
         builder: (BuildContext context) {
           return Container(
             margin: EdgeInsets.all(5.0),
             child: ClipRRect(
               borderRadius: BorderRadius.all(Radius.circular(5.0)),
               child: Stack(children: <Widget>[
                 Image.asset(i.img, fit: BoxFit.cover, width: 1000.0),
                 Positioned(
                   bottom: 0.0,
                   left: 0.0,
                   right: 0.0,
                   child: Container(
                     decoration: BoxDecoration(
                       gradient: LinearGradient(
                         colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                         begin: Alignment.bottomCenter,
                         end: Alignment.topCenter,
                       ),
                     ),
                     padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                     child: ListTile(
                      title:  Text(i.title,
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 20.0,
                           fontWeight: FontWeight.bold,
                         ),
                     ),
                       subtitle: Text(i.desc,
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 12.0,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                   ),
                 ),
                 ),
               ],
               ),
             ),
           );
         },
       );
     }).toList(),
     autoPlay: true,
     enlargeCenterPage: true,
     aspectRatio: 2.0,
     onPageChanged: (index) {
       setState(() {
         _current = index;
       });
     },
   ),
     Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: map<Widget>(
         productList,
             (index, url) {
           return Container(
             width: 8.0,
             height: 8.0,
             margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
             decoration: BoxDecoration(
                 shape: BoxShape.circle,
                 color: _current == index
                     ? Color.fromRGBO(0, 0, 0, 0.9)
                     : Color.fromRGBO(0, 0, 0, 0.4)),
           );
         },
       ),
     ),
   ]);
  }
}

