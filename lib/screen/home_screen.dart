import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revival_tv/tab_tournament.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home:  MyHomePage(title: 'BottomNavigationBar Sample'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  String titleName = '';

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 7, vsync: this);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child:  AppBar(
            flexibleSpace: SafeArea(
              child: getTabBar(),
            ),
          ),
        ),
        body: getTabBarPages());
  }

  Widget getTabBar() {
    return TabBar(controller: _tabController, tabs: [
      Tab(child: Text('Live',style: TextStyle(fontSize: 10.0),),icon: Icon(Icons.timer),),
      Tab(child: Text('SUN',style: TextStyle(fontSize: 10.0),)),
      Tab(child: Text('MON',style: TextStyle(fontSize: 10.0),)),
      Tab(child: Text('TUE',style: TextStyle(fontSize: 10.0),)),
      Tab(child: Text('WED',style: TextStyle(fontSize: 10.0),)),
      Tab(child: Text('THU',style: TextStyle(fontSize: 10.0),)),
      Tab(child: Text('Date',style: TextStyle(fontSize: 10.0),),icon: Icon(Icons.calendar_today)),
    ]);
  }

  Widget getTabBarPages() {
    return TabBarView(controller: _tabController, children: <Widget>[
     TabTournament(),
      Container(color: Colors.green),
      Container(color: Colors.blue),
      Container(color: Colors.red),
      Container(color: Colors.green),
      Container(color: Colors.blue),
      Container(color: Colors.blue),
    ]);
  }
}
