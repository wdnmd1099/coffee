import 'dart:convert';

import 'package:coffee/component/optionCardList.dart';
import 'package:coffee/views/Test.dart';
import 'package:coffee/views/forJumpPage.dart';
import 'package:coffee/views/optionsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../stateManage/stateManage.dart';
import '../临时文件/选配选项.dart';
import 'centerAppbar.dart';
import 'maskDialog.dart';


class MenuCardList extends StatefulWidget {
  MenuCardList({super.key, required this.meun,this.setIndex});
  Function? setIndex;
  final List meun;

  @override
  State<MenuCardList> createState() => _MenuCardListState();
}

class _MenuCardListState extends State<MenuCardList> {
  bool changeIcon = true;

  Widget boxsize(maxHeight,maxWidth,item){
   return SizedBox(
      height: maxHeight * 0.06,
      width: maxWidth,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 4),
                child: Icon(
                  Icons.add_card,
                  size: 21,
                  color: Colors.grey,
                ),
              ),
              Text(
                item['Name'],
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 8, right: 8),
            height: 0.25,
            child: Container(
              decoration: BoxDecoration(
                // color: Colors.purple,
                  border: Border.all(color: Colors.grey, width: 0.25)),
            ),
          ),
        ],
      ),
    );
  }

  Widget beforeChooseView(maxHeight,maxWidth,){
    return MaskDialog(
    setIndex: widget.setIndex,
    wrapper:Container(
    width: maxWidth * 0.1,
    // color: Colors.yellow,
    decoration: BoxDecoration(
    color: Color.fromRGBO(
    119, 185, 144, 1),
    borderRadius:
    BorderRadius.circular(4),
    ),
    child: const Center(
    child: Text(
    '选配',
    style: TextStyle(
    fontSize: 8),
    ),
    ),
    ),
    dialogWidget:Container(
    height: maxHeight * 0.7,
    width: maxWidth,
    // color: Colors.yellow,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8),
  color: Colors.white,
  ),

  child: OptionCardList(
  optionList: x,
  sameMode: true,
  changeOption: '状态',
  btnTitle: '加入购物车',
  ),
  ),
  );
}

  Widget showSaleData(maxHeight,maxWidth){
    return Container(
      // color: Colors.red,
      alignment: Alignment.center,
      child: Container(
        // color: Colors.purple,
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              width: maxWidth * 0.1,
              alignment: Alignment.center,
              child: Text('--',
                  style: TextStyle(
                    fontSize: 28,
                  )),
              // color: Colors.red,
            ),
            Container(
              padding: EdgeInsets.only(left: 6),
              alignment: Alignment.center,
              width: maxWidth * 0.1,
              // color: Colors.purple,
              child: Text(
                '已售：',
                style: TextStyle(fontSize: 8),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 6),
              alignment: Alignment.center,
              width: maxWidth * 0.1,
              // color: Colors.yellow  ,
              child: Text(
                '评分：',
                style: TextStyle(fontSize: 8),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: maxWidth * 0.1,
              // color: Colors.red,
              child: Text(
                '--',
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
 }

  Widget drinksPhotos(maxHeight,maxWidth,ImagesPath){
    return SizedBox(
      height: maxHeight,
      width: maxWidth * 0.3,
      child: Container(
        height: 100,
        decoration: const BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8.0),
            bottomLeft: Radius.circular(8.0),
          ),
          child: Image.network(
            // 'https://img2.baidu.com/it/u=2396175778,1836017861&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=666',
            'http://192.168.0.3:9000/rc-resource/${ImagesPath[0]}',

            fit: BoxFit.cover, //fill就可以看到全图，但是会变形，cover不会变形但会看不到全图
          ),
        ),
      ), //产品图
    );
 }

  Widget poductInformationDescription(maxHeight,maxWidth,childrenItem,dialogOrPage,authProvider,ImagesPath){
    return Container(
      padding: EdgeInsets.only(left: maxWidth * 0.1),
      child: Container(
        alignment: Alignment.centerLeft,
        // color: Colors.purple,
        width: maxWidth * 0.25, //产品信息描述框
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                bottom: 10,
                top: 8,
              ),
              child: Text(
                childrenItem['Name'],
                style: TextStyle(
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 8),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${childrenItem['SimpleDesc'].replaceAll(RegExp(r'(\n|\r)$'), '').toString()}',
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 8,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ),
            Container(
              // alignment: Alignment.centerLeft,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.,
                children: [
                  Container(
                    // padding: EdgeInsets.only(bottom: 10),
                    height: 14,
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '￥',
                      style: TextStyle(fontSize: 8),
                    ),
                  ),
                  Text(
                    '${childrenItem['Price']}',
                    style: TextStyle(
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Expanded(
                    child: Container(
                      height: 30,
                      // width: 10,
                      // alignment: Alignment.centerRight,
                      child: Container(
                        alignment: Alignment.centerRight,
                        // color: Colors.white,

                        child: dialogOrPage?
                        beforeChooseView(maxHeight,maxWidth):
                        GestureDetector(
                          onTap: (){
                            if( authProvider.isLoggedIn == false && widget.setIndex != null){
                              widget.setIndex!();showToast('请先登录',
                                  duration:Duration(milliseconds: 2000),
                                  textStyle:TextStyle(fontSize: 12,color: Colors.white),
                                  context: context,
                                  animation: StyledToastAnimation.fade,
                                  curve: Curves.linear,
                                  reverseCurve: Curves.linear);
                            }else if(authProvider.isLoggedIn == true){
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration: Duration(milliseconds: 150),
                                  pageBuilder: (_, __, ___) => OptionsPage(childrenItem: childrenItem,ImagesPath:ImagesPath,),
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
                            child: Container(
                              width: maxWidth * 0.1,
                              // color: Colors.yellow,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(
                                    119, 185, 144, 1),
                                borderRadius:
                                BorderRadius.circular(4),
                              ),
                              child: const Center(
                                child: Text(
                                  '选配',
                                  style: TextStyle(
                                      fontSize: 8),
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
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    final authProvider = Provider.of<AuthProvider>(context);
    String yes = '<svg t="1695279358944" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="4022" data-spm-anchor-id="a313x.search_index.0.i5.69e93a81e2leGX" width="32" height="32"><path d="M512 0A512 512 0 1 1 0 512 512 512 0 0 1 512 0z" fill="#1afa29" p-id="4023" data-spm-anchor-id="a313x.search_index.0.i0.69e93a81e2leGX" class=""></path><path d="M438.857143 747.52a91.428571 91.428571 0 0 1-68.022857-30.354286L219.428571 548.571429a54.857143 54.857143 0 0 1 81.554286-73.142858L438.857143 629.028571l284.16-312.32a54.857143 54.857143 0 0 1 81.188571 73.142858l-297.691428 326.948571a91.794286 91.794286 0 0 1-67.657143 30.72z" fill="#ffffff" p-id="4024" data-spm-anchor-id="a313x.search_index.0.i2.69e93a81e2leGX" class="selected"></path></svg>';
    String no  = '<svg t="1695279526818" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5214" width="32" height="32"><path d="M512.6 25.9c65.7 0 129.4 12.9 189.3 38.2 57.9 24.5 109.9 59.6 154.6 104.2 44.7 44.7 79.7 96.7 104.2 154.6 25.4 59.9 38.2 123.6 38.2 189.3S986 641.6 960.7 701.5c-24.5 57.9-59.6 109.9-104.2 154.6-44.7 44.7-96.7 79.7-154.6 104.2-59.9 25.4-123.6 38.2-189.3 38.2s-129.4-12.9-189.3-38.2c-57.9-24.5-109.9-59.6-154.6-104.2-44.6-44.7-79.7-96.7-104.2-154.6-25.4-59.9-38.2-123.6-38.2-189.3s12.9-129.4 38.2-189.3C89 265 124.1 213 168.8 168.3c44.7-44.7 96.7-79.7 154.6-104.2C383.3 38.7 447 25.9 512.6 25.9m0-24.3C230.6 1.6 2 230.2 2 512.2s228.6 510.6 510.6 510.6 510.6-228.6 510.6-510.6S794.7 1.6 512.6 1.6z" fill="#bfbfbf" p-id="5215"></path></svg>';

    bool dialogOrPage = false;


    return ListView.builder(
      itemCount: widget.meun.length,
      itemBuilder: (BuildContext context, int index) {
        var item = widget.meun[index];
        var children = item['Children'];

        return Column(
          children: [
            // Text('种类: ${item['种类']}'),
            boxsize(maxHeight,maxWidth,item),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: children.length,
              itemBuilder: (BuildContext context, int childrenIndex) {
                var childrenItem = children[childrenIndex];
                var ImagesPath = jsonDecode(childrenItem['Images']);
                // print(ImagesPath[0] is String);
                return Container(
                  padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: Container(
                    height: 100,
                    width: maxWidth,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 242, 204, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:
                    Row(
                      children: [
                        drinksPhotos(maxHeight,maxWidth,ImagesPath), //产品图
                        poductInformationDescription(maxHeight,maxWidth,childrenItem,dialogOrPage,authProvider,ImagesPath), //产品信息描述框
                        Expanded(
                          child:showSaleData(maxHeight,maxWidth),
                        ), //评分和销售数信息
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
