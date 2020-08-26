import 'package:flutter/material.dart';

class MarketTabPage extends StatefulWidget {
  MarketTabPage({Key key}) : super(key: key);

  @override
  _MarketTabPageState createState() => _MarketTabPageState();
}

class _MarketTabPageState extends State<MarketTabPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        children: <Widget>[
          Text('overline  10  normal  gray',
              style: Theme.of(context).textTheme.overline),
        ],
      ),
    );
  }
}
