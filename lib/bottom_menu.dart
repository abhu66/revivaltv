

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Destination {
  const Destination(this.title, this.icon, this.color);
  final String title;
  final IconData icon;
  final MaterialColor color;
}

const List<Destination> allDestinations = <Destination>[
  Destination('Scores', Icons.stars, Colors.grey),
  Destination('Explore', Icons.explore, Colors.grey),
  Destination('Favourites', Icons.favorite, Colors.grey),
  Destination('News', Icons.rss_feed, Colors.grey),
  Destination('Refresh', Icons.cached, Colors.grey)
];