import 'package:aoyanews/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:aoyanews/widgets/gif_indicator_example1.dart';
import 'package:aoyanews/utils/image_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:badges/badges.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MineTabPage extends StatefulWidget {
  MineTabPage({Key key}) : super(key: key);

  @override
  _MineTabPageState createState() => _MineTabPageState();
}

class _MineTabPageState extends State<MineTabPage> {
  RefreshController _controller = RefreshController();

  @override
  Widget build(BuildContext context) {
    final tsfirst = Theme.of(context).textTheme.headline6;
    final tsfirst_gray =
        Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.grey);
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        body: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: RefreshConfiguration.copyAncestor(
                context: context,
                enableBallisticLoad: false,
                footerTriggerDistance: -80,
                child: SmartRefresher(
                  controller: _controller,
                  enablePullUp: false,
                  enablePullDown: true,
                  header: GifHeader1(),
                  // footer: Container(),
                  onRefresh: () async {
                    await Future.delayed(Duration(milliseconds: 2000));
                    _controller.refreshCompleted();
                  },
                  onLoading: () async {
                    await Future.delayed(Duration(milliseconds: 2000));
                    _controller.loadFailed();
                  },
                  child: ListView(
                    // physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(top: 20),
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                                onTap: () {},
                                child: Hero(
                                  tag: "iconUrl",
                                  child: SizedBox(
                                    child: ClipOval(
                                      child: Image(
                                        image: ImageUtils.getImageProvider(
                                            "http://pic-bucket.ws.126.net/photo/0003/2020-08-26/FKUJU4PT00AJ0003NOS.jpg"),
                                      ),
                                    ),
                                    width: 64,
                                    height: 64,
                                  ),
                                )),
                            Expanded(
                              child: ListTile(
                                title: Text(
                                  tr('火星00EA'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(fontSize: 16),
                                ),
                                subtitle: Text(
                                  "介绍一下自己",
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(fontSize: 14),
                                ),
                                trailing: Container(
                                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(color: Colors.blue),
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                      children: [
                                        WidgetSpan(
                                            alignment:
                                                PlaceholderAlignment.middle,
                                            child: Icon(Icons.book)
                                            // Image.asset(
                                            //   'assets/noavatar.png',
                                            //   width: 20,
                                            //   height: 20,
                                            // ),
                                            ),
                                        TextSpan(
                                          text: "签到".tr(),
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.blue),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              print('');
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // leading: CircleAvatar(
                                //   backgroundImage: NetworkImage(imageUrl),
                                // ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) {
                                          return Text('title',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.black));
                                        },
                                        fullscreenDialog: true),
                                  );
                                },
                              ),
                              // ListTile(
                              //   title: RichText(
                              //       text: TextSpan(
                              //           text: "点击登录".tr(),
                              //           style: TextStyle(
                              //             color: Colors.orange,
                              //             fontSize: 14,
                              //           ),
                              //           recognizer: TapGestureRecognizer()
                              //             ..onTap = () {})),
                              //   trailing: RichText(
                              //       text: TextSpan(
                              //           text: "邀请好友".tr(),
                              //           style: TextStyle(
                              //             color: Colors.orange,
                              //             fontSize: 14,
                              //           ),
                              //           recognizer: TapGestureRecognizer()
                              //             ..onTap = () {})),
                              // ),
                            )
                          ],
                        ),
                        margin: EdgeInsets.only(left: 14, bottom: 10),
                      ),
                      Divider(
                        indent: 15,
                        endIndent: 15,
                        thickness: 0,
                      ),
                      Container(
                          color: Colors.white,
                          margin: EdgeInsets.only(top: 14, bottom: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FlatButton(
                                    onPressed: () {},
                                    child: Column(children: [
                                      Text("0".tr(), style: tsfirst),
                                      Text("发布".tr(), style: tsfirst_gray)
                                    ])),
                                FlatButton(
                                    onPressed: () {},
                                    child: Column(children: [
                                      Text("0".tr(), style: tsfirst),
                                      Text("收藏".tr(), style: tsfirst_gray)
                                    ])),
                                FlatButton(
                                    onPressed: () {},
                                    child: Column(children: [
                                      Text("0".tr(), style: tsfirst),
                                      Text("关注".tr(), style: tsfirst_gray)
                                    ])),
                                FlatButton(
                                    onPressed: () {},
                                    child: Column(children: [
                                      Text("0".tr(), style: tsfirst),
                                      Text("积分".tr(), style: tsfirst_gray)
                                    ])),
                              ])),
                      Divider(
                        height: 10,
                        thickness: 10,
                        color: Theme.of(context).accentColor,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: ScreenUtil().getWidth(10),
                            top: ScreenUtil().getWidth(10),
                            bottom: ScreenUtil().getWidth(10)),
                        child: Text(
                          "发现",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Divider(),
                      Container(
                        padding: EdgeInsets.only(
                            top: ScreenUtil().getWidth(10),
                            bottom: ScreenUtil().getWidth(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            funcButton('images/ic_logo.svg', "可可交易平台".tr(),
                                func: () {}),
                            funcButton('images/ic_logo.svg', "火行云矿".tr(),
                                func: () {}),
                            funcButton('images/ic_logo.svg', "火星交易大师",
                                func: () {}),
                          ],
                        ),
                      ),
                      Divider(
                        height: 10,
                        thickness: 10,
                        color: Theme.of(context).accentColor,
                      ),
                      listWidget("我的消息".tr()),
                      Divider(
                        height: 10,
                        thickness: 10,
                        color: Theme.of(context).accentColor,
                      ),
                      listWidget("推荐给好友".tr()),
                      listWidget("给我们评分".tr()),
                      listWidget("意见反馈".tr()),
                      listWidget("关于我们".tr()),
                      listWidget("检查更新".tr()),
                      // listWidget("我的消息".tr()),
                    ],
                  ),
                ))));
  }

  Widget funcButton(String iconUrl, String strTitle,
      {double iconSize = 30, double titleSize = 14, Function() func}) {
    return Material(
        child: GestureDetector(
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Image.asset(iconUrl,
              // fit: BoxFit.cover, width: iconSize, height: iconSize),
              SvgPicture.asset(
                iconUrl,
                width: iconSize,
                height: iconSize,
              ),
              SizedBox(
                height: 10,
              ),
              Text(strTitle, style: TextStyle(fontSize: 14)),
            ]),
      ),
      onTap: () {},
    ));
  }

  Widget listWidget(String leftTile, {int badgeNum = 0, Function callBack}) {
    return GestureDetector(
      child: Container(
          padding: EdgeInsets.fromLTRB(
              ScreenUtil().getWidth(10),
              ScreenUtil().getHeight(15),
              ScreenUtil().getWidth(10),
              ScreenUtil().getHeight(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Badge(
                badgeColor: Colors.red,
                shape: BadgeShape.circle,
                borderRadius: 12,
                toAnimate: true,
                animationType: BadgeAnimationType.fade,
                badgeContent: Text(""),
                showBadge: badgeNum != 0,
                child: Text(
                  leftTile,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).textTheme.caption.color,
              )
            ],
          )),
      onTap: () {
        callBack();
      },
    );
  }
}
