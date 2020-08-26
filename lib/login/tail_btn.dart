import 'package:flutter/material.dart';
// import 'package:VPN/widgets/index.dart';

class CountdownController extends ValueNotifier<int> {
  static final _countDownFrom = 60;

  CountdownController() : super(0);

  Future countdown() async {
    value = _countDownFrom;
    while (value > 0) {
      await Future.delayed(Duration(seconds: 1));
      value = value - 1;
    }
  }

  @override
  void dispose() {
    value = 0;
    super.dispose();
  }
}

typedef String GetTitle(int countdown);

class TailButton extends StatefulWidget {
  final GetTitle getTitle;
  final VoidCallback onTap;
  final CountdownController countdownController;

  const TailButton({
    Key key,
    @required this.getTitle,
    this.onTap,
    this.countdownController,
  }) : super(key: key);

  @override
  _TailButtonState createState() => _TailButtonState();
}

class _TailButtonState extends State<TailButton> {
  VoidCallback _countdownListener;

  @override
  void initState() {
    super.initState();
    _countdownListener = () {
      setState(() {});
    };
    widget.countdownController?.addListener(_countdownListener);
  }

  @override
  void didUpdateWidget(TailButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.countdownController != widget.countdownController) {
      oldWidget.countdownController?.removeListener(_countdownListener);
      widget.countdownController?.addListener(_countdownListener);
    }
  }

  @override
  void dispose() {
    widget.countdownController?.removeListener(_countdownListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final countdown = widget.countdownController?.value;
    final isEnabled = countdown == null || (countdown <= 0);
    final color = isEnabled ? Theme.of(context).accentColor : Colors.grey[600];

    Widget w;
    w = GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: EdgeInsets.only(top: 5),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: color, width: 1),
        ),
        child: Text(
          widget.getTitle(countdown),
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
      onTap: isEnabled ? widget.onTap : null,
    );
    return w;
  }
}
