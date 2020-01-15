


import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DrawerItemShop {
  String title;
  IconData icon;
  DrawerItemShop(this.title, this.icon);
}

class Shop extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ShopState();
  }
}

class _ShopState extends State<Shop>{
  TextEditingController searchController = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final drawerItem = [
    DrawerItemShop("BLOG",Icons.timeline),
    DrawerItemShop("WISHLIST",Icons.stars),
  ];

  int _selectedDrawerIndex = 0;
  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
      Navigator.of(context).pop();
    // close the drawer
  }


  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new Text("Belum Tersedia");
      case 1:
        return new Text("Belum Tersedia");
      case 2:
        return new Text("Belum Tersedia");
      default:
        return new Text("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var drawerOptions = <Widget>[];
    for (var i = 0; i < drawerItem.length; i++) {
      var d = drawerItem[i];
      drawerOptions.add(
        Container(
          height: 50.0,
          decoration:  BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey.withOpacity(0.4),
              ),
            ),
          ),
          child: new ListTile(
            leading: new Icon(d.icon,size: 20.0,color: Colors.black,),
            title: new Text(d.title,style: TextStyle(fontSize: 10.0,color: Colors.black),),
//              trailing: new Icon(Icons.arrow_forward_ios,color: Colors.white,size: 20.0,),
            selected: i == _selectedDrawerIndex,
            onTap: () {
              _onSelectItem(i);
            },
          ),
        ),
      );
    }
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Container(
          height: 100.0,
            padding: EdgeInsets.only(left: 10.0),
            child : ImageIcon(
              AssetImage("assets/icons/logo_revival_shop.png"),
              size: 50.0,
              color: Colors.black,
            ),
        ),
        actions: <Widget>[

          Badge(
            badgeColor: Colors.black,
            position: BadgePosition.topRight(top:5, right: 5),
            badgeContent: Text('0',style: TextStyle(color: Colors.white),),
            child:  IconButton(icon: Icon(Icons.favorite_border,color: Colors.black,),
              onPressed: (){},
            ),
          ),
          Badge(
            badgeColor: Colors.black,
            position: BadgePosition.topRight(top:5, right: 5),
            badgeContent: Text('2',style: TextStyle(color: Colors.white)),
            child:  IconButton(
              icon: Icon(Icons.shopping_basket,color: Colors.black,),
              onPressed: (){
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.menu,color:  Colors.black,),
            onPressed: () {
                  _scaffoldKey.currentState.openEndDrawer();
            },
          )
        ],
      ),
      body: Center(child : _getDrawerItemWidget(_selectedDrawerIndex)),
      endDrawer: Drawer(
        child: Container(color: Colors.white,
          child : Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Container(
                      child: new TextField(
                        controller: searchController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.black,fontSize: 12.0),
                          suffixIcon: Icon(Icons.search,color: Colors.black,),
                          hintText: 'Search for Product',
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          )
                        ),
                      ),
                    ),
                    new Column(children: drawerOptions,)
                  ],
                ),
              ),
              Container(
                height: 100.0,
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Image.asset("assets/icons/logo_white_type.png", fit: BoxFit.contain,scale: 40.0,),
                            Container(
                              width: 1.0,
                              height: 50.0,
                              color: Colors.grey,
                            ),
                            Image.asset("assets/icons/logo_white_type.png",fit: BoxFit.contain,scale: 40.0,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}