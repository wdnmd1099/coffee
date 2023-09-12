import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffee/stateManage/stateManage.dart';

class OptionCardList extends StatefulWidget {
  final List optionList;
  final bool sameMode;
  final String changeOption;

  OptionCardList(
      {super.key,
      required this.optionList,
      required this.sameMode,
      required this.changeOption});

  @override
  State<OptionCardList> createState() => _OptionCardListState();
}

class _OptionCardListState extends State<OptionCardList> {
  Map showValues = {}; //当前选择的所有选项

  List showList = []; //用来显示的数组，用于切换状态时更新页面

  @override
  void initState() {
    super.initState();

    showList = widget.optionList[0];

    //下面三个遍历是为了把所有选项的默认值初始化，把所有的选项的第一项都记载到showValues（不分页面）
    test1(Map map) {
      map.forEach((key, value) {
        showValues[key] = value[0];
        // print(showValues);  //打开这行就可以
      });
    }

    test(list) {
      for (int i = 0; i < list.length; i++) {
        test1(list[i]);
      }
    }

    for (int i = 0; i < widget.optionList.length; i++) {
      test(widget.optionList[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return Container(
      height: maxHeight,
      width: maxWidth,
      child: Column(
        children: [
          Container(
            height: maxHeight * 0.9,
            width: maxWidth,
            child: ListView.builder(
              itemCount: showList.length, //数组长度
              itemBuilder: (BuildContext context, int index) {
                var item = showList[index]; //index是当前元素的下标，这样就指当前元素
                // print(item.keys.first);
                return Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.only(left: 8, top: 8),
                        child: Text(
                          '${item.keys.first}',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: Wrap(
                              direction: Axis.horizontal,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 8.0,
                              // 元素之间的间距
                              runSpacing: 8.0,
                              // 换行时行与行之间的间距
                              children: [
                                for (int i = 0; i < item[item.keys.first].length; i++)
                                  ElevatedButton(
                                    onPressed: () => {
                                      setState(() {
                                        if (item.keys.first ==
                                            widget.changeOption) {
                                          //实现切页
                                          showList = widget.optionList[i];
                                          //实现正确切换状态栏选项
                                          showValues.forEach((key, value) {
                                            if (key == item.keys.first) {
                                              showValues[key] =
                                              item[item.keys.first][i];
                                            }
                                            // print(showValues);
                                          });
                                        } else if (item.keys.first !=
                                            widget.changeOption) {
                                          //遍历showValues找到该选项的键，把新点击的值赋值给该键，实现选项的正确显示
                                          showValues.forEach((key, value) {
                                            if (key == item.keys.first) {
                                              showValues[key] =
                                              item[item.keys.first][i];
                                            }
                                            // print(showValues);
                                          });
                                        }
                                      })
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      backgroundColor:
                                      showValues[item.keys.first] ==
                                          item[item.keys.first][i]
                                          ? Colors.black
                                          : Colors.grey,
                                    ),
                                    child: Container(
                                      // color: Colors.black,
                                      child: Text('${item[item.keys.first][i]}'),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            height: maxHeight * 0.1,
            width: maxWidth,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red,
                  width: 2,
                ),
              ),
              // child: ,
            ),
          ),
        ],
      ),
    );
  }
}
