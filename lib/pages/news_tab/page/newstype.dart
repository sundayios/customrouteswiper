import 'package:aoyanews/widgets/gif_indicator_example1.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';

class NewsTypePage extends StatefulWidget {
  NewsTypePage({Key key}) : super(key: key);

  @override
  _NewsTypePageState createState() => _NewsTypePageState();
}

class _NewsTypePageState extends State<NewsTypePage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<String> data = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SmartRefresher(
        controller: _refreshController,
        enablePullUp: true,
        enablePullDown: true,
        header: GifHeader1(),
        child: ListView(
          children: <Widget>[
            Text("qwerw"),
            Container(
              height: 150,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    "http://pic-bucket.ws.126.net/photo/0003/2020-08-26/FKUJU4PT00AJ0003NOS.jpg",
                    fit: BoxFit.fill,
                  );
                },
                itemCount: 3,
                pagination: SwiperPagination(),
                // SwiperCustomPagination(
                //     builder: (BuildContext context, SwiperPluginConfig config) {
                //   return Container(
                //     alignment: Alignment.bottomCenter,
                //     height: 140,
                //     child: PageIndicator(
                //       layout: PageIndicatorLayout.LINE,
                //       size: 10.0,
                //       space: 10.0,
                //       count: 3,
                //       controller: config.pageController,
                //       color: Colors.black12,
                //     ),
                //   );
                // }),
                // viewportFraction: 0.93,
                // scale: 0.9,
              ),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Theme.of(context).dividerTheme.color,
                            width: 0.1))),
                child: GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('title',
                                style: Theme.of(context).textTheme.bodyText2),
                            Text('title',
                                style: Theme.of(context).textTheme.caption),
                          ]),
                      Image.network(
                        "http://pic-bucket.ws.126.net/photo/0003/2020-08-26/FKUJU4PT00AJ0003NOS.jpg",
                        fit: BoxFit.fitWidth,
                        width: 80,
                      )
                    ],
                  ),
                  onTap: () {},
                ))
          ],
        ),
        physics: BouncingScrollPhysics(),
        footer: ClassicFooter(
          loadStyle: LoadStyle.ShowWhenLoading,
          completeDuration: Duration(milliseconds: 500),
        ),
        onRefresh: () async {
          //monitor fetch data from network
          await Future.delayed(Duration(milliseconds: 1000));

          for (int i = 0; i < 10; i++) {
            data.add("Item $i");
          }

          if (mounted) setState(() {});
          _refreshController.refreshCompleted();
          print("refresh");
          /*
        if(failed){
         _refreshController.refreshFailed();
        }
      */
        },
        onLoading: () async {
          print("onLoading");
          //monitor fetch data from network
          await Future.delayed(Duration(milliseconds: 180));
          for (int i = 0; i < 10; i++) {
            data.add("Item $i");
          }
          if (mounted) setState(() {});
          _refreshController.loadFailed();
        },
      ),
    );
  }
}
