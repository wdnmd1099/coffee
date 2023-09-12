import 'package:flutter/material.dart';

class OptionCardList extends StatefulWidget {
  final List optionList;      // 所有导航所在的数组，即假设有三个导航，就需要传3个导航对应的List以供画出页面
  final bool sameMode;       // 有共有属性的模式
  final String changeOption; //导航选项title，即点击会切换页面的title，只允许一个
  String? btnTitle;
  Widget? btn; //提交按钮，不传就用默认的

  OptionCardList(
      {super.key,
      required this.optionList,
      required this.sameMode,
      required this.changeOption,
      this.btn,
        this.btnTitle,
      });

  @override
  State<OptionCardList> createState() => _OptionCardListState();
}

class _OptionCardListState extends State<OptionCardList> {
  Map showValues = {}; //当前选择的所有选项

  List showList = []; //用来显示的数组，用于切换状态时更新页面

  int stateIndex = 0;

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
    return Column(
      children: [
        Expanded(
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
                              for (int i = 0;
                                  i < item[item.keys.first].length;
                                  i++)
                                ElevatedButton(
                                  onPressed: () => {
                                    setState(() {
                                      if (item.keys.first == widget.changeOption) {
                                        stateIndex = i;
                                        //实现切页
                                        showList = widget.optionList[i];
                                        //实现正确切换状态栏选项
                                        showValues.forEach((key, value) {
                                          if (key == item.keys.first) {
                                            showValues[key] = item[item.keys.first][i];
                                          }
                                          // print(showValues);
                                        });
                                      } else if (item.keys.first != widget.changeOption) {
                                        //遍历showValues找到该选项的键，把新点击的值赋值给该键，实现选项的正确显示
                                        showValues.forEach((key, value) {
                                          if (key == item.keys.first) {
                                            showValues[key] = item[item.keys.first][i];
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
                                        showValues[item.keys.first] == item[item.keys.first][i]
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
          height: maxHeight * 0.06,
          child: widget.btn ??
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                color: Colors.white,
                child: GestureDetector(
                  onTap: () => {
                      test233(showValues,widget.optionList,stateIndex)
                  },
                  child: Center(
                    child: Container(
                      alignment: Alignment.center,
                      width: maxWidth * 0.8,
                      height: maxHeight * 0.04,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        widget.btnTitle??'提交',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ),
              ),
        ),
      ],
    );
  }
}


Map test233(Map map, List list, int selectedList){
  // print(map['状态']);
  // print();
  if(map == null || list == null || selectedList == null){
    throw 'optionCardList.dart 的函数传值为空';
  }
  List selected = list[selectedList];
  List hasOption = [];
  Map finalList = {};
  // print(selected);
  for(int i =0;i<selected.length;i++){
    // print(selected[i].keys.first);
    hasOption.add(selected[i].keys.first);
  }
  // print(hasOption);
map.forEach((key, value) {

  for(int i =0;i<hasOption.length;i++){
    if(hasOption[i] == key){
      finalList[key] = value;
      // print('cnm');
    }
  }
});

  print(finalList);
  return finalList;

}