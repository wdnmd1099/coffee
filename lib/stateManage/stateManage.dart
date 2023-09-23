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

//遮罩对话框状态管理
class MaskDiaLog with ChangeNotifier {
  bool _isOpen = false;

  bool get isOpen => _isOpen;

  void open() {
    // 登录逻辑
    _isOpen = true;
    notifyListeners();
  }

  void off() {
    // 登出逻辑
    _isOpen = false;
    notifyListeners();
  }
}

//改变BottomNavigationBar的页面下标
class BottomNavigationBarIndex with ChangeNotifier {
  int _index = 0;

  int get getIndex => _index;

  void changeIndex(int index) {
    _index = index;
    notifyListeners();
  }
}

//下单饮料的选配信息
class DrinksOptions with ChangeNotifier {
  List _drinksOptions = [];
  List _allData = [{'allCount':0,'allPrice':0.0},];
  List get getOptions => _drinksOptions;
  List get getAllData => _allData;

  void computeAllCountAndPrice(){
    _allData = [{'allCount':0,'allPrice':0.0},];
    for(int i=0;i<_drinksOptions.length;i++){
      _allData[0]['allPrice'] += double.parse(_drinksOptions[i]['price'].toString()) * _drinksOptions[i]['count'] ;
      _allData[0]['allCount'] += _drinksOptions[i]['count'];
      //count 等于零就从数据列表中删除
      if(_drinksOptions[i]['count'] == 0){
        _drinksOptions.remove(_drinksOptions[i]);
      }
    }

    // addOrReduce? _allData[0]['allCount'] += currentCount: _allData[0]['allCount'] -= currentCount;
    // addOrReduce? _allData[0]['allPrice'] += currentDrinkPrice :  _allData[0]['allPrice'] -= currentDrinkPrice;
    notifyListeners();
  }

  void changeOptions(Map options) {
    _drinksOptions.add(options);
    notifyListeners();
  }


  void reset() {
    _drinksOptions = [];
    _allData = [{'allCount':0,'allPrice':0.0},];
    notifyListeners();
  }
}
























