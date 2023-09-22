import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../component/centerAppbar.dart';
import '../stateManage/stateManage.dart';

class OptionsPage extends StatefulWidget {
  OptionsPage({super.key,required this.childrenItem,required this.ImagesPath });
  Map childrenItem;
  List ImagesPath;

  @override
  State<OptionsPage> createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  bool changeIcon = true;
  int count = 0;
  int allCount = 0;
  List temporaryList = []; //临时存放

  pushData(bool changeIcon_,int count_){
    setState(() {
      temporaryList.add({
        'count':count_,
        'name':'${widget.childrenItem['Name']}',
        'id':widget.childrenItem['Id'],
        'hotOrCold' : changeIcon_,
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    String yes = '<svg t="1695279358944" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="4022" data-spm-anchor-id="a313x.search_index.0.i5.69e93a81e2leGX" width="32" height="32"><path d="M512 0A512 512 0 1 1 0 512 512 512 0 0 1 512 0z" fill="#1afa29" p-id="4023" data-spm-anchor-id="a313x.search_index.0.i0.69e93a81e2leGX" class=""></path><path d="M438.857143 747.52a91.428571 91.428571 0 0 1-68.022857-30.354286L219.428571 548.571429a54.857143 54.857143 0 0 1 81.554286-73.142858L438.857143 629.028571l284.16-312.32a54.857143 54.857143 0 0 1 81.188571 73.142858l-297.691428 326.948571a91.794286 91.794286 0 0 1-67.657143 30.72z" fill="#ffffff" p-id="4024" data-spm-anchor-id="a313x.search_index.0.i2.69e93a81e2leGX" class="selected"></path></svg>';
    String no  = '<svg t="1695279526818" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5214" width="32" height="32"><path d="M512.6 25.9c65.7 0 129.4 12.9 189.3 38.2 57.9 24.5 109.9 59.6 154.6 104.2 44.7 44.7 79.7 96.7 104.2 154.6 25.4 59.9 38.2 123.6 38.2 189.3S986 641.6 960.7 701.5c-24.5 57.9-59.6 109.9-104.2 154.6-44.7 44.7-96.7 79.7-154.6 104.2-59.9 25.4-123.6 38.2-189.3 38.2s-129.4-12.9-189.3-38.2c-57.9-24.5-109.9-59.6-154.6-104.2-44.6-44.7-79.7-96.7-104.2-154.6-25.4-59.9-38.2-123.6-38.2-189.3s12.9-129.4 38.2-189.3C89 265 124.1 213 168.8 168.3c44.7-44.7 96.7-79.7 154.6-104.2C383.3 38.7 447 25.9 512.6 25.9m0-24.3C230.6 1.6 2 230.2 2 512.2s228.6 510.6 510.6 510.6 510.6-228.6 510.6-510.6S794.7 1.6 512.6 1.6z" fill="#bfbfbf" p-id="5215"></path></svg>';
    final drinksOptions = Provider.of<DrinksOptions>(context);


    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(maxHeight * 0.05), //Appbar高度
        child: CenterAppbar(
          titleName: '附加项选择',
          back: true,
          center: true,
        ),
      ), //头部
      body: Container(
        height: maxHeight,
        width: maxWidth,
        // color: Colors.red,
        child: ListView(
          children: [
            Container(
              height: maxHeight * 0.3,
              width: maxWidth,
              color: Colors.grey[200],
              child:
              Image.network('http://192.168.0.3:9000/rc-resource/${ widget.ImagesPath[0]}',
                fit: BoxFit.fitHeight,
              ),
            ),//图片
            Padding(padding: EdgeInsets.only(bottom: 12)),
            Container(
              width: maxWidth,
              alignment: Alignment.centerLeft,
              // padding: EdgeInsets.only(bottom: 12),
              // color: Colors.green,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: maxWidth * 0.15),
                    width: maxWidth,
                    alignment: Alignment.centerLeft,
                    // color:Colors.red,
                    child: Text('${widget.childrenItem['Name']}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: maxWidth * 0.15),
                    width: maxWidth,
                    alignment: Alignment.centerLeft,
                    child: Text('${widget.childrenItem['Desc']}',style: TextStyle(fontSize: 10),),
                  ),
                ],
              ),
            ), //描述
            Padding(padding: EdgeInsets.only(top: 12),),
            Container(
              height: 6,
              color: Colors.grey[200],
            ),//分割线
            Container(
              padding: EdgeInsets.only(top: 12),
              height: maxHeight * 0.2,
              width: maxWidth,
              // color: Colors.blueGrey,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left:maxWidth * 0.15 ),
                    // color: Colors.green,
                    width: maxWidth,
                    child: Text('冷/热:'),
                  ), //冷热文字
                  Container(
                    padding: EdgeInsets.only(left: maxWidth * 0.15,top:14),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              if(changeIcon == false){
                                changeIcon = !changeIcon;
                                print('${changeIcon}冷');
                              }else if(changeIcon == true){
                                print(changeIcon);
                              }
                            });
                          },
                          child:
                          Row(
                            children: [
                              SvgPicture.string(
                                changeIcon? yes : no, // 替换为您自己的 SVG 字符串
                                //colorFilter: ColorFilter.mode(Colors.green, BlendMode.modulate), //修改svg颜色
                                width: 24.0, // 设置 SVG 图像的宽度
                                height: 24.0, // 设置 SVG 图像的高度
                              ),
                              Text('冷'),
                              Padding(padding: EdgeInsets.only(right: 12),),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              if(changeIcon == true){
                                changeIcon = !changeIcon;
                                print('${changeIcon}热');
                              }else if(changeIcon == false){
                                print(changeIcon);
                              }
                            });
                          },
                          child: Row(
                            children: [
                              SvgPicture.string(
                                changeIcon? no : yes, // 替换为您自己的 SVG 字符串
                                // colorFilter: ColorFilter.mode(Colors.green, BlendMode.modulate), //修改svg颜色
                                width: 24.0, // 设置 SVG 图像的宽度
                                height: 24.0, // 设置 SVG 图像的高度
                              ),
                              Text('热'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ), //冷热Icon选项
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left:maxWidth * 0.15 + 55 ),
                      child: Row(
                        children: [
                          Text('￥${widget.childrenItem['Price']}'),
                          Expanded(child: Container(
                            padding: EdgeInsets.only(right: maxWidth * 0.1),
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                padding:  //内边距
                                MaterialStateProperty.all(EdgeInsets.only(left: 32,right: 32)),
                                shadowColor:  //阴影
                                MaterialStateProperty.all(Colors.transparent),
                                backgroundColor: // 背景色
                                MaterialStateProperty.all(Colors.lightGreen),
                              ),
                              onPressed: (){
                                setState(() {

                                  if(count == 0){
                                    showToast('尚未选择数量',
                                        duration:const Duration(milliseconds: 1000),
                                        textStyle:const TextStyle(fontSize: 12,color: Colors.white),
                                        context: context,
                                        animation: StyledToastAnimation.fade,
                                        curve: Curves.linear,
                                        reverseCurve: Curves.linear);
                                  }

                                  else if(count > 0){
                                    for(int i=0;i<temporaryList.length;i++){
                                      drinksOptions.changeOptions(temporaryList[i]);
                                      drinksOptions.addAllCount(true,
                                          count * double.parse(widget.childrenItem['Price'].toString()),
                                          count,
                                      );
                                    }
                                    // print(drinksOptions.getOptions);
                                    print(drinksOptions.getAllData);
                                    showToast('已添加到购物车',
                                        duration:const Duration(milliseconds: 1000),
                                        textStyle:const TextStyle(fontSize: 12,color: Colors.white),
                                        context: context,
                                        animation: StyledToastAnimation.fade,
                                        curve: Curves.linear,
                                        reverseCurve: Curves.linear);
                                    count = 0;
                                    temporaryList = [];
                                  }

                                });
                              },
                              child: const Text('加入购物车',style: TextStyle(fontSize: 12),),
                            ),
                          ),),
                        ],
                      ),
                    ),
                  ), //价钱和加入购物车

                ],
              ),
            ), //冷热选择
            Container(
              height: 6,
              color: Colors.grey[200],
            ),//分割线
            Padding(padding: EdgeInsets.only(top: 12),),
            Container(
              width: maxWidth,
              height: maxHeight * 0.06,
              // color: Colors.red,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: maxWidth * 0.15),
                    child: changeIcon?Text('冷'):Text('热'),
                  ),
                  Expanded(child: Container(
                    padding: EdgeInsets.only(right: maxWidth * 0.1),
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              if(count > 0){
                                count -= 1;
                                //减少饮料
                                temporaryList[0]['count'] -= 1;
                                // print(temporaryList);
                              }
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
                          child: Text('${count}'),
                        ), //数量显示
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              count += 1;
                               //首次添加饮料
                              if(temporaryList.isEmpty){
                                pushData(changeIcon,count);
                              }else if(temporaryList.isNotEmpty){
                                temporaryList[0]['count'] += 1;
                              }

                                // print(temporaryList);
                                // print(count);
                                // drinksOptions.addAllCount(true, double.parse(widget.childrenItem['Price'].toString()));
                                // print('添加饮料:${drinksOptions.getOptions}');
                                // print('饮料合计:${drinksOptions.getAllData}');


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
                  ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}