import 'package:flutter/material.dart';

class NavigationIconView {
  final String _title;
  final Widget _icon;
  final Widget _activeIcon;
  final BottomNavigationBarItem item;

  NavigationIconView({Key key, String title, Widget icon, Widget activeIcon})
      : _title = title,
        _icon = icon,
        _activeIcon = activeIcon,
        item = BottomNavigationBarItem(
            icon: icon,
            activeIcon: activeIcon,
            title: Text(title),
            backgroundColor: Colors.white);
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NavigationIconView> _navigationViews;

  @override
  void initState() {
    super.initState();
    _navigationViews = [
      NavigationIconView(
          title: '微信',
          icon: Icon(Icons.access_alarm),
          activeIcon: Icon(Icons.access_time)),
      NavigationIconView(
          title: '通讯录',
          icon: Icon(Icons.access_alarm),
          activeIcon: Icon(Icons.access_time)),
      NavigationIconView(
          title: '发现',
          icon: Icon(Icons.access_alarm),
          activeIcon: Icon(Icons.access_time)),
      NavigationIconView(
          title: '我',
          icon: Icon(Icons.access_alarm),
          activeIcon: Icon(Icons.access_time)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
      items: _navigationViews.map((NavigationIconView view) {
        return view.item;
      }).toList(),
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        print('点击的是第$index个Tab');
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("微信"),
      ),
      body: Container(
        color: Colors.red,
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
