



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revival_tv/models/Product.dart';
import 'package:revival_tv/widets/widget_product.dart';

class WidgetGridProduct extends StatefulWidget{

  WidgetGridProduct({Key key, this.productList}) : super(key:key);

  final List<Product> productList;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WidgetGridProductState();
  }

}

class _WidgetGridProductState extends State<WidgetGridProduct>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          this.renderHeader(),
          this.renderBody(),
        ],
      ),
    );
  }

  Widget renderHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Product',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                'See All',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF666666),
                ),
              ),
              Icon(
                Icons.keyboard_arrow_right,
                size: 20,
                color: Color(0xFF999999),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget renderBody() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: widget.productList.length,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        return WidgetProduct(data: widget.productList[index],);
      },
    );
  }

}