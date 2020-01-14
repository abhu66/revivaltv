
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:revival_tv/bottom_menu.dart';
import 'package:revival_tv/screen/home_screen.dart';
import 'package:revival_tv/screen/sho_screen.dart';



class MainScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainAppState();
  }
}

class _MainAppState extends State<MainScreen> with TickerProviderStateMixin{

  static const TextStyle styleListText =
  TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white);

  bool _isDown = true;
  String titleName = '';
  int _currentIndexBottomMenu = 0;

  final listGameTitle = [
    'MOBA',
    'Role Playing Game (RPG)',
    'Third Person Shooter (TPS)',
    'Strategy',
    'Simulation',
    'Tycoon',
    'Racing',
    'Action Adventure',
    'Arcade',
    'Fighting Game',
    'Sports',
    'Action'
  ];
  final icons = [
    Icons.games,
    Icons.gamepad,
    Icons.videogame_asset,
    Icons.data_usage,
    Icons.directions_bus,
    Icons.directions_run,
    Icons.directions_subway,
    Icons.directions_transit,
    Icons.directions_walk,
    Icons.repeat,
    Icons.accessibility,
    Icons.repeat
  ];

  final drawerItem = [
    DrawerItem("Home",Icons.home),
    DrawerItem("Featured",Icons.stars),
    DrawerItem("News",Icons.new_releases),
    DrawerItem("Games",Icons.videogame_asset),
    DrawerItem("Profile",Icons.account_circle),
    DrawerItem("Opini",Icons.comment),
    DrawerItem("Videos",Icons.ondemand_video),
    DrawerItem("Shop",Icons.shopping_cart),
  ];

  int _selectedDrawerIndex = 0;
  int _selectedIndex = 0;
  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    if(index == 7){
      Navigator.of(context).pop(false);
    }
    else {
      Navigator.of(context).pop();
    }
    // close the drawer
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onSelectTitleItem(String string) {
    setState(() {});
  }

  int _selectedIndexTitlte = 0;



  _onSelected(int index) {
    setState(() {
      _selectedIndexTitlte = index;
      titleName = listGameTitle[index];
      if (_isDown == false) {
        _isDown = true;
      } else {
        _isDown = false;
      }
    });
  }

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new MyApp();
      case 1:
        return new Text("Belum Tersedia");
      case 2:
        return new Text("Belum Tersedia");
      case 3:
        return new Text("Belum Tersedia");
      case 4:
        return new Text("Belum Tersedia");
      case 5:
        return new Text("Belum Tersedia");
      case 6:
        return new Text("Belum Tersedia");
      case 7:
        return SchedulerBinding.instance.addPostFrameCallback((_) {
          // add your code here.
          Navigator.pushReplacement(
              context,
              new MaterialPageRoute(
                  builder: (context) => new Shop()));
        });
      default:
        return new Text("Error");
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

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
            leading: new Icon(d.icon,size: 20.0,color: Colors.white,),
            title: new Text(d.title,style: TextStyle(fontSize: 10.0,color: Colors.white),),
//              trailing: new Icon(Icons.arrow_forward_ios,color: Colors.white,size: 20.0,),
            selected: i == _selectedDrawerIndex,
            onTap: () {
              print("Dtasdasad $i");
              _onSelectItem(i);
            },
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        bottomOpacity: 0.1,
        elevation: 1.0,
        centerTitle: true,
        title: Container(
          padding: EdgeInsets.only(top: 10.0),
          child: FlatButton(
            onPressed: () {
              setState(() {
                if (_isDown == false) {
                  _isDown = true;
                } else {
                  _isDown = false;
                }
              });
            },
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  titleName == '' ? listGameTitle[0].toString() : '$titleName',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  _isDown == true
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_up,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          _getDrawerItemWidget(_selectedDrawerIndex),
          Container(
            child: Visibility(
              visible: _isDown == false ? true : false,
              child: Container(
                height: 350.0,
                decoration: BoxDecoration(color: Colors.black),
                child: ListView.separated(
                  itemCount: listGameTitle.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: _selectedIndexTitlte != null &&
                          _selectedIndexTitlte == index
                          ? Colors.grey.withOpacity(0.6)
                          : Colors.black,
                      child: ListTile(
                        leading: Icon(
                          icons[index],
                          color: Colors.white,
                        ),
                        title: Text(
                          listGameTitle[index],
                          style: styleListText,
                        ),
                        onTap: () => _onSelected(index),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.white,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(color: Colors.black,
          child : Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 55.0,
                      child:DrawerHeader(
                        child: Column(
                          children: <Widget>[
                            Text('RevivalTV',style: TextStyle(color: Colors.white,fontSize: 14.0),textAlign: TextAlign.center,),
                            Text('MENU',style: TextStyle(color: Colors.amber[800],fontSize: 10.0),textAlign: TextAlign.center,),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
//                        image: DecorationImage(
//                            image: AssetImage("assets/images/logo_login.png"),
//                            fit: BoxFit.cover)
                        ),
                      ),
                    ),
                    new Column(children: drawerOptions,)
                  ],
                ),
              ),
              Container(
                height: 80.0,
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Spacer(),
                            Image.asset("assets/icons/logo_white_type.png",scale: 40.0,),
                            Spacer(),
                            Container(
                              width: 1,
                              height: 50.0,
                              color: Colors.grey,
                            ),
                            Spacer(),
                            Image.asset("assets/icons/icon_revival_red.png",scale: 80.0,),
                            Spacer(),
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: _currentIndexBottomMenu,
        onTap: (int index){
          setState(() {
            _currentIndexBottomMenu = index;
          });
        },
        items: allDestinations.map((Destination destination){
          return BottomNavigationBarItem(
            icon: Icon(destination.icon),
            backgroundColor: destination.color,
            title: Text(destination.title),
          );
        }).toList(),
      ),
    );
  }
}