import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:provider/provider.dart';

import '../stateManage/stateManage.dart';
import '../views/settlementPage.dart';

class CheckoutBar extends StatefulWidget {
  const CheckoutBar({super.key});
  @override
  State<CheckoutBar> createState() =>
      _CheckoutBarState();
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
      height: maxHeight <= 783 ?  maxHeight * 0.07  : maxHeight * 0.08,
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
                                top:0,
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
                                  child:Center(
                                    child: Text('${drinksOptions.getAllData[0]['allCount']}',style: TextStyle(fontSize: 10,color: Colors.white),),
                                  ),
                                ),

                              ),
                              Positioned(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      Text('￥'),
                                      Text('${drinksOptions.getAllData[0]['allPrice'].toStringAsFixed(2)}'),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        child:
                        GestureDetector(
                          onTap: (){
                            if(drinksOptions.getOptions.isEmpty){
                              showToast('请先添加购物车',
                                  duration:const Duration(milliseconds: 1000),
                                  textStyle:const TextStyle(fontSize: 12,color: Colors.white),
                                  context: context,
                                  animation: StyledToastAnimation.fade,
                                  curve: Curves.linear,
                                  reverseCurve: Curves.linear);
                            }else if(drinksOptions.getOptions.isNotEmpty){
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration: Duration(milliseconds: 150),
                                  pageBuilder: (_, __, ___) => SettlementPage(),
                                  transitionsBuilder: (_, animation, __, child) {
                                    return SlideTransition(
                                      position: Tween(
                                        begin: Offset(1.0, 0.0),  // (1.0,0.0)是从右到左出现
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
                                  color: Color.fromRGBO(51, 228, 228,0.6),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50),
                                    topRight: Radius.circular(50),
                                  ),
                                ),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text('去结算',style: TextStyle(color: Colors.white,),),
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