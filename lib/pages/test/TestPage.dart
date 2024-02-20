import 'package:com.jc.livechat/pages/splash/SplashController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/LogTools.dart';
import 'StatefulWidgetTest.dart';
import 'StatelessWidgetTest.dart';

class TestPage extends GetView<SplashController> {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child:
      ShoppingList(
        products: [
          Product2(name: 'Eggs'),
          Product2(name: 'Flour'),
          Product2(name: 'Chocolate chips'),
        ],
      )
      // ShoppingListItem(
      //   product: const Product(name: 'Chips'),
      //   inCart: true,
      //   onCartChanged: (product, inCart) {},
      // ),
    ));
  }
}

