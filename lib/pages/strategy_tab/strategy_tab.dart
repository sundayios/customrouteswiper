import 'package:flutter/material.dart';

class StrategyTabPage extends StatefulWidget {
  StrategyTabPage({Key key}) : super(key: key);

  @override
  _StrategyTabPageState createState() => _StrategyTabPageState();
}

class _StrategyTabPageState extends State<StrategyTabPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Text("qutesTab"),
    );
  }
}
