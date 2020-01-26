




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revival_tv/models/Product.dart';

class ScreenDetailProduct extends StatefulWidget{

  ScreenDetailProduct({Key key, this.product}) : super(key:key);
  final Product product;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ScreenDetailProductState();
  }
}

class _ScreenDetailProductState extends State<ScreenDetailProduct>{

  List<dynamic> thumbnail = <Thumbnail>[
    Thumbnail(title:"Thumbnail 1",img: "assets/lanyard/thumbnail_1.jpg"),
    Thumbnail(title:"Thumbnail 2",img: "assets/lanyard/thumbnail_2.jpg"),
    Thumbnail(title:"Thumbnail 3",img: "assets/lanyard/thumbnail_3.jpg"),
  ];

  String initImage;

  @override
  void initState(){
    super.initState();
    initImage = widget.product.img;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),),
        title: Text(widget.product.title,style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(child:
      Container(
        child: Column(
          children: <Widget>[
            Container(height:300,
             child: Center(child:Image.asset(initImage),),),
             Container(
               height: 100,
               alignment: Alignment.center,
                child: ListView.builder(
                    itemCount: thumbnail.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Center(child :
                         GestureDetector(
                           onTap: () {
                             setState(() {
                               initImage = thumbnail[index].img.toString();
                             });
                           },
                           child: Image.asset(thumbnail[index].img.toString()),
                         ),
                        ),
                      );
                    },
              ),
             ),
            renderHeader(),
            Text(
              "\""+widget.product.title+"\"",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),
            Text(
              "Rp"+widget.product.price,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),
            Text(
              widget.product.desc,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),

               ],
        ),
      ),),
    );
  }
  Widget renderHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Detail Product',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
        ],
      ),
    );
  }

}

class Thumbnail {
  String title;
  String img;
  Thumbnail({this.title,this.img});
}