import 'package:flutter/material.dart';
import 'package:coffee/component/centerAppbar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.titleName, this.toOrderPage}) : super(key: key);
  String? titleName;
  Function? toOrderPage;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(maxHeight * 0.05), //Appbar高度
        child: CenterAppbar(titleName: '首页',),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: ()=>{
                    widget.toOrderPage == null? null : widget.toOrderPage!()
                  },
                  child:  Container(
                    padding:
                    const EdgeInsets.only(left: 8, top: 8, right: 4, bottom: 8),
                    width: maxWidth / 2,
                    height: maxHeight / 4.5,
                    child: Container(
                      color: const Color.fromRGBO(158, 158, 158, 0.2),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: maxWidth / 22.4),
                            // color: Colors.green,
                            child: Icon(
                              Icons.lock,
                              size: maxHeight * 0.1,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: maxHeight * 0.01),
                            // color: Colors.yellow,
                            child: const Text(
                              '门店自取',
                              style: TextStyle(),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: maxHeight * 0.01),
                            // color: Colors.purple,
                            child: const Text(
                              'PICK UP',
                              style: TextStyle(fontSize: 8),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                Container(
                  padding:
                  const EdgeInsets.only(left: 8, top: 8, right: 4, bottom: 8),
                  width: maxWidth / 2,
                  height: maxHeight / 4.5,
                  child: Container(
                    color: const Color.fromRGBO(158, 158, 158, 0.2),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: maxWidth / 22.4),
                          // color: Colors.green,
                          child: Icon(
                            Icons.priority_high,
                            size: maxHeight * 0.1,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: maxHeight * 0.01),
                          // color: Colors.yellow,
                          child: const Text(
                            '充值优惠',
                            style: TextStyle(),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: maxHeight * 0.01),
                          // color: Colors.purple,
                          child: const Text(
                            'DEPOSIT',
                            style: TextStyle(fontSize: 8),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ), //门店自取和充值优惠
            Container(
              padding:
              const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 8),
              child: Container(
                width: maxWidth,
                height: maxHeight * 0.07,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(158, 158, 158, 0.2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color.fromRGBO(158, 158, 158, 0.2),
                    width: 0,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: maxWidth * 0.05),
                      // color: Colors.red,
                      child: const Icon(
                        Icons.navigation,
                        size: 21,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: maxWidth <= 345? maxWidth* 0.1 :  maxWidth* 0.25
                      ),
                      child: const Text(
                        '江门新会第一店',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: maxWidth * 0.05),
                        // color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 4),
                              // color:Colors.yellow,
                              child: const Icon(
                                Icons.attachment,
                                size: 20,
                              ),
                            ),
                            Container(
                              // padding: EdgeInsets.only(right: 4),
                              height: maxHeight * 0.02,
                              width: 0,

                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black, width: 0.25),
                              ),
                            ),
                            Container(
                              // color:Colors.yellow,
                              padding: const EdgeInsets.only(left: 4),
                              // height: maxWidth * 0.07,
                              child: const Text(
                                '切换',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ), //地图地址切换
            Container(
              padding:const EdgeInsets.all(8),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(20)),
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  "https://img2.baidu.com/it/u=2670376662,2835242121&fm=253&fmt=auto&app=138&f=JPEG?w=750&h=500",
                  width: double.maxFinite,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(20)),
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  "https://img0.baidu.com/it/u=10872846,711081482&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800",
                  width: double.maxFinite,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Container(
                width: maxWidth,
                height: maxHeight * 0.06,
                color: const Color.fromRGBO(239, 199, 110,0.5),
                child: const Center(
                  child: Text(
                    '24H 有电就能做',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );//首页
  }
}


























