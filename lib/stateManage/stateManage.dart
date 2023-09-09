import 'package:flutter/cupertino.dart';


//登录状态管理，用于检测登录状态来拉取取餐页的订单数据
class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void login() {
    // 登录逻辑
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    // 登出逻辑
    _isLoggedIn = false;
    print(_isLoggedIn);
    notifyListeners();
  }
}

//菜单选配界面状态管理，用于在选取不同温度或其他会触发界面选项变化的选项时，可选项发生变化
class ChangeMenuOptions with ChangeNotifier {
  bool _isHot = false;

  bool get isHot => _isHot;

  void Hot() {
    // 登录逻辑
    _isHot = true;
    notifyListeners();
  }

  void Cold() {
    // 登出逻辑
    _isHot = false;
    print(_isHot);
    notifyListeners();
  }
}