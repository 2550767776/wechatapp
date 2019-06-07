import 'package:flutter/material.dart';
import 'package:wechatapp/common/constant.dart';

enum ActionItems {
  CHAT,
  ADD,
  SCAN,
  PAY,
  REPORT
}

class NavigationIconView {
  final String _title;
  final IconData _icon;
  final IconData _activeIcon;
  final BottomNavigationBarItem item;

  NavigationIconView(
      {Key key, String title, IconData icon, IconData activeIcon})
      : _title = title,
        _icon = icon,
        _activeIcon = activeIcon,
        item = BottomNavigationBarItem(
            icon: Icon(
              icon,
              color: Color(AppColors.tabIconNormalColor),
            ),
            activeIcon: Icon(
              activeIcon,
              color: Color(AppColors.tabIconActiveColor),
            ),
            title: Text(title,
                style: TextStyle(
                    fontSize: 14.0,
                    color: Color(AppColors.tabIconNormalColor))),
            backgroundColor: Colors.white);
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews;

  @override
  void initState() {
    super.initState();
    _navigationViews = [
      NavigationIconView(
          title: '微信',
          icon: IconData(0xe65d, fontFamily: Constants.iconFontFamily),
          activeIcon: IconData(0xe619, fontFamily: Constants.iconFontFamily)),
      NavigationIconView(
          title: '通讯录',
          icon: IconData(0xe63a, fontFamily: Constants.iconFontFamily),
          activeIcon: IconData(0xe6c2, fontFamily: Constants.iconFontFamily)),
      NavigationIconView(
          title: '发现',
          icon: IconData(0xe718, fontFamily: Constants.iconFontFamily),
          activeIcon: IconData(0xe62f, fontFamily: Constants.iconFontFamily)),
      NavigationIconView(
          title: '我',
          icon: IconData(0xe67b, fontFamily: Constants.iconFontFamily),
          activeIcon: IconData(0xe62d, fontFamily: Constants.iconFontFamily)),
    ];
  }

  _buildPopupMenuItem(int iconName,String title) {
    return Row(
      children: <Widget>[
        Icon(
          IconData(iconName, fontFamily: Constants.iconFontFamily),
          size: 22.0,
          color: const Color(AppColors.appBarPopupMenuColor),
        ),
        Container(width: 12.0,),
        Text(title,style: TextStyle(color: const Color(AppColors.appBarPopupMenuColor)),)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
      items: _navigationViews.map((NavigationIconView view) {
        return view.item;
      }).toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
        print('点击的是第$index个Tab');
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("微信"),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              IconData(0xe61b, fontFamily: Constants.iconFontFamily),
              size: 22.0,
            ),
            onPressed: () {
              print("search");
            },
          ),
          Container(
            width: 16.0,
          ),
          /*IconButton(
            icon: Icon(IconData(0xe614, fontFamily: Constants.iconFontFamily),size: 22.0,),
            onPressed: () {},
          ),*/
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<ActionItems>>[
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe619,"发起群聊"),
                  value: ActionItems.CHAT,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe614,"添加朋友"),
                  value: ActionItems.ADD,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe601,"扫一扫"),
                  value: ActionItems.SCAN,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe634,"收付款"),
                  value: ActionItems.PAY,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe60b,"帮助与反馈"),
                  value: ActionItems.REPORT,
                ),
              ];
            },
            icon: Icon(
              IconData(0xe614, fontFamily: Constants.iconFontFamily),
              size: 22.0,
            ),
            onSelected: (ActionItems selected) {
              print("点击的是$selected");
            },
          ),
          Container(
            width: 16.0,
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
