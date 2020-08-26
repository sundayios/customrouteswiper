import 'package:aoyanews/style.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:easy_localization/easy_localization.dart';
import 'tail_btn.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // int _currentTabIndex = 0;
  TextEditingController _phoneEditCtrl;
  CountdownController _countdownCtrl;
  bool _isPwdMode = true;

  @override
  void initState() {
    super.initState();
    _phoneEditCtrl = TextEditingController();
    _countdownCtrl = CountdownController();
  }

  @override
  void dispose() {
    _countdownCtrl.dispose();
    _phoneEditCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                // color: Colors.white,
              ),
              onPressed: () {}),
          elevation: 0,
          // backgroundColor: Theme.of(context).accentColor,
          // title: Text('Basic AppBar'),
          actions: <Widget>[
            FlatButton(
              child: Text("密码登录".tr(),
                  style: Theme.of(context).textTheme.subtitle1),
              onPressed: () {},
            )
            // new IconButton(
            //   // action button
            //   icon: new Icon(Icons.fast_forward),
            //   onPressed: () {},
            // ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(),
                  flex: 1,
                ),
                Text("火星财经", style: Theme.of(context).textTheme.headline4),
                SizedBox(
                  height: 15,
                ),
                Text("短信验证码登录注册",
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(fontSize: 16)),
                Expanded(
                  child: Container(),
                  flex: 1,
                ),
                Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        InputRow(
                          hintText: "请输入手机号码",
                          controller: _phoneEditCtrl,
                          textInputType: TextInputType.phone,
                        ),
                        InputRow(
                          hintText: "请输入验证码",
                          controller: _phoneEditCtrl,
                          textInputType: TextInputType.visiblePassword,
                          tail: _isPwdMode
                              ? TailButton(
                                  getTitle: (_) => "忘记密码?",
                                  onTap: () {
                                    // Router.pushRestPassword(context);
                                  },
                                )
                              : TailButton(
                                  getTitle: (countdown) => countdown <= 0
                                      ? "发送验证码"
                                      : "$countdown 秒后重试",
                                  countdownController: _countdownCtrl,
                                  // onTap: _sendSMS,
                                ),
                        ),
                      ]),
                ),
                Expanded(
                  child: Container(),
                  flex: 1,
                ),
                MaterialButton(
                    minWidth: double.infinity,
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text(
                      "登录",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () {}),
                Expanded(
                  child: Container(),
                  flex: 2,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('第三方登录',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              CustomPaint(
                                size: Size(ScreenUtil().getWidth(140), 2),
                                painter: CLinePainter(1, Colors.grey),
                              ),
                              Icon(Icons.message),
                              CustomPaint(
                                size: Size(ScreenUtil().getWidth(140), 2),
                                painter: CLinePainter(1, Colors.grey),
                              )
                            ],
                          ),
                        ]),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Container(),
                  flex: 1,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: RichText(
                    text: TextSpan(
                      text: '登陆注册即视为同意',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(fontSize: 12),
                      children: [
                        TextSpan(
                          text: '《火星财经用户服务及隐私协议》',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(color: AppColors.app_main),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('点击了隐私政策');
                            },
                        ),
                      ],
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}

class InputRow extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final Widget tail;

  const InputRow({
    Key key,
    this.hintText,
    this.controller,
    this.textInputType,
    this.tail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget w;
    w = TextField(
      controller: controller,
      keyboardType: textInputType,
      style: TextStyle(
        fontSize: 14,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        // borderSize:
        // hintStyle: TextStyle(
        //   color: ,
        //   fontSize: 12,
        // ),
      ),
    );
    if (tail != null) {
      w = Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: <Widget>[w, tail],
      );
    }
    // w = Expanded(
    //   child: w,
    // );
    // Row(
    //   children: <Widget>[

    //   ],
    // );
    w = Container(
      child: w,
      height: 50,
      // padding: EdgeInsets.only(
      //   left: AppDimensions.pad,
      //   right: AppDimensions.lagerPad,
      // ),
      decoration: BoxDecoration(color: Colors.white),
    );
    return w;
  }
}

class CLinePainter extends CustomPainter {
  double lineWidth;
  Color lineColor;
  CLinePainter(this.lineWidth, this.lineColor);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..strokeWidth = lineWidth
      ..isAntiAlias = true
      ..color = lineColor;
    var max = size.width;
    var dashWidth = 5;
    var dashSpace = 5;
    double startX = 0;
    final space = (dashSpace + dashWidth);
    while (startX < max) {
      canvas.drawLine(Offset(startX, size.height / 2.0),
          Offset(startX + dashWidth, size.height / 2.0), paint);
      startX += space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
