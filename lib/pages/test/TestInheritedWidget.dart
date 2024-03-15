import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

// class MyHomePage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _MyHomePageState();
//   }
// }
//
class MyHomePageState extends State<MyHomePage> {
  int count = 0;

  void _incrementCounter() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //将CountContainer作为根节点，并使用0作为初始化count
    return CountContainer(
      child: Counter(),
      model: this,
      increment: _incrementCounter,
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CountContainer state = CountContainer.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidget demo"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'You have pushed the button this many times: ${state.model.count}', //关联数据读方法
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: state.increment,
      ),
    );
  }
}

// 类似单例，持有某个页面的数据 (State)
class CountContainer extends InheritedWidget {
  static CountContainer of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<CountContainer>() as CountContainer;
  // int count = 0;

  final MyHomePageState model; //直接使用MyHomePage中的State获取数据
  final Function() increment;

  CountContainer({Key? key, required this.model, required this.increment,  required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant CountContainer oldWidget) {
    return model.count != oldWidget.model.count;
  }
}
