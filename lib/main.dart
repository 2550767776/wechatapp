import 'package:flutter/material.dart';
import 'package:wechatapp/home/home_screen.dart';
import 'package:wechatapp/common/constant.dart' show AppColors;

void main() => runApp(MaterialApp(
      title: '微信',
      theme: ThemeData.light()
          .copyWith(primaryColor: Color(AppColors.appBarColor),
        cardColor: Color(AppColors.appBarColor)
      ),
      home: HomeScreen(),
    ));
