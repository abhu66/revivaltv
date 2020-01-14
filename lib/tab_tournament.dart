



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

List listTournamentMoba = [
  {'name': 'Mobile Legend', 'date': '07/01/2019','p1':'Abu Khoerul','p2':'Said',},
  {'name': 'Arena of Valor', 'date': '06/01/2019','p1':'Abu Khoerul','p2':'Said'},
  {'name': 'Vainglory', 'date': '06/01/2019','p1':'Abu Khoerul','p2':'Said'},
  {'name': 'League of Legends', 'date': '05/01/2019','p1':'Abu Khoerul','p2':'Said'},
  {'name': 'Heroes Evolved', 'date': '07/01/2019','p1':'Abu Khoerul','p2':'Said'},
  {'name': 'Dota 2', 'date': '07/01/2019','p1':'Abu Khoerul','p2':'Said'},
  {'name': 'Dota 2', 'date': '07/01/2019','p1':'Abu Khoerul','p2':'Said'},
  {'name': 'Onmyoji Arena', 'date': '05/01/2019','p1':'Abu Khoerul','p2':'Said'},
  {'name': 'Mobile Legend', 'date': '07/01/2019','p1':'Abu Khoerul','p2':'Said'},
  {'name': 'Heroes of Soulcraft', 'date': '07/01/2019','p1':'Abu Khoerul','p2':'Said'},
  {'name': 'Legendary Heroes', 'date': '07/01/2019','p1':'Abu Khoerul','p2':'Said'},
  {'name': 'Legendary Heroes', 'date': '07/01/2019','p1':'Abu Khoerul','p2':'Said'},
];

List listTournamentRpg = [
  {'name': 'Laplace M', 'date': '07/01/2019','p1':'Abu Khoerul','p2':'Said',},
  {'name': 'Ragnarok M:', 'date': '06/01/2019','p1':'Abu Khoerul','p2':'Said'},
  {'name': 'Lineage2 Revolution', 'date': '06/01/2019','p1':'Abu Khoerul','p2':'Said'},
  {'name': 'GrandChase', 'date': '05/01/2019','p1':'Abu Khoerul','p2':'Said'},
  {'name': 'Assassin of Berkel', 'date': '07/01/2019','p1':'Abu Khoerul','p2':'Said'},
  {'name': 'Assassin of Berkel', 'date': '07/04/2019','p1':'Abu Khoerul','p2':'Said'},
  {'name': 'Darkness Rises', 'date': '07/01/2019','p1':'Abu Khoerul','p2':'Said'},
  {'name': 'Destiny Knights', 'date': '05/01/2019','p1':'Abu Khoerul','p2':'Said'},
  {'name': 'Destiny Knights', 'date': '07/01/2019','p1':'Abu Khoerul','p2':'Said'},
  {'name': 'GrandChase', 'date': '07/01/2019','p1':'Abu Khoerul','p2':'Said'},
  {'name': 'Darkness Rises', 'date': '07/01/2019','p1':'Abu Khoerul','p2':'Said'},
  {'name': 'Destiny Knights', 'date': '07/01/2019','p1':'Abu Khoerul','p2':'Said'},
];

List allTournament = [];

class TabTournament extends StatelessWidget{
  final String gameType;
  TabTournament({Key key, this.gameType}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
          onRefresh: _handleRefresh,
          child:_buildGroupListHistory(gameType == 'MOBA' ? listTournamentMoba : listTournamentRpg)
      ) ,
    );
  }
  Widget _buildGroupListHistory(List<dynamic> allTournament){
    allTournament = allTournament;
    return GroupedListView(
        elements: allTournament,
        groupBy: (elements) => elements['name'] +'-'+elements['date'],
        groupSeparatorBuilder: _buildGroupSeparator,
        sort: false,
        itemBuilder: (context,elements) {
          return ListTile(
            leading: Icon(Icons.videogame_asset),
            title: Text(elements['p1'],style: TextStyle(color: Colors.black,fontSize: 12.0),),
            subtitle: Text(elements['p2'],style: TextStyle(color: Colors.black,fontSize: 12.0),),
            trailing: Icon(Icons.arrow_forward_ios,color: Colors.red,size: 20.0,),
            onTap: () {
            }
          );
        }
    );
  }
  Widget _buildGroupSeparator(dynamic groupByValue) {
    return Container(
      height: 45.0,
      color: Colors.red,
      margin: EdgeInsets.only(top:1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text('$groupByValue'.split("-").removeAt(0),
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
          Text("$groupByValue".split("-").removeAt(1),
              style: TextStyle(
                fontSize: 10.0,
                color: Colors.white,
              )),
        ],
      ),
      padding: EdgeInsets.all(10.0),
    );
  }

  Future<Null> _handleRefresh() async {
    return null;
  }
}