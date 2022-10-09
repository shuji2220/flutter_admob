import 'package:flutter/material.dart';
import 'package:floutter_admob/main.dart';
import 'package:floutter_admob/model/contents.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';

class PointListPage extends StatefulWidget {
  const PointListPage({Key? key}) : super(key: key);

  @override
  State<PointListPage> createState() => _PointListPageState();
}

class _PointListPageState extends State<PointListPage> {
  List<BannerAd> bannerAds = [];
  bool isLoaded = false;
  final List<Contents> contentsList = [
    Contents(title:"ポイント獲得", imagePath: "assets/ダウンロード.jpeg", point: 1),
    Contents(title:"ポイントゲット", imagePath: "assets/ダウンロード.jpeg", point: 2),
    Contents(title:"お得です", imagePath: "assets/ダウンロード.jpeg", point: 3),
    Contents(title:"お得です", imagePath: "assets/ダウンロード.jpeg", point: 3),
    Contents(title:"お得です", imagePath: "assets/ダウンロード.jpeg", point: 3),
    Contents(title:"お得です", imagePath: "assets/ダウンロード.jpeg", point: 3),
    Contents(title:"お得です", imagePath: "assets/ダウンロード.jpeg", point: 3),
    Contents(title:"お得です", imagePath: "assets/ダウンロード.jpeg", point: 3),
    Contents(title:"お得です", imagePath: "assets/ダウンロード.jpeg", point: 3)
  ];

  void initAd() {
      for (int i = 0; i < contentsList.length ~/ 4; i++) {
        BannerAd bannerAd = BannerAd(
          size: AdSize.banner,
          adUnitId: 'ca-app-pub-3940256099942544/6300978111',
          listener: BannerAdListener(
              onAdLoaded: (Ad ad) {
                setState(() {
                  isLoaded = true;
                });
              }
          ),
          request: AdRequest(),
        )..load();
        bannerAds.add(bannerAd);
      }
    }

  @override
  void initState() {
    super.initState();
    initAd();
    print(bannerAds.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ポイ活アプリ'),
        actions: [
          Container(
            child: Text('$total_point', style: TextStyle(fontSize: 20),),
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 20) ,
          )

        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            isMultiply ? Container(
              width: 300,
              height: 50,
              color: Colors.amber,
              child: Text("ポイント倍増中", style: TextStyle(fontSize: 20, color: Colors.white),),
              alignment: Alignment.center,
            ) : Container() ,
            buildList(),
          ],
        )
      ),
    );
  }


  Widget buildList() {
    List<Widget> rowChildren = [];
    List<Widget> columnChildren = [];

    for(int i =0; i < contentsList.length; i++) {
      rowChildren.add(
          Expanded(
            child: InkWell(
              onTap: () {
                int m = contentsList[i].point ?? 0;
                setState(() {
                  if (isMultiply == true) {
                    total_point = total_point + m*2;
                  } else {
                    total_point = total_point + m;
                  }
                  });
              },
              child: Card(
                child: Column(
                  children: [
                    Image.asset(contentsList[i].imagePath.toString()),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(contentsList[i].title.toString()),
                          Container(
                            alignment: Alignment.center,
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.amber
                            ),
                            child: Text('${contentsList[i].point}'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          )
      );
      if (i % 2 == 1) {
        columnChildren.add(Row(children: rowChildren,));
        rowChildren = [];
      } else if (i == contentsList.length - 1) {
        rowChildren.add(Expanded(child: Container()));
        columnChildren.add(Row(children: rowChildren,));
        rowChildren = [];
      }
      if (i % 4 == 3) {
        if(bannerAds.length != null) {
          columnChildren.add(Container(
            width: bannerAds[i ~/ 4].size.width.toDouble(),
            height: bannerAds[i ~/ 4].size.height.toDouble(),
            child: isLoaded ? AdWidget(ad: bannerAds[i ~/ 4],) : Container(),
          ));
        }
      }
    }
    return  Column(
      children: columnChildren,
    );
  }
}

