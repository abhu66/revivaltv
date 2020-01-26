import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revival_tv/models/Product.dart';
import 'package:revival_tv/screen/screen_detil_product.dart';

class WidgetProduct extends StatelessWidget {
  final Product data;
  const WidgetProduct({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double coverSize = 110;
    return Column(
      children: <Widget>[
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Stack(
              fit: StackFit.passthrough,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new ScreenDetailProduct(product: data,)
                        )
                    );
                  },
                  child:  Image.asset(
                    this.data.img,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: coverSize / 2,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Color.fromARGB(100, 0, 0, 0)
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: <Widget>[
//                        Icon(
//                          Icons.play_arrow,
//                          color: Colors.white,
//                          size: 13,
//                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Text(
                        data.price,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                !this.data.needPromo ? null : Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(5, 2, 10, 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        bottomRight: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                          colors: [Color(0xFFA17551), Color(0xFFCCBEB5)]),
                    ),
                    child: Text(
                      'New',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ].where((item) => item != null).toList(),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 5)),
        SizedBox(
          height: 40,
          child: Text(
            this.data.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xFF333333),
            ),
          ),
        ),
      ],
    );
  }
}