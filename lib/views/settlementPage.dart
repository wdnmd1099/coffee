import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';
import '../component/centerAppbar.dart';
import '../stateManage/stateManage.dart';

class SettlementPage extends StatefulWidget {
  const SettlementPage({super.key});

  @override
  State<SettlementPage> createState() =>
      _State();
}

class _State extends State<SettlementPage> {

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    final drinksOptions = Provider.of<DrinksOptions>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(maxHeight * 0.05), //Appbar高度
        child: CenterAppbar(
          titleName: '订单预览',
          back: true,
          center: false,
        ),
      ),
      body: Container(
        height: maxHeight,
        width: maxWidth,
        child: ListView(
          children: [
            for(int i=0;i<drinksOptions.getOptions.length;i++)
              Container(
                child: Row(
                  children: [
                    Container(
                      child: Text('${drinksOptions.getOptions[i]['name']},'
                          '数量：${drinksOptions.getOptions[i]['count']}，'
                          '冷/热：${drinksOptions.getOptions[i]['hotOrCold']}'),
                    ),
                  ],
                ),
              ),
            ElevatedButton(onPressed: (){
              drinksOptions.reset();
            }, child: Text('付款'))
          ],
        ),
      ),
    );
  }
}