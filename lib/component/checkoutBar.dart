import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:provider/provider.dart';

import '../stateManage/stateManage.dart';
import '../views/settlementPage.dart';

class CheckoutBar extends StatefulWidget {
  const CheckoutBar({super.key});

  @override
  State<CheckoutBar> createState() => _CheckoutBarState();
}

class _CheckoutBarState extends State<CheckoutBar> {
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    final drinksOptions = Provider.of<DrinksOptions>(context);

    return Container(
      padding: EdgeInsets.only(
        left: maxWidth * 0.05,
        right: maxWidth * 0.05,
        top: maxWidth * 0.025,
        bottom: maxWidth * 0.025,
      ),
      height: maxHeight <= 783 ? maxHeight * 0.07 : maxHeight * 0.08,
      width: maxWidth,
      color: Color.fromRGBO(255, 165, 79, 1),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: Colors.transparent,
            width: 0,
          ),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.transparent,
                  width: 0,
                ),
              ),
              child: Container(
                width: maxWidth * 0.9,
                padding: EdgeInsets.only(left: maxWidth * 0.15),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(220, 120, 17, 1),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Colors.transparent,
                    width: 0,
                  ),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          // alignment: Alignment.center,
                          height: maxHeight,
                          // color: Colors.red,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      color: Colors.transparent,
                                      width: 0,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${drinksOptions.getAllData[0]['allCount']}',
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                child: GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        final drinksOptions = Provider.of<DrinksOptions>(context);
                                        return Container(
                                          height: 300,
                                          color: Colors.white,
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 30,
                                                width: maxWidth,
                                                color: Colors.grey[200],
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding: const EdgeInsets.only(
                                                          left: 8),
                                                      child: const Text(
                                                        '已选商品',
                                                        style: TextStyle(
                                                            fontSize: 12),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment.end,
                                                        children: [
                                                          GestureDetector(
                                                            onTap:(){
                                                              drinksOptions.reset();
                                                            },
                                                            child: Container(
                                                              padding:
                                                              const EdgeInsets.only(
                                                                  right: 8),
                                                              child: const Text(
                                                                '清空购物车',
                                                                style: TextStyle(
                                                                    fontSize: 12),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: ListView(
                                                  children: [
                                                    for (int i = 0; i < drinksOptions.getOptions.length; i++)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.all(8),
                                                        child: Container(
                                                          height: 60,
                                                          width: maxWidth,
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                padding: EdgeInsets.only(left: 8),
                                                                // width: 60,
                                                                child: Container(width: 60,
                                                                  color: Colors.red,
                                                                  child: Image.network('http://192.168.0.3:9000/rc-resource/${drinksOptions.getOptions[i]['path'][0]}',
                                                                    fit: BoxFit.cover,
                                                                  ),
                                                                ),
                                                              ), // 商品图片

                                                              Expanded(
                                                                child: Container(
                                                                padding: EdgeInsets.only(left: maxWidth * 0.1),
                                                                // color: Colors.green,
                                                                alignment: Alignment.centerLeft,
                                                                child: Column(
                                                                  children: [
                                                                    Container(
                                                                      // color: Colors.red,
                                                                      height: 60 / 3,
                                                                      alignment: Alignment.centerLeft,
                                                                      child:
                                                                      Text('${drinksOptions.getOptions[i]['name']}',
                                                                        style: TextStyle(fontSize: 12,overflow: TextOverflow.ellipsis),
                                                                      ),
                                                                    ),
                                                                    Expanded(child: Container(
                                                                      // color: Colors.red,
                                                                      height: 60 / 3,
                                                                      alignment: Alignment.centerLeft,
                                                                      child:
                                                                      Text('${drinksOptions.getOptions[i]['hotOrCold']}', style: TextStyle(fontSize: 8),
                                                                      ),
                                                                    ),
                                                                    ),
                                                                    Container(
                                                                      height: 60 / 3,
                                                                      alignment: Alignment.centerLeft,
                                                                      child: Text('￥${drinksOptions.getOptions[i]['price']}', style: TextStyle(fontSize: 12),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ), ),//商品描述

                                                              Container(
                                                                width: 90,
                                                                height: maxHeight,
                                                                // color: Colors.purple,
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [
                                                                    GestureDetector(
                                                                      onTap: (){
                                                                        setState(() {
                                                                          //可选数不能小于零，等于零就从列表中删除（删除功能在computeAllCountAndPrice()）
                                                                          if( drinksOptions.getOptions[i]['count'] > 0){
                                                                            //因为引用传递，temporaryList引用了状态管理的元素，修改temporaryList的元素时，状态管理的元素也会改变。
                                                                            drinksOptions.getOptions[i]['count'] -= 1;
                                                                          }
                                                                          drinksOptions.computeAllCountAndPrice();
                                                                        });
                                                                      },
                                                                      child: Container(
                                                                        alignment: Alignment.center,
                                                                        height: 24,
                                                                        width: 24,
                                                                        decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(4),
                                                                          color: Colors.grey[200],
                                                                        ),
                                                                        child: Text('-',style: TextStyle(fontSize: 18),),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      padding: EdgeInsets.only(left: 8,right: 8),
                                                                      child: Text('${drinksOptions.getOptions[i]['count']}'),
                                                                    ), //数量显示
                                                                    GestureDetector(
                                                                      onTap: (){
                                                                        setState(() {

                                                                          drinksOptions.getOptions[i]['count'] += 1;
                                                                          print( drinksOptions.getOptions[i]['count']);
                                                                          drinksOptions.computeAllCountAndPrice();
                                                                        });
                                                                      },
                                                                      child:  Container(
                                                                        alignment: Alignment.center,
                                                                        height: 24,
                                                                        width: 24,
                                                                        decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(4),
                                                                          color: Color.fromRGBO(166, 110, 62, 1),
                                                                        ),
                                                                        child: const Text('+',style: TextStyle(fontSize: 18),),

                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),//加减商品数量
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    // color: Colors.green,
                                    alignment: Alignment.center,
                                    child: Row(
                                      children: [
                                        Text('￥'),
                                        Text(
                                            '${drinksOptions.getAllData[0]['allPrice'].toStringAsFixed(2)}'),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        child: GestureDetector(
                          onTap: () {
                            if (drinksOptions.getOptions.isEmpty) {
                              showToast('请先添加购物车',
                                  duration: const Duration(milliseconds: 1000),
                                  textStyle: const TextStyle(
                                      fontSize: 12, color: Colors.white),
                                  context: context,
                                  animation: StyledToastAnimation.fade,
                                  curve: Curves.linear,
                                  reverseCurve: Curves.linear);
                            } else if (drinksOptions.getOptions.isNotEmpty) {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration:
                                      Duration(milliseconds: 150),
                                  pageBuilder: (_, __, ___) => SettlementPage(),
                                  transitionsBuilder:
                                      (_, animation, __, child) {
                                    return SlideTransition(
                                      position: Tween(
                                        begin: Offset(1.0, 0.0),
                                        // (1.0,0.0)是从右到左出现
                                        end: Offset.zero,
                                      ).animate(animation),
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            }
                          },
                          child: Container(
                            // color: Colors.green,
                            height: maxHeight,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                height: maxHeight,
                                width: maxWidth * 0.2,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(51, 228, 228, 0.6),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50),
                                    topRight: Radius.circular(50),
                                  ),
                                ),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '去结算',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
