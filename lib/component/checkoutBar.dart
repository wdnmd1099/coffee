import 'package:flutter/material.dart';

class CheckoutBar extends StatefulWidget {
  const CheckoutBar({super.key});

  @override
  State<CheckoutBar> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<CheckoutBar> {
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
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
                                    child:  Text('0'),
                                  ),
                                ),

                              ),
                              Positioned(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      Text('￥'),
                                      Text('0'),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          // color: Colors.green,
                          height: maxHeight,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              height: maxHeight,
                              width: maxWidth * 0.2,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(51, 228, 228,0.6),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text('去结算',style: TextStyle(color: Colors.white,),),
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