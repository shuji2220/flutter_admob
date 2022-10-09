import 'package:flutter/material.dart';
import '../../model/bottomnavigation.dart';
import './pointlistpage.dart';
import './watchvideopage.dart';

class TopPage extends StatefulWidget {
  const TopPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  List<BottomNavigationEntity> navigationList = [
    BottomNavigationEntity(title:'ポイント獲得', icon:Icons.control_point_duplicate, page:PointListPage()),
    BottomNavigationEntity(title:'Boost', icon:Icons.trending_up, page:WatchVideoPage()),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:navigationList[selectedIndex].page ,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (int newIndex) {
          setState(() {
            selectedIndex = newIndex;
          });
        },
        items: navigationList.map((item) => BottomNavigationBarItem(
            icon: Icon(item.icon),
            label: item.title
        )).toList(),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
