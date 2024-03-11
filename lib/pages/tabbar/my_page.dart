/*
 * @Author: 高江华 g598670138@163.com
 * @Date: 2023-09-21 11:25:45
 * @LastEditors: 高江华
 * @LastEditTime: 2024-03-11 10:55:00
 * @Description: file content
 */
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/models/my_model.dart';
import 'package:flutter_shop/store/my_store.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 400.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://gongyue-shop.oss-cn-hangzhou.aliyuncs.com/img/mine/mine-bg.png'), // 替换为您的背景图片网络地址
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.r),
                bottomRight: Radius.circular(50.r),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).padding.top), // 顶部留出状态栏高度
                Container(
                  padding: EdgeInsets.all(30.w),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://gongyue-shop.oss-cn-hangzhou.aliyuncs.com/img/mine/default-avatar.png'), // 替换为用户头像的网络地址
                        radius: 50.r,
                      ),
                      SizedBox(width: 20.w), // 调整头像和用户名之间的间距
                      Expanded(
                        // 将用户名和登录提示放到一个占满剩余空间的容器中
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('前往登录', style: TextStyle(fontSize: 32.sp)),
                            Container(
                              margin: EdgeInsets.only(top: 14.w),
                              child: Text(
                                '您还未登录。立即登录，享受更多特权！',
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF666666),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          SvgPicture.network(
                            'https://gongyue-shop.oss-cn-hangzhou.aliyuncs.com/img/common/setting-two.svg',
                            width: 24,
                            height: 24,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 14.w, 0, 0),
                            child: Text(
                              '设置',
                              style: TextStyle(
                                  fontSize: 26.sp, color: Color(0xffffffff)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),

          // 其他布局
        ],
      ),
    );
  }

  // 获取数据
  getMyPageContent([String? e]) async {
    String jsonString = await rootBundle.loadString('data/my.json');
    late Map<String, dynamic> jsonMap;
    try {
      jsonMap = await json.decode(jsonString);
    } catch (e) {
      print('JSON decode error: $e');
    }

    if (jsonMap.containsKey('data')) {
      try {
        Map<String, dynamic> jsonData = jsonMap['data'];
        MyData myData = MyData.fromJson(jsonData);
        // 使用 myData 进行后续操作
        context.read<MyStore>().setMyData(myData);
      } catch (e) {
        print('Error in processing homeData: $e');
      }
    } else {
      print('Invalid JSON data or missing "data" key');
    }
  }

}

// 顶部菜单
class MenuFallow extends StatelessWidget {
  final List<MenuFallow> menuList;
  const MenuFallow({super.key, required this.menuList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(260),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 3,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(5.0),
        children: menuList.map((MenuFallow item) {
          return _buildMenuItem(context, item);
        }).toList(),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, item) {
    return InkWell(
      onTap: () {
        // Get.to(() => NewsPage());
      },
      child: Column(
        children: [
          SvgPicture.network(
            item.url,
            width: 80.w,
            height: 80.h,
          ),
          Text(item.name, style: TextStyle(fontSize: ScreenUtil().setSp(36.sp)))
        ],
      ),
    );
  }
}
