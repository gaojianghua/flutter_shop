/*
 * @Author: 高江华 g598670138@163.com
 * @Date: 2024-02-02 16:23:54
 * @LastEditors: 高江华
 * @LastEditTime: 2024-02-02 16:29:59
 * @Description: file content
 */
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/my_model.dart';


class MyStore extends Cubit<MyData> {
  MyStore()
      : super(MyData(menuFallow: []));

  // 为方法添加异常处理代码
  void setMyData(MyData data) {
    try {
      state
        ..menuFallow = data.menuFallow;
      emit(state);
    } catch (e) {
      print('setHomeData error: $e');
    }
  }
}