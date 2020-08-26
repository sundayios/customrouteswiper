import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'page/newstype.dart';

class NewsTabPage extends StatefulWidget {
  NewsTabPage({Key key}) : super(key: key);

  @override
  _NewsTabPageState createState() => _NewsTabPageState();
}

class _NewsTabPageState extends State<NewsTabPage>
    with TickerProviderStateMixin {
  final _tabIndex = ValueNotifier(0);
  TabController _tabCtrl;
  @override
  bool get wantKeepAlive => true;

  // final _tabIndex = ValueNotifier(0);
  // TabController _tabCtrl;
  final tabTitles = [
    "关注",
    "动态",
    "政策",
    "直播",
    "微社区",
    "视频",
    "一线",
    "DeFi",
    "矿业",
    "IPFS",
    "课程",
    "专题",
    "公告",
    "技术",
    "产业",
    "深度"
  ];

  @override
  void initState() {
    super.initState();

    _tabCtrl = TabController(
      vsync: this,
      length: tabTitles.length,
      initialIndex: _tabIndex.value,
    )..addListener(() {
        // 监听 & 记录 index
        if (_tabCtrl.indexIsChanging) {
          return;
        }
        _tabIndex.value = _tabCtrl.index;
      });

    super.initState();
  }

  @override
  void dispose() {
    _tabCtrl.dispose();
    super.dispose();
  }

  Widget _tabBar() {
    List<Widget> tabsTitles = tabTitles.map((val) {
      return Tab(
        text: val,
      );
    }).toList();
    return TabBar(
      indicatorWeight: 0.4,
      controller: _tabCtrl,
      isScrollable: true,
      tabs: tabsTitles,
      labelColor: Theme.of(context).textTheme.subtitle1.color,
      labelStyle: Theme.of(context).textTheme.subtitle1,
      unselectedLabelColor: Theme.of(context).textTheme.caption.color,
      unselectedLabelStyle:
          Theme.of(context).textTheme.caption.copyWith(fontSize: 14),
      indicatorSize: TabBarIndicatorSize.label,
      // indicator: Decoration(),
      onTap: (int index) {},
    );
  }

  List<Widget> tabBodies() {
    return tabTitles.map((val) => NewsTypePage()).toList();
    //Scrollbar(child: NewsTypePage())
  }

  @override
  Widget build(BuildContext context) {
    return
        // SafeArea(
        //     child:
        RefreshConfiguration.copyAncestor(
            context: context,
            enableBallisticLoad: false,
            enableLoadingWhenFailed: true,
            headerBuilder: () => WaterDropMaterialHeader(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
            footerTriggerDistance: 30.0,
            child: Scaffold(
              // resizeToAvoidBottomPadding: false,
              // resizeToAvoidBottomInset: false,
              body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    //MediaQuery.of(context).padding.top
                    Container(
                        padding: EdgeInsets.fromLTRB(
                            20, MediaQuery.of(context).padding.top, 10, 10),
                        height: 50 + MediaQuery.of(context).padding.top,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('澳亚财经',
                                style: Theme.of(context).textTheme.headline5),
                            Container(
                              height: 32,
                              width: ScreenUtil.getScreenW(context) * 0.6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Theme.of(context).accentColor,
                              ),
                              child: GestureDetector(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.search,
                                    ),
                                    Text("DeFi")
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                    _tabBar(),
                    Divider(
                      thickness: 0.1,
                    ),
                    Expanded(
                      flex: 1,
                      child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: _tabCtrl,
                        children: tabBodies(),
                      ),
                    ),
                  ]),
            ));
    // );
  }
}
