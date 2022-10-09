import 'package:flutter/material.dart';
import 'package:floutter_admob/main.dart';

class WatchVideoPage extends StatefulWidget {
  const WatchVideoPage({Key? key}) : super(key: key);

  @override
  State<WatchVideoPage> createState() => _WatchVideoPageState();
}

class _WatchVideoPageState extends State<WatchVideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ポイ活アプリ'),
        actions: [
          Container(
            child: Text('$total_point',style: TextStyle(fontSize: 20),),
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 20),
          )

        ],
      ),
      body: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('5ポイント獲得', style: TextStyle(fontSize: 20),),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      total_point = total_point + 5;
                    });
                  },
                  child: Text("動画を視聴", style: TextStyle(fontSize: 20),)
              ),
            ),
            Padding(
              padding: EdgeInsets.all(50),
            ),
            Text("ポイント獲得２倍に", style: TextStyle(fontSize: 20),),
            Container(
              width: 200,
              height: 50,
              child:ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isMultiply = true;
                    });
                  },
                  child: Text("動画を視聴", style: TextStyle(fontSize: 20),)
              ),
            )
          ],
        ),
      ),
    );
  }
}
